#!/usr/bin/env bash
set -uo pipefail

# 장애 유형별 환경값으로 앱을 실행하고, 실행 과정과 진단 증거를 보존합니다.

SCRIPT_NAME="${0##*/}"
CASE_NAME="${1:-}"
PROFILE="${2:-baseline}"

log() {
    printf '[%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$*"
}

error() {
    log "오류: $*" >&2
}

usage() {
    echo "사용법: $0 {oom|cpu|deadlock} [baseline|adjusted]" >&2
}

# 1. 입력값 및 실행 환경 검증
if [[ "${EUID}" -eq 0 ]]; then
    error "앱은 root가 아닌 일반 사용자로 실행해야 합니다."
    exit 1
fi

case "$CASE_NAME" in
    oom|cpu|deadlock) ;;
    *) usage; exit 2 ;;
esac

case "$PROFILE" in
    baseline|adjusted) ;;
    *) error "비교 설정은 baseline 또는 adjusted여야 합니다."; usage; exit 2 ;;
esac

ENV_FILE="${HOME}/agent-app/env.sh"
if [[ ! -r "$ENV_FILE" ]]; then
    error "환경 설정 파일을 읽을 수 없습니다: $ENV_FILE"
    exit 1
fi

# env.sh에서 AGENT_HOME 및 앱 실행에 필요한 환경변수를 가져옵니다.
# shellcheck source=/dev/null
if ! source "$ENV_FILE"; then
    error "환경 설정 파일을 불러오지 못했습니다: $ENV_FILE"
    exit 1
fi

: "${AGENT_HOME:?env.sh에 AGENT_HOME이 설정되어야 합니다}"
: "${AGENT_PORT:?env.sh에 AGENT_PORT가 설정되어야 합니다}"
: "${AGENT_UPLOAD_DIR:?env.sh에 AGENT_UPLOAD_DIR가 설정되어야 합니다}"
: "${AGENT_KEY_PATH:?env.sh에 AGENT_KEY_PATH가 설정되어야 합니다}"
: "${AGENT_LOG_DIR:?env.sh에 AGENT_LOG_DIR가 설정되어야 합니다}"

if [[ ! -d "$AGENT_HOME" ]]; then
    error "AGENT_HOME 디렉터리가 없습니다: $AGENT_HOME"
    exit 1
fi

APP_BIN="${AGENT_HOME}/bin/agent-leak-app-x86"
MONITOR="${AGENT_HOME}/bin/monitor.sh"
OOM_TEST="${AGENT_HOME}/bin/oom_test.sh"
CPU_SPIKE="${AGENT_HOME}/bin/cpu_spike.sh"
DEADLOCK_TEST="${AGENT_HOME}/bin/deadlock_test.sh"

if [[ ! -x "$APP_BIN" ]]; then
    error "앱 실행 파일이 없거나 실행 권한이 없습니다: $APP_BIN"
    exit 1
fi
if [[ ! -x "$MONITOR" ]]; then
    error "관제 스크립트가 없거나 실행 권한이 없습니다: $MONITOR"
    exit 1
fi

case "$CASE_NAME" in
    oom)
        [[ -x "$OOM_TEST" ]] || { error "OOM 진단 스크립트가 없거나 실행 권한이 없습니다: $OOM_TEST"; exit 1; }
        ;;
    cpu)
        [[ -x "$CPU_SPIKE" ]] || { error "CPU 진단 스크립트가 없거나 실행 권한이 없습니다: $CPU_SPIKE"; exit 1; }
        ;;
    deadlock)
        [[ -x "$DEADLOCK_TEST" ]] || { error "Deadlock 진단 스크립트가 없거나 실행 권한이 없습니다: $DEADLOCK_TEST"; exit 1; }
        ;;
esac

# 2. 장애 유형별 실험 설정
# 선택한 장애 유형의 핵심 변수만 baseline/adjusted 사이에서 변경합니다.
MEMORY_LIMIT="${MEMORY_LIMIT:-512}"
CPU_MAX_OCCUPY="${CPU_MAX_OCCUPY:-10}"
MULTI_THREAD_ENABLE="${MULTI_THREAD_ENABLE:-false}"

