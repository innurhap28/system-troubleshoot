#!/usr/bin/env bash
set -uo pipefail

# 이전 과제의 관제 흐름을 이번 앱의 프로세스별 증거 수집에 맞게 조정했습니다.
APP_NAME="${APP_NAME:-agent-leak-app}"
APP_PORT="${AGENT_PORT:-15034}"
LOG_DIR="${AGENT_LOG_DIR:-${HOME}/agent-app/logs}"
LOG_FILE="${LOG_DIR}/monitor.log"
MAX_SIZE=$((10 * 1024 * 1024))
MAX_FILES=10

mkdir -p "$LOG_DIR" || { echo "오류: 로그 디렉터리를 만들 수 없습니다: $LOG_DIR" >&2; exit 1; }
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# 로그가 10 MiB를 넘으면 최근 10개 파일만 남기도록 순환 보관합니다.
if [[ -f "$LOG_FILE" ]] && (( $(wc -c < "$LOG_FILE") >= MAX_SIZE )); then
    rm -f "${LOG_FILE}.${MAX_FILES}"
    for ((i=MAX_FILES-1; i>=1; i--)); do
        [[ -f "${LOG_FILE}.${i}" ]] && mv "${LOG_FILE}.${i}" "${LOG_FILE}.$((i+1))"
    done
    mv "$LOG_FILE" "${LOG_FILE}.1"
fi

PID="${APP_PID:-$(pgrep -f "${APP_NAME}" | head -n 1 || true)}"
PORT_STATE="닫힘"
if ss -H -lnt "sport = :${APP_PORT}" 2>/dev/null | grep -q .; then
    PORT_STATE="열림"
else
    PORT_STATE="닫힘"
fi

if [[ -z "$PID" ]] || ! ps -p "$PID" -o pid= >/dev/null 2>&1; then
    LINE="[$TIMESTAMP] 프로세스:${APP_NAME} 상태:종료 포트:${APP_PORT}/${PORT_STATE}"
    echo "$LINE" | tee -a "$LOG_FILE"
    exit 1
fi

# ps에서 대상 프로세스의 CPU 사용률과 실제 상주 메모리(RSS)를 읽습니다.
read -r CPU RSS_KB ELAPSED < <(ps -p "$PID" -o %cpu=,rss=,etime= | awk '{$1=$1; print $1, $2, $3}')
MEM_MB=$(awk -v kb="${RSS_KB:-0}" 'BEGIN {printf "%.1f", kb/1024}')
LINE="[$TIMESTAMP] 프로세스:${APP_NAME} PID:${PID} CPU:${CPU:-0}% 상주메모리:${MEM_MB}MB 실행시간:${ELAPSED:-알수없음} 포트:${APP_PORT}/${PORT_STATE}"
echo "$LINE" | tee -a "$LOG_FILE"

if [[ "$PORT_STATE" != "열림" ]]; then
    echo "[$TIMESTAMP] 경고: 프로세스는 실행 중이지만 포트 ${APP_PORT}가 열려 있지 않습니다." | tee -a "$LOG_FILE"
fi
