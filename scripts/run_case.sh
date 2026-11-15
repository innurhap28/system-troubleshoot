#!/usr/bin/env bash
set -uo pipefail

# 사용법: run_case.sh {oom|cpu|deadlock} [baseline|adjusted]
CASE_NAME="${1:-}"
PROFILE="${2:-baseline}"

log() { printf '[%s] %s\n' "$(date '+%F %T')" "$*"; }
fail() { log "오류: $*" >&2; exit 1; }

[[ "$EUID" -ne 0 ]] || fail "root가 아닌 일반 사용자로 실행해야 합니다."
[[ "$CASE_NAME" =~ ^(oom|cpu|deadlock)$ ]] || { echo "사용법: $0 {oom|cpu|deadlock} [baseline|adjusted]" >&2; exit 2; }
[[ "$PROFILE" =~ ^(baseline|adjusted)$ ]] || fail "PROFILE은 baseline 또는 adjusted여야 합니다."

# 환경 설정은 선택 사항이며, 미설정 값은 기본 경로를 사용합니다.
ENV_FILE="${AGENT_ENV_FILE:-$HOME/agent-app/env.sh}"
[[ ! -r "$ENV_FILE" ]] || source "$ENV_FILE" || fail "환경 설정 파일을 읽지 못했습니다: $ENV_FILE"
AGENT_HOME="${AGENT_HOME:-$HOME/agent-app}"
AGENT_PORT="${AGENT_PORT:-15034}"
AGENT_UPLOAD_DIR="${AGENT_UPLOAD_DIR:-$AGENT_HOME/upload_files}"
AGENT_KEY_PATH="${AGENT_KEY_PATH:-$AGENT_HOME/api_keys}"
AGENT_LOG_DIR="${AGENT_LOG_DIR:-/var/log/agent-app}"

APP_BIN="${APP_BIN:-}"
if [[ -z "$APP_BIN" ]]; then
    for path in "$AGENT_HOME/agent-leak-app" "$AGENT_HOME/bin/agent-leak-app" "$AGENT_HOME/bin/agent-leak-app-x86"; do
        [[ ! -x "$path" ]] || { APP_BIN="$path"; break; }
    done
fi
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MONITOR="${MONITOR:-$AGENT_HOME/bin/monitor.sh}"
OOM_TEST="${OOM_TEST:-$AGENT_HOME/bin/oom_test.sh}"
CPU_SPIKE="${CPU_SPIKE:-$AGENT_HOME/bin/cpu_spike.sh}"
DEADLOCK_TEST="${DEADLOCK_TEST:-$AGENT_HOME/bin/deadlock_test.sh}"
for name in MONITOR OOM_TEST CPU_SPIKE DEADLOCK_TEST; do
    var="$name"; value="${!var}"
    [[ -x "$value" || ! -x "$SCRIPT_DIR/$(basename "$value")" ]] || printf -v "$var" '%s' "$SCRIPT_DIR/$(basename "$value")"
done
[[ -x "$APP_BIN" ]] || fail "앱 실행 파일이 없거나 실행 권한이 없습니다: $APP_BIN"
[[ -x "$MONITOR" ]] || fail "monitor.sh를 찾을 수 없습니다: $MONITOR"
case "$CASE_NAME" in
    oom) [[ -r "$OOM_TEST" ]] || fail "OOM 수집기를 찾을 수 없습니다: $OOM_TEST" ;;
    cpu) [[ -r "$CPU_SPIKE" ]] || fail "CPU 수집기를 찾을 수 없습니다: $CPU_SPIKE" ;;
    deadlock) [[ -r "$DEADLOCK_TEST" ]] || fail "Deadlock 수집기를 찾을 수 없습니다: $DEADLOCK_TEST" ;;
esac

# 케이스별 비교 변수
MEMORY_LIMIT=512 CPU_MAX_OCCUPY=10 MULTI_THREAD_ENABLE=false
case "$CASE_NAME:$PROFILE" in
    oom:baseline) MEMORY_LIMIT=256 ;;
    oom:adjusted) MEMORY_LIMIT=512 ;;
    cpu:baseline) CPU_MAX_OCCUPY=80 ;;
    cpu:adjusted) CPU_MAX_OCCUPY=10 ;;
    deadlock:baseline) MULTI_THREAD_ENABLE=true ;;
    deadlock:adjusted) MULTI_THREAD_ENABLE=false ;;
esac

