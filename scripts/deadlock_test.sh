#!/usr/bin/env bash
set -uo pipefail

# Deadlock 전용 증거 수집기.
# 사용법: deadlock_test.sh <APP_PID> <APPLICATION_LOG> <OUTPUT_LOG>

if [[ $# -ne 3 ]]; then
    echo "사용법: $0 <APP_PID> <APPLICATION_LOG> <OUTPUT_LOG>" >&2
    exit 2
fi

APP_PID="$1"
APP_LOG="$2"
OUTPUT_LOG="$3"

if [[ ! "$APP_PID" =~ ^[0-9]+$ ]]; then
    echo "오류: APP_PID는 양의 정수여야 합니다." >&2
    exit 2
fi

mkdir -p "$(dirname "$OUTPUT_LOG")"

{
    echo
    echo "========== DEADLOCK SNAPSHOT $(date '+%Y-%m-%d %H:%M:%S') =========="

    if ! kill -0 "$APP_PID" 2>/dev/null; then
        echo "PROCESS_STATUS: PID ${APP_PID} is not running"
    else
        echo "PROCESS_STATUS: PID ${APP_PID} is alive"

        echo "----- Process state -----"
        ps -p "$APP_PID" -o pid,ppid,stat,%cpu,%mem,rss,vsz,etime,wchan:32,comm,args

        echo "----- Thread state (TID / STAT / CPU / wait channel) -----"
        ps -L -p "$APP_PID" -o pid,tid,stat,%cpu,%mem,wchan:32,comm

        echo "----- Thread details from /proc -----"
        for task_dir in "/proc/${APP_PID}"/task/*; do
            [[ -d "$task_dir" ]] || continue
            tid="${task_dir##*/}"
            state="$(awk '/^State:/ {print $2}' "${task_dir}/status" 2>/dev/null || true)"
            wchan="$(cat "${task_dir}/wchan" 2>/dev/null || echo unavailable)"
            printf 'TID=%s STATE=%s WCHAN=%s\n' "$tid" "${state:-unknown}" "$wchan"
        done

        echo "----- Thread-level top -----"
        top -H -b -n 1 -p "$APP_PID" 2>&1 | sed -n '1,35p'
    fi

    echo "----- Last application log lines -----"
    if [[ -f "$APP_LOG" ]]; then
        tail -n 25 "$APP_LOG"
    else
        echo "Application log not found: $APP_LOG"
    fi

    echo "========== END DEADLOCK SNAPSHOT =========="
} >> "$OUTPUT_LOG" 2>&1
