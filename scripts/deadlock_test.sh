#!/usr/bin/env bash
set -uo pipefail

# Deadlock 진단 증거를 반복 수집합니다.
# 사용법: deadlock_test.sh <APP_PID> <APPLICATION_LOG> <OUTPUT_LOG>
# 주의: SUSPECTED_STALL은 정체 징후이며, 이 스크립트만으로 교착상태를 확정하지 않습니다.

if [[ $# -ne 3 ]]; then
    echo "사용법: $0 <APP_PID> <APPLICATION_LOG> <OUTPUT_LOG>" >&2
    exit 2
fi

APP_PID="$1"
APP_LOG="$2"
OUTPUT_LOG="$3"

if [[ ! "$APP_PID" =~ ^[0-9]+$ ]] || (( APP_PID < 1 )); then
    echo "오류: APP_PID는 양의 정수여야 합니다." >&2
    exit 2
fi

OUTPUT_DIR="$(dirname "$OUTPUT_LOG")"
mkdir -p "$OUTPUT_DIR" || exit 1
CSV_FILE="${OUTPUT_LOG%.log}.csv"
STATE_FILE="${OUTPUT_LOG%.log}.state"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"
NOW_EPOCH="$(date +%s)"
STALL_THRESHOLD="${DEADLOCK_STALL_SECONDS:-30}"

if [[ ! "$STALL_THRESHOLD" =~ ^[0-9]+$ ]] || (( STALL_THRESHOLD < 1 )); then
    echo "오류: DEADLOCK_STALL_SECONDS는 1 이상의 정수여야 합니다." >&2
    exit 2
fi

if [[ ! -f "$CSV_FILE" ]]; then
    echo 'timestamp,pid,multi_thread_enable,process_state,threads,rss_kb,rss_delta_kb,voluntary_ctxt_switches,nonvoluntary_ctxt_switches,cpu_ticks,cpu_ticks_delta,app_log_bytes,app_log_mtime_epoch,stall_seconds,deadlock_log_match,classification' > "$CSV_FILE"
fi

read_process_ticks() {
    local stat_line rest
    stat_line="$(cat "/proc/${APP_PID}/stat" 2>/dev/null)" || return 1
    # comm 필드에는 공백과 괄호가 포함될 수 있어 마지막 ") " 뒤에서 파싱합니다.
    rest="${stat_line##*) }"
    awk '{ print $12 + $13 }' <<< "$rest"
}

read_status_value() {
    local key="$1"
    awk -v key="$key" '$1 == key ":" { print $2; exit }' "/proc/${APP_PID}/status" 2>/dev/null
}

append_snapshot_header() {
    {
        echo
        echo "========== DEADLOCK SNAPSHOT ${TIMESTAMP} =========="
        echo "PID: ${APP_PID}"
        echo "MULTI_THREAD_ENABLE: ${MULTI_THREAD_ENABLE:-unknown}"
        echo "STALL_THRESHOLD_SECONDS: ${STALL_THRESHOLD}"
    } >> "$OUTPUT_LOG"
}

if [[ ! -d "/proc/${APP_PID}" ]] || ! kill -0 "$APP_PID" 2>/dev/null; then
    append_snapshot_header
    {
        echo "PROCESS_STATUS: EXITED"
        if [[ -f "$APP_LOG" ]]; then
            echo "----- Last application log lines -----"
            tail -n 40 "$APP_LOG"
        else
            echo "Application log not found: $APP_LOG"
        fi
        echo "========== END DEADLOCK SNAPSHOT =========="
    } >> "$OUTPUT_LOG" 2>&1
    printf '%s,%s,%s,EXITED,,,,,,,,,,,,PROCESS_EXITED\n' \
        "$TIMESTAMP" "$APP_PID" "${MULTI_THREAD_ENABLE:-unknown}" >> "$CSV_FILE"
    rm -f "$STATE_FILE"
    exit 0
fi

PROCESS_STATE="$(read_status_value State)"
THREADS="$(read_status_value Threads)"
RSS_KB="$(read_status_value VmRSS)"
VOLUNTARY="$(read_status_value voluntary_ctxt_switches)"
NONVOLUNTARY="$(read_status_value nonvoluntary_ctxt_switches)"
CPU_TICKS="$(read_process_ticks 2>/dev/null || true)"

if [[ -f "$APP_LOG" ]]; then
    APP_LOG_BYTES="$(stat -c '%s' "$APP_LOG" 2>/dev/null || echo 0)"
    APP_LOG_MTIME="$(stat -c '%Y' "$APP_LOG" 2>/dev/null || echo 0)"
    DEADLOCK_LOG_MATCH="$(grep -Eiq 'DEADLOCK|deadlock detected|circular wait' "$APP_LOG" && echo true || echo false)"
else
    APP_LOG_BYTES=0
    APP_LOG_MTIME=0
    DEADLOCK_LOG_MATCH=false
fi

# 이전 관측값: CPU tick, 로그 크기/수정 시각, RSS, 정체 시작 시각
PREV_TICKS=''
PREV_BYTES=''
PREV_MTIME=''
PREV_RSS=''
STALL_START="$NOW_EPOCH"
if [[ -r "$STATE_FILE" ]]; then
    read -r PREV_TICKS PREV_BYTES PREV_MTIME PREV_RSS PREV_STALL_START < "$STATE_FILE" || true
    [[ "${PREV_STALL_START:-}" =~ ^[0-9]+$ ]] && STALL_START="$PREV_STALL_START"
fi

CPU_TICKS_DELTA=''
RSS_DELTA_KB=''
if [[ "$PREV_TICKS" =~ ^[0-9]+$ && "$CPU_TICKS" =~ ^[0-9]+$ ]]; then
    CPU_TICKS_DELTA=$(( CPU_TICKS - PREV_TICKS ))
fi
if [[ "$PREV_RSS" =~ ^[0-9]+$ && "$RSS_KB" =~ ^[0-9]+$ ]]; then
    RSS_DELTA_KB=$(( RSS_KB - PREV_RSS ))
fi

CLASSIFICATION='OBSERVING'
STALL_SECONDS=0
if [[ "$PREV_TICKS" =~ ^[0-9]+$ && "$PREV_BYTES" =~ ^[0-9]+$ && \
      "$PREV_MTIME" =~ ^[0-9]+$ && "$PREV_RSS" =~ ^[0-9]+$ && \
      "$CPU_TICKS" =~ ^[0-9]+$ && "$RSS_KB" =~ ^[0-9]+$ && \
      "$CPU_TICKS" == "$PREV_TICKS" && "$RSS_KB" == "$PREV_RSS" && \
      "$APP_LOG_BYTES" == "$PREV_BYTES" && "$APP_LOG_MTIME" == "$PREV_MTIME" ]]; then
    STALL_SECONDS=$(( NOW_EPOCH - STALL_START ))
    if (( STALL_SECONDS >= STALL_THRESHOLD )); then
        CLASSIFICATION='SUSPECTED_STALL'
    fi
else
    STALL_START="$NOW_EPOCH"
fi

if [[ "$DEADLOCK_LOG_MATCH" == true ]]; then
    CLASSIFICATION='DEADLOCK_KEYWORD_LOGGED'
fi

printf '%s %s %s %s %s\n' \
    "${CPU_TICKS:-0}" "$APP_LOG_BYTES" "$APP_LOG_MTIME" "${RSS_KB:-0}" "$STALL_START" > "$STATE_FILE"

printf '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n' \
    "$TIMESTAMP" "$APP_PID" "${MULTI_THREAD_ENABLE:-unknown}" \
    "${PROCESS_STATE:-UNKNOWN}" "${THREADS:-}" "${RSS_KB:-}" \
    "${RSS_DELTA_KB:-}" "${VOLUNTARY:-}" "${NONVOLUNTARY:-}" \
    "${CPU_TICKS:-}" "${CPU_TICKS_DELTA:-}" "$APP_LOG_BYTES" \
    "$APP_LOG_MTIME" "$STALL_SECONDS" "$DEADLOCK_LOG_MATCH" "$CLASSIFICATION" >> "$CSV_FILE"

append_snapshot_header
{
    echo "PROCESS_STATUS: ALIVE"
    echo "CLASSIFICATION: ${CLASSIFICATION}"
    echo "STALL_SECONDS: ${STALL_SECONDS}"
    echo "CPU_TICKS: ${CPU_TICKS:-unknown} (delta: ${CPU_TICKS_DELTA:-unknown})"
    echo "RSS_KB: ${RSS_KB:-unknown} (delta: ${RSS_DELTA_KB:-unknown})"
    echo "APP_LOG_BYTES: ${APP_LOG_BYTES}"
    echo "DEADLOCK_KEYWORD_PRESENT: ${DEADLOCK_LOG_MATCH}"
    echo "NOTE: SUSPECTED_STALL은 CPU/RSS/로그 변화가 관측되지 않은 상태이며, 교착상태 확정 판정은 아닙니다."

    echo "----- Process snapshot -----"
    ps -p "$APP_PID" -o pid,ppid,stat,pcpu,rss,vsz,etime,nice,wchan:25,comm,args 2>&1 || true

    echo "----- Thread snapshot (ps -L) -----"
    ps -L -p "$APP_PID" -o lwp,pcpu,stat,wchan:25,time,cmd 2>&1 || true

    echo "----- Thread-level top -----"
    top -H -bn1 -p "$APP_PID" 2>&1 | sed -n '1,40p'

    echo "----- /proc/${APP_PID}/status -----"
    grep -E '^(Name|State|VmRSS|VmSize|Threads|voluntary_ctxt_switches|nonvoluntary_ctxt_switches):' \
        "/proc/${APP_PID}/status" 2>/dev/null || true

    echo "----- Per-thread state and wait channel -----"
    for task_dir in "/proc/${APP_PID}"/task/*; do
        [[ -d "$task_dir" ]] || continue
        tid="${task_dir##*/}"
        state="$(awk '/^State:/ {print $2}' "${task_dir}/status" 2>/dev/null || true)"
        wchan="$(cat "${task_dir}/wchan" 2>/dev/null || echo unavailable)"
        comm="$(cat "${task_dir}/comm" 2>/dev/null || echo unavailable)"
        printf 'TID=%s COMM=%s STATE=%s WCHAN=%s\n' \
            "$tid" "$comm" "${state:-unknown}" "$wchan"
    done

    echo "----- Deadlock-related application log lines -----"
    if [[ -f "$APP_LOG" ]]; then
        grep -Ei 'WAITING|BLOCKED|LOCK|DEADLOCK|THREAD|JOIN|MUTEX|SEMAPHORE' "$APP_LOG" | tail -n 40 || true
        echo "----- Last application log lines -----"
        tail -n 40 "$APP_LOG"
    else
        echo "Application log not found: $APP_LOG"
    fi
    echo "========== END DEADLOCK SNAPSHOT =========="
} >> "$OUTPUT_LOG" 2>&1

exit 0