[[ "$MEMORY_LIMIT" =~ ^[0-9]+$ ]] && (( MEMORY_LIMIT >= 50 && MEMORY_LIMIT <= 512 )) || fail "MEMORY_LIMIT은 50~512 정수여야 합니다."
[[ "$CPU_MAX_OCCUPY" =~ ^[0-9]+$ ]] && (( CPU_MAX_OCCUPY >= 10 && CPU_MAX_OCCUPY <= 100 )) || fail "CPU_MAX_OCCUPY는 10~100 정수여야 합니다."

INTERVAL="${EVIDENCE_INTERVAL:-3}"
BOOT_TIMEOUT="${BOOT_TIMEOUT:-30}"

# 케이스별 기본 관측 시간
case "$CASE_NAME" in
    oom)
        DEFAULT_MAX=1500
        DEFAULT_OBSERVE=0
        ;;
    cpu)
        DEFAULT_MAX=900
        DEFAULT_OBSERVE=0
        ;;
    deadlock)
        DEFAULT_MAX=600
        DEFAULT_OBSERVE=210
        ;;
esac
OBSERVE_SECONDS="${OBSERVE_SECONDS:-$DEFAULT_OBSERVE}"
MAX_RUNTIME="${MAX_RUNTIME:-$DEFAULT_MAX}"
[[ "$INTERVAL" =~ ^([0-9]+([.][0-9]*)?|[.][0-9]+)$ ]] && awk -v n="$INTERVAL" 'BEGIN{exit !(n>0)}' || fail "EVIDENCE_INTERVAL은 양수여야 합니다."
[[ "$OBSERVE_SECONDS" =~ ^[0-9]+$ ]] || fail "OBSERVE_SECONDS는 0 이상의 정수여야 합니다."
[[ "$BOOT_TIMEOUT" =~ ^[0-9]+$ ]] && (( BOOT_TIMEOUT > 0 )) || fail "BOOT_TIMEOUT은 양의 정수여야 합니다."
[[ "$MAX_RUNTIME" =~ ^[0-9]+$ ]] && (( MAX_RUNTIME > 0 )) || fail "MAX_RUNTIME은 양의 정수여야 합니다."

[[ -d "$AGENT_HOME" ]] || fail "AGENT_HOME이 없습니다: $AGENT_HOME"
for dir in "$AGENT_UPLOAD_DIR" "$AGENT_KEY_PATH" "$AGENT_LOG_DIR"; do [[ -d "$dir" ]] || fail "필수 디렉터리가 없습니다: $dir"; done
[[ -w "$AGENT_LOG_DIR" ]] || fail "로그 디렉터리에 쓰기 권한이 없습니다: $AGENT_LOG_DIR"
[[ "$AGENT_PORT" == 15034 ]] || fail "AGENT_PORT는 15034여야 합니다."
[[ -r "$AGENT_KEY_PATH/secret.key" && "$(<"$AGENT_KEY_PATH/secret.key")" == agent_api_key_test ]] || fail "secret.key가 없거나 내용이 올바르지 않습니다."

# 실행별 증거 디렉터리
RUN_BASE="$AGENT_HOME/evidence/$CASE_NAME"
mkdir -p "$RUN_BASE" || fail "증거 디렉터리를 만들 수 없습니다."
RUN_DIR="$(mktemp -d "$RUN_BASE/$(date '+%Y%m%d_%H%M%S')_${PROFILE}_XXXXXX")" || fail "실행 디렉터리를 만들 수 없습니다."
APP_LOG="$RUN_DIR/app-logs/agent_app.log"
APP_STDOUT_LOG="$RUN_DIR/application-stdout.log"
PROCESS_LOG="$RUN_DIR/process-snapshots.log"
MONITOR_LOG="$RUN_DIR/monitor-snapshots.log"
CPU_LOG="$RUN_DIR/cpu-process.log"
OOM_LOG="$RUN_DIR/oom-diagnostics.log"
DEADLOCK_LOG="$RUN_DIR/deadlock-diagnostics.log"
ERROR_LOG="$RUN_DIR/collector-errors.log"
SUMMARY_FILE="$RUN_DIR/run-summary.txt"
mkdir -p "$(dirname "$APP_LOG")"; : > "$APP_LOG"

cat > "$RUN_DIR/config.env" <<EOF_CONFIG
CASE_NAME=$CASE_NAME
PROFILE=$PROFILE
MEMORY_LIMIT=$MEMORY_LIMIT
CPU_MAX_OCCUPY=$CPU_MAX_OCCUPY
MULTI_THREAD_ENABLE=$MULTI_THREAD_ENABLE
EVIDENCE_INTERVAL=$INTERVAL
OBSERVE_SECONDS=$OBSERVE_SECONDS
BOOT_TIMEOUT=$BOOT_TIMEOUT
MAX_RUNTIME=$MAX_RUNTIME
AGENT_PORT=$AGENT_PORT
APP_BIN=$APP_BIN
EOF_CONFIG

