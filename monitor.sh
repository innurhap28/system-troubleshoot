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

ROOT_PID="${APP_PID:-$(pgrep -f "${APP_NAME}" | head -n 1 || true)}"
PIDS=()
if [[ -n "$ROOT_PID" ]]; then
    PIDS+=("$ROOT_PID")
    collect_descendants() {
        local parent="$1" child
        while read -r child; do
            [[ -n "$child" ]] || continue
            PIDS+=("$child")
            collect_descendants "$child"
        done < <(pgrep -P "$parent" 2>/dev/null || true)
    }
    collect_descendants "$ROOT_PID"
fi
LIVE_PIDS=()
for candidate in "${PIDS[@]}"; do
    if ps -p "$candidate" -o pid= >/dev/null 2>&1; then
        LIVE_PIDS+=("$candidate")
    fi
done
PORT_STATE="닫힘"
if ss -H -lnt "sport = :${APP_PORT}" 2>/dev/null | grep -q .; then
    PORT_STATE="열림"
else
    PORT_STATE="닫힘"
fi

if [[ -z "$ROOT_PID" || "${#LIVE_PIDS[@]}" -eq 0 ]]; then
    LINE="[$TIMESTAMP] 프로세스:${APP_NAME} 상태:종료 포트:${APP_PORT}/${PORT_STATE}"
    echo "$LINE" | tee -a "$LOG_FILE"
    exit 1
fi

# 앱과 자식 프로세스 중 RSS가 가장 큰 프로세스를 관제 대상으로 선택합니다.
PID_LIST=$(IFS=,; echo "${LIVE_PIDS[*]}")
read -r PID CPU RSS_KB ELAPSED < <(ps -p "$PID_LIST" -o pid=,%cpu=,rss=,etime= | awk '$3 > max {max=$3; pid=$1; cpu=$2; rss=$3; elapsed=$4} END {print pid, cpu, rss, elapsed}')
MEM_MB=$(awk -v kb="${RSS_KB:-0}" 'BEGIN {printf "%.1f", kb/1024}')
LINE="[$TIMESTAMP] 프로세스:${APP_NAME} PID:${PID} 부모PID:${ROOT_PID} CPU:${CPU:-0}% 상주메모리:${MEM_MB}MB 실행시간:${ELAPSED:-알수없음} 포트:${APP_PORT}/${PORT_STATE}"
echo "$LINE" | tee -a "$LOG_FILE"

if [[ "$PORT_STATE" != "열림" ]]; then
    echo "[$TIMESTAMP] 경고: 프로세스는 실행 중이지만 포트 ${APP_PORT}가 열려 있지 않습니다." | tee -a "$LOG_FILE"
fi
