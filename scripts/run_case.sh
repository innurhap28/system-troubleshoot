#!/usr/bin/env bash
set -uo pipefail

# 장애 유형별 환경값으로 앱을 실행하고 종료 또는 수집 중단까지 증거를 저장합니다.
if [[ "${EUID}" -eq 0 ]]; then
    echo "오류: 앱은 root가 아닌 일반 사용자로 실행해야 합니다." >&2
    exit 1
fi

CASE_NAME="${1:-}"
PROFILE="${2:-baseline}"
case "$CASE_NAME" in
    oom|cpu|deadlock) ;;
    *) echo "사용법: $0 {oom|cpu|deadlock} [baseline|adjusted]" >&2; exit 2 ;;
esac
case "$PROFILE" in
    baseline|adjusted) ;;
    *) echo "비교 설정은 baseline 또는 adjusted여야 합니다." >&2; exit 2 ;;
esac

source "${HOME}/agent-app/env.sh"
APP_BIN="${AGENT_HOME}/bin/agent-leak-app-x86"
MONITOR="${AGENT_HOME}/bin/monitor.sh"
if [[ ! -x "$APP_BIN" || ! -x "$MONITOR" ]]; then
    echo "오류: 앱 또는 관제 스크립트가 없습니다. 호스트에서 scripts/setup_vm.sh를 먼저 실행하세요." >&2
    exit 1
fi

# 기본값은 과제의 Before/After 비교를 위한 재현 설정입니다.
MEMORY_LIMIT="${MEMORY_LIMIT:-256}"
CPU_MAX_OCCUPY="${CPU_MAX_OCCUPY:-50}"
MULTI_THREAD_ENABLE="${MULTI_THREAD_ENABLE:-true}"
case "$CASE_NAME:$PROFILE" in
    oom:baseline) MEMORY_LIMIT=128; MULTI_THREAD_ENABLE=false ;;
    oom:adjusted) MEMORY_LIMIT=512; MULTI_THREAD_ENABLE=false ;;
    cpu:baseline) CPU_MAX_OCCUPY=10; MULTI_THREAD_ENABLE=false ;;
    cpu:adjusted) CPU_MAX_OCCUPY=100; MULTI_THREAD_ENABLE=false ;;
    deadlock:baseline) MULTI_THREAD_ENABLE=true ;;
    deadlock:adjusted) MULTI_THREAD_ENABLE=false ;;
esac

RUN_ID="$(date '+%Y%m%d_%H%M%S')_${PROFILE}"
RUN_DIR="${AGENT_HOME}/evidence/${CASE_NAME}/${RUN_ID}"
mkdir -p "$RUN_DIR"
APP_LOG="${RUN_DIR}/application.log"
PROCESS_LOG="${RUN_DIR}/process-snapshots.log"
MONITOR_LOG="${RUN_DIR}/monitor-snapshots.log"
PID_FILE="${RUN_DIR}/app.pid"
INTERVAL="${EVIDENCE_INTERVAL:-3}"
OBSERVE_SECONDS="${OBSERVE_SECONDS:-0}"
STOP_COLLECTION=0
trap 'STOP_COLLECTION=1' INT TERM
if [[ ! "$OBSERVE_SECONDS" =~ ^[0-9]+$ ]]; then
    echo "오류: 관측 시간은 0 이상의 정수(초)여야 합니다." >&2
    exit 2
fi
START_SECONDS=$SECONDS

echo "장애 유형: ${CASE_NAME} / 비교 설정: ${PROFILE}"
echo "실행 설정: 메모리 제한 ${MEMORY_LIMIT} MB, CPU 점유 상한 ${CPU_MAX_OCCUPY}%, 다중 스레드 ${MULTI_THREAD_ENABLE}"
echo "실행 증거 저장 위치: ${RUN_DIR}"

AGENT_HOME="$AGENT_HOME" \
AGENT_PORT="$AGENT_PORT" \
AGENT_UPLOAD_DIR="$AGENT_UPLOAD_DIR" \
AGENT_KEY_PATH="$AGENT_KEY_PATH" \
AGENT_LOG_DIR="$AGENT_LOG_DIR" \
MEMORY_LIMIT="$MEMORY_LIMIT" \
CPU_MAX_OCCUPY="$CPU_MAX_OCCUPY" \
MULTI_THREAD_ENABLE="$MULTI_THREAD_ENABLE" \
    "$APP_BIN" >"$APP_LOG" 2>&1 &
APP_PID=$!
echo "$APP_PID" > "$PID_FILE"
echo "앱을 실행했습니다. PID=${APP_PID}"
echo "실행 로그: ${APP_LOG}"
echo "교착상태처럼 앱이 끝나지 않으면 Ctrl-C를 눌러 앱은 유지하고 증거 수집만 멈출 수 있습니다."

capture_process_state() {
    PROCESS_PIDS=("$APP_PID")
    collect_descendants() {
        local parent="$1" child
        while read -r child; do
            [[ -n "$child" ]] || continue
            PROCESS_PIDS+=("$child")
            collect_descendants "$child"
        done < <(pgrep -P "$parent" 2>/dev/null || true)
    }
    collect_descendants "$APP_PID"
    PROCESS_PID_LIST=$(IFS=,; echo "${PROCESS_PIDS[*]}")
    {
        echo "===== $(date '+%Y-%m-%d %H:%M:%S') 프로세스 상태 ====="
        ps -p "$PROCESS_PID_LIST" --forest -o pid,ppid,stat,%cpu,%mem,rss,vsz,etime,comm,args
        echo "----- 스레드 상태 -----"
        ps -L -p "$PROCESS_PID_LIST" -o pid,tid,stat,%cpu,comm
        echo "----- 스레드별 top -----"
        top -H -b -n 1 -p "$PROCESS_PID_LIST" | sed -n '1,35p'
        echo
    } >> "$PROCESS_LOG" 2>&1
}

while kill -0 "$APP_PID" 2>/dev/null && [[ "$STOP_COLLECTION" -eq 0 ]]; do
    capture_process_state
    APP_PID="$APP_PID" AGENT_LOG_DIR="$AGENT_LOG_DIR" "$MONITOR" >> "$MONITOR_LOG" 2>&1 || true
    sleep "$INTERVAL" || true
    if (( OBSERVE_SECONDS > 0 && SECONDS - START_SECONDS >= OBSERVE_SECONDS )); then
        STOP_COLLECTION=1
    fi
done

if kill -0 "$APP_PID" 2>/dev/null; then
    echo "증거 수집을 멈췄습니다. 앱은 계속 실행 중입니다(PID=${APP_PID})."
    echo "수동 종료 명령: kill ${APP_PID}"
else
    if wait "$APP_PID"; then
        APP_STATUS=0
    else
        APP_STATUS=$?
    fi
    APP_PID="$APP_PID" AGENT_LOG_DIR="$AGENT_LOG_DIR" "$MONITOR" >> "$MONITOR_LOG" 2>&1 || true
    echo "앱이 종료되었습니다. 종료 코드=${APP_STATUS}"
fi

echo "저장된 증거:"
echo "  앱 로그: ${APP_LOG}"
echo "  프로세스/스레드 관측: ${PROCESS_LOG}"
echo "  monitor.sh 결과: ${MONITOR_LOG}"
echo "  PID 기록: ${PID_FILE}"
exit 0
