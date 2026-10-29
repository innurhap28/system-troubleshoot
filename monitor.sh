#!/usr/bin/env bash
set -uo pipefail

# Process-level monitor adapted from the previous System-Control-Automation-Program.
APP_NAME="${APP_NAME:-agent-leak-app}"
APP_PORT="${AGENT_PORT:-15034}"
LOG_DIR="${AGENT_LOG_DIR:-${HOME}/agent-app/logs}"
LOG_FILE="${LOG_DIR}/monitor.log"
MAX_SIZE=$((10 * 1024 * 1024))
MAX_FILES=10

mkdir -p "$LOG_DIR" || { echo "Cannot create log directory: $LOG_DIR" >&2; exit 1; }
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Keep bounded logs, rotating monitor.log to monitor.log.1 through .10.
if [[ -f "$LOG_FILE" ]] && (( $(wc -c < "$LOG_FILE") >= MAX_SIZE )); then
    rm -f "${LOG_FILE}.${MAX_FILES}"
    for ((i=MAX_FILES-1; i>=1; i--)); do
        [[ -f "${LOG_FILE}.${i}" ]] && mv "${LOG_FILE}.${i}" "${LOG_FILE}.$((i+1))"
    done
    mv "$LOG_FILE" "${LOG_FILE}.1"
fi

PID=$(pgrep -f "${APP_NAME}" | head -n 1 || true)
PORT_STATE="closed"
if ss -H -lnt "sport = :${APP_PORT}" 2>/dev/null | grep -q .; then
    PORT_STATE="listening"
fi

if [[ -z "$PID" ]]; then
    LINE="[$TIMESTAMP] PROCESS:${APP_NAME} STATUS:stopped PORT:${APP_PORT}/${PORT_STATE}"
    echo "$LINE" | tee -a "$LOG_FILE"
    exit 1
fi

# ps reports CPU percent and resident set size (KiB) for the target process.
read -r CPU RSS_KB ELAPSED < <(ps -p "$PID" -o %cpu=,rss=,etime= | awk '{$1=$1; print $1, $2, $3}')
MEM_MB=$(awk -v kb="${RSS_KB:-0}" 'BEGIN {printf "%.1f", kb/1024}')
LINE="[$TIMESTAMP] PROCESS:${APP_NAME} PID:${PID} CPU:${CPU:-0}% RSS:${MEM_MB}MB ELAPSED:${ELAPSED:-unknown} PORT:${APP_PORT}/${PORT_STATE}"
echo "$LINE" | tee -a "$LOG_FILE"

if [[ "$PORT_STATE" != "listening" ]]; then
    echo "[$TIMESTAMP] WARNING: process is running but port ${APP_PORT} is not listening" | tee -a "$LOG_FILE"
fi
