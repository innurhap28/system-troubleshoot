#!/usr/bin/env bash
set -uo pipefail

# OOM 전용 증거 수집기.
# 사용법: oom_test.sh <APP_PID> <MEMORY_LIMIT_MB> <APPLICATION_LOG> <OUTPUT_LOG>

if [[ $# -ne 4 ]]; then
    echo "사용법: $0 <APP_PID> <MEMORY_LIMIT_MB> <APPLICATION_LOG> <OUTPUT_LOG>" >&2
    exit 2
fi

APP_PID="$1"
MEMORY_LIMIT_MB="$2"
APP_LOG="$3"
OUTPUT_LOG="$4"

if [[ ! "$APP_PID" =~ ^[0-9]+$ ]] || (( APP_PID < 1 )); then
    echo "오류: 올바르지 않은 PID입니다: $APP_PID" >&2
    exit 2
fi

if [[ ! "$MEMORY_LIMIT_MB" =~ ^[0-9]+$ ]] || (( MEMORY_LIMIT_MB < 1 )); then
    echo "오류: MEMORY_LIMIT_MB는 양의 정수여야 합니다." >&2
    exit 2
fi

mkdir -p "$(dirname "$OUTPUT_LOG")"

{
    echo
    echo "========== OOM SNAPSHOT $(date '+%Y-%m-%d %H:%M:%S') =========="
    echo "CONFIGURED_MEMORY_LIMIT_MB=${MEMORY_LIMIT_MB}"

    if [[ ! -r "/proc/${APP_PID}/status" ]]; then
        echo "PROCESS_STATUS: PID ${APP_PID} is not present in /proc"
    else
        echo "PROCESS_STATUS: PID ${APP_PID} is present"
        ps -p "$APP_PID" -o pid,ppid,stat,%cpu,%mem,rss,vsz,etime,wchan:24,comm,args

        echo "----- Process memory from /proc -----"
        awk -v limit="$MEMORY_LIMIT_MB" '
            /^Name:/     { name = $2 }
            /^State:/    { state = $2 }
            /^VmPeak:/   { peak = $2 }
            /^VmSize:/   { size = $2 }
            /^VmRSS:/    { rss = $2 }
            /^VmHWM:/    { hwm = $2 }
            END {
                printf "NAME=%s STATE=%s VmPeak_kB=%s VmSize_kB=%s VmRSS_kB=%s VmHWM_kB=%s\n",
                    name, state, peak, size, rss, hwm
                if (rss ~ /^[0-9]+$/) {
                    printf "PROCESS_RSS_MB=%.2f\n", rss / 1024
                    printf "RSS_VS_CONFIGURED_LIMIT_ESTIMATE=%.1f%%\n", (rss / 1024) / limit * 100
                }
            }
        ' "/proc/${APP_PID}/status"
    fi

    echo "----- System memory -----"
    awk '/^(MemTotal|MemAvailable|MemFree|SwapTotal|SwapFree):/ { print }' /proc/meminfo 2>/dev/null || true

    echo "----- MemoryGuard / termination log evidence -----"
    if [[ -r "$APP_LOG" ]]; then
        grep -Ei 'MemoryGuard|memory limit|SELF-TERMINATED|out of memory|oom' "$APP_LOG" | tail -n 20 || true
        echo "----- Last application log lines -----"
        tail -n 10 "$APP_LOG"
    else
        echo "Application log not found: $APP_LOG"
    fi

    echo "========== END OOM SNAPSHOT =========="
} >> "$OUTPUT_LOG" 2>&1
