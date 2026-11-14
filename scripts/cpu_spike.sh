#!/usr/bin/env bash
set -uo pipefail

# 애플리케이션 내부 CPU 부하, 프로세스 CPU 사용률, 시스템 부하를 구분해 수집합니다.
# 사용법: cpu_spike.sh <APP_PID> <APP_LOG> <OUTPUT_LOG>

if [[ $# -ne 3 ]]; then
    echo "사용법: $0 <APP_PID> <APP_LOG> <OUTPUT_LOG>" >&2
    exit 2
fi

APP_PID="$1"
APP_LOG="$2"
OUTPUT_LOG="$3"
CSV_LOG="${OUTPUT_LOG%.log}.csv"
SAMPLE_SECONDS="${CPU_SAMPLE_SECONDS:-1}"

if [[ ! "$APP_PID" =~ ^[0-9]+$ ]] || (( APP_PID < 1 )); then
    echo "오류: 올바른 PID가 아닙니다: $APP_PID" >&2
    exit 2
fi
if [[ ! "$SAMPLE_SECONDS" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! awk -v n="$SAMPLE_SECONDS" 'BEGIN { exit !(n > 0) }'; then
    echo "오류: CPU_SAMPLE_SECONDS는 양수여야 합니다: $SAMPLE_SECONDS" >&2
    exit 2
fi

mkdir -p "$(dirname "$OUTPUT_LOG")" || exit 1
touch "$OUTPUT_LOG" || exit 1
STAMP="$(date '+%Y-%m-%d %H:%M:%S')"

# 앱 로그에서 마지막 Current Load 수치를 추출합니다. 앱 내부 지표이며 OS CPU%와 별개입니다.
APP_CURRENT_LOAD=""
if [[ -r "$APP_LOG" ]]; then
    APP_CURRENT_LOAD="$(grep -E 'CpuWorker.*Current Load|Current Load' "$APP_LOG" 2>/dev/null \
        | sed -E 's/.*Current Load[^0-9]*([0-9]+([.][0-9]+)?).*/\1/' \
        | tail -n 1)"
fi

APP_THRESHOLD_LINES=""
if [[ -r "$APP_LOG" ]]; then
    APP_THRESHOLD_LINES="$(grep -Ei 'CPU Threshold Violated|WATCHDOG|EMERGENCY ABORT|SIGTERM' "$APP_LOG" 2>/dev/null | tail -n 12 || true)"
fi

PROCESS_CPU=""
ELAPSED=""
PROCESS_STATUS="RUNNING"
CLK_TCK="$(getconf CLK_TCK 2>/dev/null || echo 100)"

if [[ ! -r "/proc/${APP_PID}/stat" ]]; then
    PROCESS_STATUS="EXITED_BEFORE_SAMPLE"
else
    # comm 필드에 공백/괄호가 들어갈 수 있으므로 마지막 ') ' 뒤에서 필드를 읽습니다.
    read_cpu_ticks() {
        local stat_line rest
        stat_line="$(cat "/proc/${APP_PID}/stat" 2>/dev/null)" || return 1
        rest="${stat_line##*) }"
        awk '{ printf "%.0f", $12 + $13 }' <<< "$rest"
    }

    TICKS_BEFORE="$(read_cpu_ticks)" || PROCESS_STATUS="EXITED_DURING_SAMPLE_START"
    if [[ "$PROCESS_STATUS" == "RUNNING" ]]; then
        TIME_BEFORE="$(date +%s%N)"
        sleep "$SAMPLE_SECONDS"
        TICKS_AFTER="$(read_cpu_ticks)" || PROCESS_STATUS="EXITED_DURING_SAMPLE"
        TIME_AFTER="$(date +%s%N)"
        if [[ "$PROCESS_STATUS" == "RUNNING" ]]; then
            read -r PROCESS_CPU ELAPSED < <(awk \
                -v before="$TICKS_BEFORE" -v after="$TICKS_AFTER" \
                -v tck="$CLK_TCK" -v start="$TIME_BEFORE" -v end="$TIME_AFTER" \
                'BEGIN {
                    elapsed = (end - start) / 1000000000;
                    cpu = elapsed > 0 ? ((after - before) / tck) / elapsed * 100 : 0;
                    if (cpu < 0) cpu = 0;
                    printf "%.2f %.2f\n", cpu, elapsed;
                }')
        fi
    fi
fi

{
    printf '[%s] PID=%s PROCESS_STATUS=%s' "$STAMP" "$APP_PID" "$PROCESS_STATUS"
    [[ -z "$PROCESS_CPU" ]] || printf ' PROCESS_CPU=%.2f%% ELAPSED=%ss' "$PROCESS_CPU" "$ELAPSED"
    printf '\n'

    if [[ -n "$APP_CURRENT_LOAD" ]]; then
        printf '[%s] PID=%s APP_CURRENT_LOAD=%s (application-internal metric)\n' "$STAMP" "$APP_PID" "$APP_CURRENT_LOAD"
    else
        printf '[%s] PID=%s APP_CURRENT_LOAD=UNAVAILABLE\n' "$STAMP" "$APP_PID"
    fi

    echo '--- Process snapshot (ps) ---'
    ps -o pid,ppid,pcpu,rss,vsz,stat,nice,etime,cmd -p "$APP_PID" 2>&1 || true

    echo '--- Host load average (/proc/loadavg) ---'
    if [[ -r /proc/loadavg ]]; then
        cat /proc/loadavg
    else
        echo 'UNAVAILABLE'
    fi

    echo '--- Host top snapshot ---'
    if command -v top >/dev/null 2>&1; then
        top -b -n 1 -p "$APP_PID" 2>&1 | sed -n '1,20p' || true
    else
        echo 'top command unavailable'
    fi

    echo '--- Application CPU/Watchdog log evidence ---'
    if [[ -n "$APP_THRESHOLD_LINES" ]]; then
        printf '%s\n' "$APP_THRESHOLD_LINES"
    else
        echo 'No CPU threshold / Watchdog evidence found in the current application log.'
    fi
} >> "$OUTPUT_LOG"

if [[ ! -s "$CSV_LOG" ]]; then
    echo 'timestamp,pid,process_status,app_current_load,process_cpu_pct,elapsed_seconds,ps_cpu_avg_pct,loadavg_1m,loadavg_5m,loadavg_15m' > "$CSV_LOG"
fi

PS_CPU=""
if [[ "$PROCESS_STATUS" == "RUNNING" ]]; then
    PS_CPU="$(ps -p "$APP_PID" -o %cpu= 2>/dev/null | awk '{$1=$1; print $1}')"
fi
read -r LOAD_1 LOAD_5 LOAD_15 _ < /proc/loadavg 2>/dev/null || true

# CSV 값은 수집할 수 없는 경우 빈 칸으로 둡니다.
printf '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n' \
    "$STAMP" "$APP_PID" "$PROCESS_STATUS" "$APP_CURRENT_LOAD" \
    "$PROCESS_CPU" "$ELAPSED" "$PS_CPU" "$LOAD_1" "$LOAD_5" "$LOAD_15" >> "$CSV_LOG"