APP_PID="" TARGET_PID="" APP_STATUS="not_started" CLEANUP_STATUS="not_performed" RESULT="not_started"
STOP=0 TIMED_OUT=0 START_EPOCH="$(date +%s)" START_SECONDS=$SECONDS

is_alive() {
    local state
    state="$(ps -p "$1" -o stat= 2>/dev/null)"
    [[ -n "$state" && "$state" != Z* && "$state" != X* ]]
}

write_summary() {
    cat > "$SUMMARY_FILE" <<EOF_SUMMARY
CASE_NAME=$CASE_NAME
PROFILE=$PROFILE
RESULT=$RESULT
APP_PID=${APP_PID:-unknown}
TARGET_PID=${TARGET_PID:-unknown}
APP_EXIT_STATUS=$APP_STATUS
CLEANUP_EXIT_STATUS=$CLEANUP_STATUS
ELAPSED_SECONDS=$(( $(date +%s) - START_EPOCH ))
MEMORY_LIMIT=$MEMORY_LIMIT
CPU_MAX_OCCUPY=$CPU_MAX_OCCUPY
MULTI_THREAD_ENABLE=$MULTI_THREAD_ENABLE
EOF_SUMMARY
}

stop_app() {
    local pid cleanup_needed=0

    # 실행기 정리 과정에서 보낸 신호와 앱 자체 종료 결과를 구분합니다.
    for pid in "$TARGET_PID" "$APP_PID"; do
        if [[ -n "$pid" ]] && is_alive "$pid"; then
            cleanup_needed=1
            kill -TERM "$pid" 2>/dev/null || true
        fi
    done

    for _ in {1..25}; do
        { [[ -z "$TARGET_PID" ]] || ! is_alive "$TARGET_PID"; } && { [[ -z "$APP_PID" ]] || ! is_alive "$APP_PID"; } && break
        sleep 0.2
    done

    for pid in "$TARGET_PID" "$APP_PID"; do
        if [[ -n "$pid" ]] && is_alive "$pid"; then
            cleanup_needed=1
            kill -KILL "$pid" 2>/dev/null || true
        fi
    done

    if [[ -n "$APP_PID" ]]; then
        if (( cleanup_needed )); then
            wait "$APP_PID" 2>/dev/null
            CLEANUP_STATUS=$?
            APP_STATUS="not_observed_exit"
        else
            if wait "$APP_PID" 2>/dev/null; then APP_STATUS=0; else APP_STATUS=$?; fi
        fi
    fi
}

trap 'STOP=1; log "수집 중단 신호 수신"' INT TERM

# 앱 실행. $!는 셸이 직접 실행한 앱(또는 PyInstaller 부트로더)의 PID입니다.
log "실험 시작: $CASE_NAME / $PROFILE (MEMORY=$MEMORY_LIMIT, CPU=$CPU_MAX_OCCUPY, MULTI_THREAD=$MULTI_THREAD_ENABLE)"
AGENT_HOME="$AGENT_HOME" AGENT_PORT="$AGENT_PORT" AGENT_UPLOAD_DIR="$AGENT_UPLOAD_DIR" \
AGENT_KEY_PATH="$AGENT_KEY_PATH" AGENT_LOG_DIR="$(dirname "$APP_LOG")" \
MEMORY_LIMIT="$MEMORY_LIMIT" CPU_MAX_OCCUPY="$CPU_MAX_OCCUPY" MULTI_THREAD_ENABLE="$MULTI_THREAD_ENABLE" \
    "$APP_BIN" > "$APP_STDOUT_LOG" 2>&1 &
APP_PID=$!

# PyInstaller one-file의 실제 Worker가 있으면 그 PID를 관측하고, 아니면 APP_PID를 사용합니다.
APP_REAL="$(readlink -f "$APP_BIN")"
for _ in {1..5}; do
    for child in $(pgrep -P "$APP_PID" 2>/dev/null || true); do
        child_exe="$(readlink "/proc/$child/exe" 2>/dev/null || true)"
        child_exe="${child_exe% (deleted)}"
        [[ "$(readlink -f "$child_exe" 2>/dev/null || true)" != "$APP_REAL" ]] || { TARGET_PID="$child"; break 2; }
    done
    is_alive "$APP_PID" || break
    sleep 1
