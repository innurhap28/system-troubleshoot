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
CSV_LOG="${OUTPUT_LOG%.log}.csv"

if [[ ! "$APP_PID" =~ ^[0-9]+$ ]] || (( APP_PID < 1 )); then
    echo "오류: 올바르지 않은 PID입니다: $APP_PID" >&2
    exit 2
fi

if [[ ! "$MEMORY_LIMIT_MB" =~ ^[0-9]+$ ]] || (( MEMORY_LIMIT_MB < 1 )); then
    echo "오류: MEMORY_LIMIT_MB는 양의 정수여야 합니다." >&2
    exit 2
fi

mkdir -p "$(dirname "$OUTPUT_LOG")" || {
    echo "오류: 출력 디렉터리를 생성할 수 없습니다." >&2
    exit 1
}

TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"
PROC_STATUS="/proc/${APP_PID}/status"
SMAPS_ROLLUP="/proc/${APP_PID}/smaps_rollup"

# CSV는 스냅샷별 핵심 수치를 누적해 메모리 증가 추세를 비교하기 위한 자료입니다.
if [[ ! -s "$CSV_LOG" ]]; then
    echo 'timestamp,pid,state,rss_mb,vmsize_mb,peak_rss_mb,private_dirty_mb,pss_mb,configured_limit_mb,rss_limit_estimate_pct' > "$CSV_LOG"
fi

STATE=""
RSS_KB=""
VSIZE_KB=""
PEAK_RSS_KB=""
PRIVATE_DIRTY_KB=""
PSS_KB=""

if [[ -r "$PROC_STATUS" ]]; then
    read -r STATE RSS_KB VSIZE_KB PEAK_RSS_KB < <(
        awk '
            /^State:/  { state=$2 }
            /^VmRSS:/  { rss=$2 }
            /^VmSize:/ { size=$2 }
            /^VmHWM:/  { peak=$2 }
            END { print state, rss, size, peak }
        ' "$PROC_STATUS"
    )

    if [[ -r "$SMAPS_ROLLUP" ]]; then
        read -r PRIVATE_DIRTY_KB PSS_KB < <(
            awk '
                /^Private_Dirty:/ { private_dirty=$2 }
                /^Pss:/           { pss=$2 }
                END { print private_dirty, pss }
            ' "$SMAPS_ROLLUP"
        )
    fi
fi

to_mb() {
    local value="${1:-}"
    if [[ "$value" =~ ^[0-9]+$ ]]; then
        awk -v kb="$value" 'BEGIN { printf "%.2f", kb / 1024 }'
    fi
}

RSS_MB="$(to_mb "$RSS_KB")"
VSIZE_MB="$(to_mb "$VSIZE_KB")"
PEAK_RSS_MB="$(to_mb "$PEAK_RSS_KB")"
PRIVATE_DIRTY_MB="$(to_mb "$PRIVATE_DIRTY_KB")"
PSS_MB="$(to_mb "$PSS_KB")"
RSS_LIMIT_PCT=""

if [[ -n "$RSS_MB" ]]; then
    RSS_LIMIT_PCT="$(awk -v rss="$RSS_MB" -v limit="$MEMORY_LIMIT_MB" \
        'BEGIN { if (limit > 0) printf "%.1f", rss / limit * 100 }')"
fi

{
    echo
    echo "========== OOM SNAPSHOT ${TIMESTAMP} =========="
    echo "CONFIGURED_MEMORY_LIMIT_MB=${MEMORY_LIMIT_MB}"

    if [[ ! -r "$PROC_STATUS" ]]; then
        echo "PROCESS_STATUS: PID ${APP_PID} is not present in /proc"
    else
        echo "PROCESS_STATUS: PID ${APP_PID} is present"
        echo "----- Process information (ps) -----"
        ps -p "$APP_PID" -o pid,ppid,stat,%cpu,%mem,rss,vsz,etime,wchan:24,comm,args 2>&1 || true

        echo "----- Process memory from /proc/${APP_PID}/status -----"
        awk -v limit="$MEMORY_LIMIT_MB" '
            /^Name:/   { name=$2 }
            /^State:/  { state=$2 }
            /^VmPeak:/ { peak=$2 }
            /^VmSize:/ { size=$2 }
            /^VmRSS:/  { rss=$2 }
            /^VmHWM:/  { hwm=$2 }
            END {
                printf "NAME=%s STATE=%s VmPeak_kB=%s VmSize_kB=%s VmRSS_kB=%s VmHWM_kB=%s\n",
                    name, state, peak, size, rss, hwm
                if (rss ~ /^[0-9]+$/) {
                    printf "PROCESS_RSS_MB=%.2f\n", rss / 1024
                    printf "RSS_VS_CONFIGURED_LIMIT_ESTIMATE=%.1f%%\n", (rss / 1024) / limit * 100
                }
            }
        ' "$PROC_STATUS"

        echo "----- Detailed memory from smaps_rollup -----"
        if [[ -r "$SMAPS_ROLLUP" ]]; then
            grep -E '^(Rss|Pss|Pss_Anon|Pss_File|Private_Clean|Private_Dirty|Shared_Clean|Shared_Dirty):' \
                "$SMAPS_ROLLUP" || true
        else
            echo "smaps_rollup unavailable (kernel, permissions, or process state)"
        fi
    fi

    echo "----- System memory (free -h) -----"
    if command -v free >/dev/null 2>&1; then
        free -h 2>&1 || true
    else
        echo "free command unavailable"
    fi

    echo "----- System memory (/proc/meminfo) -----"
    awk '/^(MemTotal|MemAvailable|MemFree|SwapTotal|SwapFree):/ { print }' \
        /proc/meminfo 2>/dev/null || true

    echo "----- Top RSS processes -----"
    ps -eo pid,rss,pmem,comm --sort=-rss 2>/dev/null | head -n 8 || true

    echo "----- MemoryGuard / termination log evidence -----"
    if [[ -r "$APP_LOG" ]]; then
        grep -Ei 'MemoryGuard|memory limit|SELF-TERMINATED|out of memory|oom' \
            "$APP_LOG" | tail -n 20 || true
        echo "----- Last application log lines -----"
        tail -n 10 "$APP_LOG" || true
    else
        echo "Application log not found: $APP_LOG"
    fi

    echo "========== END OOM SNAPSHOT =========="
} >> "$OUTPUT_LOG" 2>&1

printf '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n' \
    "$TIMESTAMP" "$APP_PID" "${STATE:-}" "${RSS_MB:-}" "${VSIZE_MB:-}" \
    "${PEAK_RSS_MB:-}" "${PRIVATE_DIRTY_MB:-}" "${PSS_MB:-}" \
    "$MEMORY_LIMIT_MB" "${RSS_LIMIT_PCT:-}" >> "$CSV_LOG"