case "$CASE_NAME:$PROFILE" in
    oom:baseline)       MEMORY_LIMIT=256 ;;
    oom:adjusted)       MEMORY_LIMIT=512 ;;
    cpu:baseline)       CPU_MAX_OCCUPY=80 ;;
    cpu:adjusted)       CPU_MAX_OCCUPY=10 ;;
    deadlock:baseline)  MULTI_THREAD_ENABLE=true ;;
    deadlock:adjusted)  MULTI_THREAD_ENABLE=false ;;
    *) error "지원되지 않는 케이스 조합입니다: ${CASE_NAME}:${PROFILE}"; exit 2 ;;
esac

# 앱 미션 명세의 허용 범위에 맞춰 실행값을 검증합니다.
if [[ ! "$MEMORY_LIMIT" =~ ^[0-9]+$ ]] || (( MEMORY_LIMIT < 50 || MEMORY_LIMIT > 512 )); then
    error "MEMORY_LIMIT은 50~512 사이의 정수여야 합니다: $MEMORY_LIMIT"
    exit 2
fi
if [[ ! "$CPU_MAX_OCCUPY" =~ ^[0-9]+$ ]] || (( CPU_MAX_OCCUPY < 10 || CPU_MAX_OCCUPY > 100 )); then
    error "CPU_MAX_OCCUPY는 10~100 사이의 정수여야 합니다: $CPU_MAX_OCCUPY"
    exit 2
fi
case "${MULTI_THREAD_ENABLE,,}" in
    true|false|1|0|yes|no) MULTI_THREAD_ENABLE="${MULTI_THREAD_ENABLE,,}" ;;
    *) error "MULTI_THREAD_ENABLE은 true/false, 1/0, yes/no 중 하나여야 합니다: $MULTI_THREAD_ENABLE"; exit 2 ;;
esac

INTERVAL="${EVIDENCE_INTERVAL:-3}"
OBSERVE_SECONDS="${OBSERVE_SECONDS:-0}"
BOOT_TIMEOUT="${BOOT_TIMEOUT:-30}"
MAX_RUNTIME="${MAX_RUNTIME:-180}"

# sleep이 허용하는 양의 정수 또는 소수 초 형식만 허용합니다.
if [[ ! "$INTERVAL" =~ ^([0-9]+([.][0-9]*)?|[.][0-9]+)$ ]] || \
   ! awk -v value="$INTERVAL" 'BEGIN { exit !(value > 0) }'; then
    error "EVIDENCE_INTERVAL은 0보다 큰 초 단위 숫자여야 합니다: $INTERVAL"
    exit 2
fi
if [[ ! "$OBSERVE_SECONDS" =~ ^[0-9]+$ ]]; then
    error "OBSERVE_SECONDS는 0 이상의 정수(초)여야 합니다."
    exit 2
fi
if [[ ! "$BOOT_TIMEOUT" =~ ^[0-9]+$ ]] || (( BOOT_TIMEOUT < 1 )); then
    error "BOOT_TIMEOUT은 1 이상의 정수여야 합니다."
    exit 2
fi
if [[ ! "$MAX_RUNTIME" =~ ^[0-9]+$ ]] || (( MAX_RUNTIME < 1 )); then
    error "MAX_RUNTIME은 1 이상의 정수여야 합니다."
    exit 2
fi

# 사전 준비 항목은 실행 전에 확인해 부팅 실패 원인을 줄입니다.
for required_dir in "$AGENT_UPLOAD_DIR" "$AGENT_KEY_PATH" "$AGENT_LOG_DIR"; do
    if [[ ! -d "$required_dir" ]]; then
        error "필수 디렉터리가 없습니다: $required_dir"
        exit 1
    fi
done
if [[ ! -w "$AGENT_LOG_DIR" ]]; then
    error "로그 디렉터리에 쓰기 권한이 없습니다: $AGENT_LOG_DIR"
    exit 1
fi
if [[ "$AGENT_PORT" != "15034" ]]; then
    error "AGENT_PORT는 미션 명세에 따라 15034여야 합니다: $AGENT_PORT"
    exit 1
fi
SECRET_KEY_FILE="${AGENT_KEY_PATH}/secret.key"
if [[ ! -r "$SECRET_KEY_FILE" ]] || [[ "$(<"$SECRET_KEY_FILE")" != "agent_api_key_test" ]]; then
    error "secret.key가 없거나 내용이 올바르지 않습니다: $SECRET_KEY_FILE"
    exit 1
fi

