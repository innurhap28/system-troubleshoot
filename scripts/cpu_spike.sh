#!/usr/bin/env bash
set -uo pipefail

# CPU 과점유 실험의 증거 수집기.
# Baseline: CPU_MAX_OCCUPY=80 등 높은 임계치에서 Watchdog 종료 여부 확인
# Adjusted: CPU_MAX_OCCUPY=10 등 낮은 임계치에서 앱의 부하 완화/쿨다운 및 생존 여부 확인
# 사용법: cpu_spike.sh <APP_PID> <APP_LOG> <OUTPUT_LOG>
# CPU_MAX_OCCUPY는 실행 환경변수로 전달합니다.

if [[ $# -ne 3 ]]; then
    echo "사용법: $0 <APP_PID> <APP_LOG> <OUTPUT_LOG>" >&2
    exit 2
fi

APP_PID="$1"
APP_LOG="$2"
OUTPUT_LOG="$3"
CSV_LOG="${OUTPUT_LOG%.log}.csv"
SAMPLE_SECONDS="${CPU_SAMPLE_SECONDS:-1}"
CPU_THRESHOLD="${CPU_MAX_OCCUPY:-unknown}"

if [[ ! "$APP_PID" =~ ^[0-9]+$ ]] || (( APP_PID < 1 )); then
    echo "오류: 올바른 PID가 아닙니다: $APP_PID" >&2
    exit 2
fi
if [[ ! "$SAMPLE_SECONDS" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! awk -v n="$SAMPLE_SECONDS" 'BEGIN { exit !(n > 0) }'; then
    echo "오류: CPU_SAMPLE_SECONDS는 양수여야 합니다: $SAMPLE_SECONDS" >&2
    exit 2
fi
if [[ "$CPU_THRESHOLD" != "unknown" ]] && {
    [[ ! "$CPU_THRESHOLD" =~ ^[0-9]+$ ]] || (( CPU_THRESHOLD < 10 || CPU_THRESHOLD > 100 ));
}; then
    echo "오류: CPU_MAX_OCCUPY는 10~100 사이의 정수여야 합니다: $CPU_THRESHOLD" >&2
    exit 2
fi

mkdir -p "$(dirname "$OUTPUT_LOG")" || exit 1
touch "$OUTPUT_LOG" || exit 1
STAMP="$(date '+%Y-%m-%d %H:%M:%S')"

# /proc/<pid>/stat의 utime+stime을 측정 구간 전후로 읽어 프로세스 CPU 사용률을 계산합니다.
# 이 값은 프로세스 기준이며 멀티코어에서는 100%를 초과할 수 있습니다.
CLK_TCK="$(getconf CLK_TCK 2>/dev/null || echo 100)"
PROCESS_CPU=""
ELAPSED=""
PROCESS_STATUS="RUNNING"
TICKS_BEFORE=""
TICKS_AFTER=""

read_cpu_ticks() {
    local stat_line rest
    stat_line="$(cat "/proc/${APP_PID}/stat" 2>/dev/null)" || return 1
    # comm 필드의 공백/괄호를 고려해 마지막 ') ' 뒤에서 필드를 읽습니다.
    rest="${stat_line##*) }"
    awk '{ printf "%.0f", $12 + $13 }' <<< "$rest"
}

if [[ ! -r "/proc/${APP_PID}/stat" ]]; then
    PROCESS_STATUS="EXITED_BEFORE_SAMPLE"
else
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

# 애플리케이션 내부 CpuWorker 지표는 OS의 PROCESS_CPU와 별도 지표로 보존합니다.
APP_CURRENT_LOAD=""
APP_CPU_LINES=""
WATCHDOG_LINES=""
COOLDOWN_LINES=""
if [[ -r "$APP_LOG" ]]; then
    APP_CURRENT_LOAD="$(grep -E 'CpuWorker.*Current Load|Current Load' "$APP_LOG" 2>/dev/null \
        | sed -E 's/.*Current Load[^0-9]*([0-9]+([.][0-9]+)?).*/\1/' \
        | tail -n 1 || true)"
    APP_CPU_LINES="$(grep -Ei 'CpuWorker|Current Load|CPU Threshold|CPU.*(Load|Usage|Percent)|cool.?down|throttl|recover' "$APP_LOG" 2>/dev/null | tail -n 20 || true)"
    WATCHDOG_LINES="$(grep -Ei 'WATCHDOG|EMERGENCY ABORT|SIGTERM|CPU Threshold Violated' "$APP_LOG" 2>/dev/null | tail -n 20 || true)"
    COOLDOWN_LINES="$(grep -Ei 'cool.?down|throttl|recover|CPU.*(normal|reduc|decreas)' "$APP_LOG" 2>/dev/null | tail -n 20 || true)"
fi

PS_CPU=""
PS_RSS=""
PS_STATE=""
if [[ -d "/proc/${APP_PID}" ]]; then
    read -r PS_CPU PS_RSS PS_STATE < <(ps -p "$APP_PID" -o %cpu=,rss=,stat= 2>/dev/null | awk '{$1=$1; print $1, $2, $3}')
fi

LOAD_1=""
LOAD_5=""
LOAD_15=""
if [[ -r /proc/loadavg ]]; then
    read -r LOAD_1 LOAD_5 LOAD_15 _ < /proc/loadavg || true
fi

# CSV 헤더에 실험 임계치와 Watchdog 감지 여부를 포함해 baseline/adjusted를 직접 비교할 수 있게 합니다.
if [[ ! -s "$CSV_LOG" ]]; then
    echo 'timestamp,pid,cpu_max_occupy,process_status,app_current_load,process_cpu_pct,elapsed_seconds,ps_cpu_avg_pct,ps_rss_kb,process_state,loadavg_1m,loadavg_5m,loadavg_15m,watchdog_detected' > "$CSV_LOG"
fi

WATCHDOG_DETECTED="false"
[[ -z "$WATCHDOG_LINES" ]] || WATCHDOG_DETECTED="true"

{
    echo
    echo "========== CPU SPIKE SNAPSHOT ${STAMP} =========="
    echo "EXPERIMENT_CPU_MAX_OCCUPY=${CPU_THRESHOLD}%"
    echo "PID=${APP_PID} PROCESS_STATUS=${PROCESS_STATUS}"
    if [[ -n "$PROCESS_CPU" ]]; then
        echo "PROCESS_CPU=${PROCESS_CPU}% SAMPLE_ELAPSED=${ELAPSED}s"
    else
        echo "PROCESS_CPU=UNAVAILABLE"
    fi
    echo "PS_CPU_AVG=${PS_CPU:-UNAVAILABLE}% PS_RSS=${PS_RSS:-UNAVAILABLE}KB PROCESS_STATE=${PS_STATE:-UNAVAILABLE}"
    echo "APP_CURRENT_LOAD=${APP_CURRENT_LOAD:-UNAVAILABLE} (application-internal metric; not OS CPU%)"
    echo "HOST_LOAD_AVERAGE_1M_5M_15M=${LOAD_1:-UNAVAILABLE},${LOAD_5:-UNAVAILABLE},${LOAD_15:-UNAVAILABLE}"
    echo "WATCHDOG_EVIDENCE_DETECTED=${WATCHDOG_DETECTED}"

    echo '--- Process snapshot (ps) ---'
    ps -o pid,ppid,pcpu,rss,vsz,stat,nice,etime,cmd -p "$APP_PID" 2>&1 || true

    echo '--- Host load average (/proc/loadavg) ---'
    if [[ -r /proc/loadavg ]]; then cat /proc/loadavg; else echo 'UNAVAILABLE'; fi

    echo '--- Host top snapshot ---'
    if command -v top >/dev/null 2>&1; then
        top -b -n 1 -p "$APP_PID" 2>&1 | sed -n '1,20p' || true
    else
        echo 'top command unavailable'
    fi

    echo '--- Application CPU / cooldown evidence ---'
    if [[ -n "$APP_CPU_LINES" ]]; then printf '%s\n' "$APP_CPU_LINES"; else echo 'No matching CPU worker/load/cooldown lines found.'; fi

    echo '--- Watchdog / termination evidence ---'
    if [[ -n "$WATCHDOG_LINES" ]]; then printf '%s\n' "$WATCHDOG_LINES"; else echo 'No Watchdog/termination line found in the application log at this sample.'; fi

    echo '--- Cooldown / recovery evidence ---'
    if [[ -n "$COOLDOWN_LINES" ]]; then printf '%s\n' "$COOLDOWN_LINES"; else echo 'No explicit cooldown/recovery line found; compare successive APP_CURRENT_LOAD and PROCESS_CPU samples.'; fi
    echo '========== END CPU SPIKE SNAPSHOT =========='
} >> "$OUTPUT_LOG" 2>&1

# CSV는 수집 불가 항목을 빈 칸으로 두고, 수치/상태를 행 단위로 누적합니다.
printf '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n' \
    "$STAMP" "$APP_PID" "$CPU_THRESHOLD" "$PROCESS_STATUS" "$APP_CURRENT_LOAD" \
    "$PROCESS_CPU" "$ELAPSED" "$PS_CPU" "$PS_RSS" "$PS_STATE" \
    "$LOAD_1" "$LOAD_5" "$LOAD_15" "$WATCHDOG_DETECTED" >> "$CSV_LOG"
