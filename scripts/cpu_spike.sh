#!/usr/bin/env bash
set -uo pipefail

# agent-leak-app 프로세스의 순간 CPU 사용률을 측정해 CPU Spike 증거로 저장합니다.
# CPU 부하 자체는 제공된 애플리케이션 내부 기능이 유도한다고 가정합니다.

if [[ $# -ne 2 ]]; then
    echo "사용법: $0 <APP_PID> <OUTPUT_LOG>" >&2
    exit 2
fi

APP_PID="$1"
OUTPUT_LOG="$2"

if [[ ! "$APP_PID" =~ ^[0-9]+$ ]] || (( APP_PID < 1 )); then
    echo "오류: 올바른 PID가 아닙니다: $APP_PID" >&2
    exit 2
fi

if [[ ! -r "/proc/${APP_PID}/stat" ]]; then
    printf '[%s] PID=%s STATUS=EXITED\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$APP_PID" >> "$OUTPUT_LOG"
    exit 0
fi

CLK_TCK="$(getconf CLK_TCK 2>/dev/null || echo 100)"

# /proc/<pid>/stat의 comm 필드에는 공백과 괄호가 들어갈 수 있으므로
# 마지막 ") " 뒤에서 utime(12번째), stime(13번째) 값을 읽습니다.
read_cpu_ticks() {
    local stat_line rest
    stat_line="$(cat "/proc/${APP_PID}/stat" 2>/dev/null)" || return 1
    rest="${stat_line##*) }"
    awk '{ print $12 + $13 }' <<< "$rest"
}

TICKS_BEFORE="$(read_cpu_ticks)" || {
    printf '[%s] PID=%s STATUS=EXITED_DURING_SAMPLE\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$APP_PID" >> "$OUTPUT_LOG"
    exit 0
}
TIME_BEFORE="$(date +%s%N)"
sleep "${CPU_SAMPLE_SECONDS:-1}"
TICKS_AFTER="$(read_cpu_ticks)" || {
    printf '[%s] PID=%s STATUS=EXITED_DURING_SAMPLE\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$APP_PID" >> "$OUTPUT_LOG"
    exit 0
}
TIME_AFTER="$(date +%s%N)"

awk -v pid="$APP_PID" \
    -v before="$TICKS_BEFORE" -v after="$TICKS_AFTER" \
    -v tck="$CLK_TCK" -v start="$TIME_BEFORE" -v end="$TIME_AFTER" \
    -v stamp="$(date '+%Y-%m-%d %H:%M:%S')" \
    'BEGIN {
        elapsed = (end - start) / 1000000000;
        cpu = elapsed > 0 ? ((after - before) / tck) / elapsed * 100 : 0;
        if (cpu < 0) cpu = 0;
        printf "[%s] PID=%s PROCESS_CPU=%.2f%% ELAPSED=%.2fs\n", stamp, pid, cpu, elapsed;
    }' >> "$OUTPUT_LOG"

# 같은 시점의 ps 값도 남겨 기존 process snapshot과 교차 확인할 수 있게 합니다.
ps -p "$APP_PID" -o pid=,stat=,%cpu=,%mem=,etime=,comm= \
    | awk -v stamp="$(date '+%Y-%m-%d %H:%M:%S')" \
        '{ printf "[%s] PS PID=%s STAT=%s CPU_AVG=%s%% MEM=%s%% ELAPSED=%s COMMAND=%s\n", stamp, $1, $2, $3, $4, $5, $6 }' \
    >> "$OUTPUT_LOG" 2>/dev/null || true