# 3. 실행 디렉터리와 메타데이터 생성
RUN_BASE="${AGENT_HOME}/evidence/${CASE_NAME}"
if ! mkdir -p "$RUN_BASE"; then
    error "증거 저장 디렉터리를 생성할 수 없습니다: $RUN_BASE"
    exit 1
fi

RUN_STAMP="$(date '+%Y%m%d_%H%M%S')"
if ! RUN_DIR="$(mktemp -d "${RUN_BASE}/${RUN_STAMP}_${PROFILE}_XXXXXX")"; then
    error "이번 실행의 증거 디렉터리를 생성하지 못했습니다."
    exit 1
fi

APP_LOG="${RUN_DIR}/application.log"
PROCESS_LOG="${RUN_DIR}/process-snapshots.log"
MONITOR_LOG="${RUN_DIR}/monitor-snapshots.log"
CPU_LOG="${RUN_DIR}/cpu-process.log"
PID_FILE="${RUN_DIR}/app.pid"
OOM_LOG="${RUN_DIR}/oom-diagnostics.log"
DEADLOCK_LOG="${RUN_DIR}/deadlock-diagnostics.log"
CONFIG_FILE="${RUN_DIR}/config.env"
SUMMARY_FILE="${RUN_DIR}/run-summary.txt"
ERROR_LOG="${RUN_DIR}/collector-errors.log"

cat > "$CONFIG_FILE" <<CONFIG
CASE_NAME=${CASE_NAME}
PROFILE=${PROFILE}
MEMORY_LIMIT=${MEMORY_LIMIT}
CPU_MAX_OCCUPY=${CPU_MAX_OCCUPY}
MULTI_THREAD_ENABLE=${MULTI_THREAD_ENABLE}
EVIDENCE_INTERVAL=${INTERVAL}
OBSERVE_SECONDS=${OBSERVE_SECONDS}
BOOT_TIMEOUT=${BOOT_TIMEOUT}
MAX_RUNTIME=${MAX_RUNTIME}
AGENT_PORT=${AGENT_PORT}
APP_BIN=${APP_BIN}
CONFIG_CREATED_AT=$(date '+%Y-%m-%d %H:%M:%S %z')
CONFIG

APP_PID=""
APP_STATUS="not_started"
RUN_RESULT="not_started"
STOP_COLLECTION=0
TIME_LIMIT_REACHED=0
APP_START_EPOCH=""
RUN_START_EPOCH="$(date +%s)"

write_summary() {
    local end_epoch duration
    end_epoch="$(date +%s)"
    duration=$(( end_epoch - RUN_START_EPOCH ))
    {
        echo "CASE_NAME=${CASE_NAME}"
        echo "PROFILE=${PROFILE}"
        echo "RESULT=${RUN_RESULT}"
        echo "APP_PID=${APP_PID:-unknown}"
        echo "APP_EXIT_STATUS=${APP_STATUS}"
        echo "STARTED_AT=$(date -d "@${RUN_START_EPOCH}" '+%Y-%m-%d %H:%M:%S %z' 2>/dev/null || echo "$RUN_START_EPOCH")"
        echo "FINISHED_AT=$(date '+%Y-%m-%d %H:%M:%S %z')"
        echo "ELAPSED_SECONDS=${duration}"
        echo "MEMORY_LIMIT=${MEMORY_LIMIT}"
        echo "CPU_MAX_OCCUPY=${CPU_MAX_OCCUPY}"
        echo "MULTI_THREAD_ENABLE=${MULTI_THREAD_ENABLE}"
    } > "$SUMMARY_FILE"
}

app_state() {
    ps -p "$APP_PID" -o stat= 2>/dev/null | awk 'NR == 1 { print $1 }'
}

app_is_running() {
    local state
    [[ -n "$APP_PID" ]] || return 1
    state="$(app_state)"
    [[ -n "$state" && "$state" != Z* && "$state" != X* ]]
}

stop_app() {
    local signal_name="${1:-TERM}"
    local wait_seconds="${2:-5}"
    local i

    if app_is_running; then
        log "앱 PID ${APP_PID}에 SIG${signal_name} 전송"
        kill -s "$signal_name" "$APP_PID" 2>/dev/null || true

        if [[ "$signal_name" == "TERM" ]]; then
            for (( i = 0; i < wait_seconds * 5; i++ )); do
                app_is_running || break
                sleep 0.2
            done
            if app_is_running; then
                log "정상 종료 대기 시간 초과. SIGKILL 전송"
                kill -KILL "$APP_PID" 2>/dev/null || true
            fi
        fi
    fi

    # 프로세스가 이미 종료된 경우에도 wait로 자식 프로세스를 회수하고 종료 코드를 기록합니다.
    if [[ -n "$APP_PID" ]]; then
        if wait "$APP_PID" 2>/dev/null; then
            APP_STATUS=0
        else
            APP_STATUS=$?
        fi
    fi
}