done
TARGET_PID="${TARGET_PID:-$APP_PID}"

# 부팅 성공 여부 확인
BOOT_OK=0
for ((i=0; i<BOOT_TIMEOUT*5; i++)); do
    if grep -Fq 'All Boot Checks Passed!' "$APP_STDOUT_LOG"; then BOOT_OK=1; break; fi
    if grep -Eq '\[FAIL\]|System Boot Failed' "$APP_STDOUT_LOG" || ! is_alive "$APP_PID"; then break; fi
    (( STOP )) && break
    (( SECONDS - START_SECONDS >= MAX_RUNTIME )) && { TIMED_OUT=1; break; }
    sleep 0.2
done
if (( ! BOOT_OK )); then
    RESULT="boot_failed"
    (( TIMED_OUT )) && RESULT="max_runtime_during_boot"
    stop_app
    write_summary
    tail -n 30 "$APP_STDOUT_LOG" 2>/dev/null || true
    fail "부팅 검사 실패: $RESULT (증거: $RUN_DIR)"
fi
log "부팅 성공: APP_PID=$APP_PID TARGET_PID=$TARGET_PID"

# 프로세스/스레드와 장애별 진단 자료 수집
OBSERVE_START=$SECONDS
while (( ! STOP )); do
    if ! is_alive "$TARGET_PID"; then log "관측 대상 프로세스 종료"; break; fi
    if (( SECONDS - START_SECONDS >= MAX_RUNTIME )); then TIMED_OUT=1; break; fi

    {
        echo "===== $(date '+%F %T') ====="
        ps -p "$APP_PID,$TARGET_PID" -o pid,ppid,stat,%cpu,%mem,rss,vsz,etime,comm,args
        ps -L -p "$TARGET_PID" -o pid,tid,stat,%cpu,comm
        top -H -b -n 1 -p "$TARGET_PID" 2>&1 | sed -n '1,30p'
    } >> "$PROCESS_LOG" 2>&1

    case "$CASE_NAME" in
        oom) bash "$OOM_TEST" "$TARGET_PID" "$MEMORY_LIMIT" "$APP_LOG" "$OOM_LOG" || echo "oom collector failed" >> "$ERROR_LOG" ;;
        cpu) CPU_MAX_OCCUPY="$CPU_MAX_OCCUPY" bash "$CPU_SPIKE" "$TARGET_PID" "$APP_LOG" "$CPU_LOG" || echo "cpu collector failed" >> "$ERROR_LOG" ;;
        deadlock) MULTI_THREAD_ENABLE="$MULTI_THREAD_ENABLE" bash "$DEADLOCK_TEST" "$TARGET_PID" "$APP_LOG" "$DEADLOCK_LOG" || echo "deadlock collector failed" >> "$ERROR_LOG" ;;
    esac
    APP_PID="$TARGET_PID" AGENT_LOG_DIR="$(dirname "$APP_LOG")" "$MONITOR" >> "$MONITOR_LOG" 2>&1 || echo "monitor collector failed" >> "$ERROR_LOG"

    sleep "$INTERVAL" || true
    (( OBSERVE_SECONDS > 0 && SECONDS - OBSERVE_START >= OBSERVE_SECONDS )) && break
done

[[ "$CASE_NAME" != oom ]] || bash "$OOM_TEST" "$TARGET_PID" "$MEMORY_LIMIT" "$APP_LOG" "$OOM_LOG" || true

if (( TIMED_OUT )); then
    RESULT="max_runtime_reached"
    APP_STATUS="not_observed_exit"
    log "실험 제한 시간 초과: 앱 장애 자체의 종료 결과가 아닙니다. 실행기 정리를 시작합니다."
    stop_app
elif is_alive "$TARGET_PID"; then
    RESULT="collection_stopped_app_running"
    APP_STATUS="still_running"
    log "수집만 종료했습니다. 앱은 계속 실행 중입니다. 종료하려면 kill $APP_PID"
else
    RESULT="application_exited"
    if wait "$APP_PID" 2>/dev/null; then APP_STATUS=0; else APP_STATUS=$?; fi
fi

if is_alive "$TARGET_PID"; then
    APP_PID="$TARGET_PID" AGENT_LOG_DIR="$(dirname "$APP_LOG")" "$MONITOR" >> "$MONITOR_LOG" 2>&1 || true
fi
write_summary
log "실행 결과: $RESULT / 증거 위치: $RUN_DIR"
exit 0