on_signal() {
    local signal_name="$1"
    log "${signal_name} 신호를 받았습니다. 증거 수집을 중단합니다."
    STOP_COLLECTION=1
}
trap 'on_signal INT' INT
trap 'on_signal TERM' TERM

run_collector() {
    local collector_name="$1"
    shift
    if "$@"; then
        return 0
    else
        local status=$?
        printf '[%s] collector=%s exit_status=%s\n' \
            "$(date '+%Y-%m-%d %H:%M:%S')" "$collector_name" "$status" >> "$ERROR_LOG"
        return "$status"
    fi
}

log "장애 유형: ${CASE_NAME} / 비교 설정: ${PROFILE}"
log "실행 설정: MEMORY_LIMIT=${MEMORY_LIMIT}MB, CPU_MAX_OCCUPY=${CPU_MAX_OCCUPY}%, MULTI_THREAD_ENABLE=${MULTI_THREAD_ENABLE}"
log "증거 저장 위치: ${RUN_DIR}"
log "최대 실행 시간: ${MAX_RUNTIME}초"
log "부팅 검사 진행 중..."

# 4. 앱 실행 및 부팅 검사
APP_START_EPOCH="$(date +%s)"
APP_START_SECONDS=$SECONDS
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
printf '%s\n' "$APP_PID" > "$PID_FILE"

BOOT_OK=0
BOOT_REASON=""
BOOT_START=$SECONDS
while (( SECONDS - BOOT_START < BOOT_TIMEOUT )); do
    if (( STOP_COLLECTION )); then
        BOOT_REASON="interrupted_during_boot"
        break
    fi
    if (( SECONDS - APP_START_SECONDS >= MAX_RUNTIME )); then
        TIME_LIMIT_REACHED=1
        BOOT_REASON="max_runtime_during_boot"
        break
    fi
    if grep -Eq '\[FAIL\]|System Boot Failed' "$APP_LOG"; then
        BOOT_REASON="boot_failure_log"
        break
    fi
    if grep -Fq 'All Boot Checks Passed!' "$APP_LOG"; then
        BOOT_OK=1
        BOOT_REASON="boot_success"
        break
    fi
    if ! app_is_running; then
        BOOT_REASON="process_exited_before_boot_success"
        break
    fi
    sleep 0.2
 done

if (( BOOT_OK == 0 )); then
    if [[ -z "$BOOT_REASON" ]]; then
        BOOT_REASON="boot_timeout"
    fi
    stop_app TERM 5
    RUN_RESULT="$BOOT_REASON"
    write_summary
    error "부팅 검사 실패: ${BOOT_REASON}"
    echo "----- 부팅 로그 마지막 30줄 -----"
    tail -n 30 "$APP_LOG" 2>/dev/null || true
    echo "--------------------------------"
    log "부팅 실패 증거를 보존했습니다: ${RUN_DIR}"
    exit 1
fi

log "부팅 검사 통과! 앱 PID=${APP_PID}"
log "앱 로그: ${APP_LOG}"

# 5. 프로세스 및 관제 데이터 수집
START_SECONDS=$SECONDS

capture_process_state() {
    local -a process_pids=("$APP_PID")
    local parent child process_pid_list

    collect_descendants() {
        local current_parent="$1"
        local current_child
        while read -r current_child; do
            [[ -n "$current_child" ]] || continue
            process_pids+=("$current_child")
            collect_descendants "$current_child"
        done < <(pgrep -P "$current_parent" 2>/dev/null || true)
    }

    collect_descendants "$APP_PID"
    process_pid_list="$(IFS=,; echo "${process_pids[*]}")"

    {
        echo "===== $(date '+%Y-%m-%d %H:%M:%S') PROCESS SNAPSHOT ====="
        ps -p "$process_pid_list" --forest \
            -o pid,ppid,stat,%cpu,%mem,rss,vsz,etime,comm,args
        echo "----- Thread state -----"
        ps -L -p "$process_pid_list" -o pid,tid,stat,%cpu,comm
        echo "----- Thread-level top -----"
        top -H -b -n 1 -p "$process_pid_list" 2>&1 | sed -n '1,35p'
        echo
    } >> "$PROCESS_LOG" 2>&1
}

while (( STOP_COLLECTION == 0 )); do
    if ! app_is_running; then
        break
    fi

    if (( SECONDS - APP_START_SECONDS >= MAX_RUNTIME )); then
        TIME_LIMIT_REACHED=1
        STOP_COLLECTION=1
        log "최대 실행 시간 초과(${MAX_RUNTIME}초)"
        break
    fi

    capture_process_state

    case "$CASE_NAME" in
        oom)
            run_collector oom "$OOM_TEST" "$APP_PID" "$MEMORY_LIMIT" "$APP_LOG" "$OOM_LOG" || true
            ;;
        cpu)
            run_collector cpu "$CPU_SPIKE" "$APP_PID" "$CPU_LOG" || true
            ;;
        deadlock)
            run_collector deadlock "$DEADLOCK_TEST" "$APP_PID" "$APP_LOG" "$DEADLOCK_LOG" || true
            ;;
    esac

    APP_PID="$APP_PID" AGENT_LOG_DIR="$AGENT_LOG_DIR" \
        run_collector monitor "$MONITOR" >> "$MONITOR_LOG" 2>&1 || true

    # 관측 시간이 설정된 경우 수집 주기 종료 후 조건을 확인합니다.
    sleep "$INTERVAL" || true
    if (( OBSERVE_SECONDS > 0 && SECONDS - START_SECONDS >= OBSERVE_SECONDS )); then
        STOP_COLLECTION=1
    fi
done

# OOM은 프로세스 종료 직전/직후 마지막 스냅샷을 한 번 더 남깁니다.
if [[ "$CASE_NAME" == "oom" ]]; then
    run_collector oom-final "$OOM_TEST" "$APP_PID" "$MEMORY_LIMIT" "$APP_LOG" "$OOM_LOG" || true
fi

# 6. 실행 종료 상태 처리
if (( TIME_LIMIT_REACHED )); then
    stop_app TERM 5
    RUN_RESULT="max_runtime_reached"
elif app_is_running; then
    # 관측 시간 도달 또는 사용자의 Ctrl-C는 기존 동작처럼 수집만 중단합니다.
    APP_STATUS="still_running"
    RUN_RESULT="collection_stopped_app_running"
    log "증거 수집을 중단했습니다. 앱은 계속 실행 중입니다(PID=${APP_PID})."
    log "수동 종료 명령: kill ${APP_PID}"
else
    if wait "$APP_PID" 2>/dev/null; then
        APP_STATUS=0
    else
        APP_STATUS=$?
    fi
    RUN_RESULT="application_exited"
    log "앱이 종료되었습니다. 종료 코드=${APP_STATUS}"
fi

# 앱 종료/수집 종료 시점의 최종 monitor 결과를 보존합니다.
APP_PID="$APP_PID" AGENT_LOG_DIR="$AGENT_LOG_DIR" \
    run_collector monitor-final "$MONITOR" >> "$MONITOR_LOG" 2>&1 || true

write_summary

log "실행 결과: ${RUN_RESULT}"
log "저장된 증거:"
log "  설정: ${CONFIG_FILE}"
log "  실행 요약: ${SUMMARY_FILE}"
log "  앱 로그: ${APP_LOG}"
log "  프로세스/스레드 관측: ${PROCESS_LOG}"
log "  monitor.sh 결과: ${MONITOR_LOG}"
log "  PID 기록: ${PID_FILE}"
[[ "$CASE_NAME" != "oom" ]] || log "  OOM 진단: ${OOM_LOG}"
[[ "$CASE_NAME" != "cpu" ]] || log "  CPU 진단: ${CPU_LOG}"
[[ "$CASE_NAME" != "deadlock" ]] || log "  Deadlock 진단: ${DEADLOCK_LOG}"
[[ ! -s "$ERROR_LOG" ]] || log "  수집기 오류: ${ERROR_LOG}"

# 실험 대상 앱이 자체 정책으로 종료된 경우에도 실험 수집 자체는 성공적으로 끝난 것이므로 0을 반환합니다.
exit 0
