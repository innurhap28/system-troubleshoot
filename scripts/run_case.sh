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
OOM_TEST="${AGENT_HOME}/bin/oom_test.sh"
CPU_SPIKE="${AGENT_HOME}/bin/cpu_spike.sh"
DEADLOCK_TEST="${AGENT_HOME}/bin/deadlock_test.sh"

if [[ ! -x "$APP_BIN" || ! -x "$MONITOR" ]]; then
    echo "오류: 앱 또는 관제 스크립트가 없습니다." >&2
    exit 1
fi

if [[ "$CASE_NAME" == "oom" && ! -x "$OOM_TEST" ]]; then
    echo "오류: OOM 전용 진단 스크립트가 없습니다: $OOM_TEST" >&2
    exit 1
fi

if [[ "$CASE_NAME" == "cpu" && ! -x "$CPU_SPIKE" ]]; then
    echo "오류: CPU 테스트 스크립트가 없습니다: $CPU_SPIKE" >&2
    exit 1
fi

if [[ "$CASE_NAME" == "deadlock" && ! -x "$DEADLOCK_TEST" ]]; then
    echo "오류: Deadlock 전용 진단 스크립트가 없습니다: $DEADLOCK_TEST" >&2
    exit 1
fi

# 장애 유형별 실행 설정
MEMORY_LIMIT="${MEMORY_LIMIT:-512}"
CPU_MAX_OCCUPY="${CPU_MAX_OCCUPY:-10}"
MULTI_THREAD_ENABLE="${MULTI_THREAD_ENABLE:-false}"

case "$CASE_NAME:$PROFILE" in
    oom:baseline) MEMORY_LIMIT=256 ;;
    oom:adjusted) MEMORY_LIMIT=512 ;;
    cpu:baseline) CPU_MAX_OCCUPY=80;;
    cpu:adjusted) CPU_MAX_OCCUPY=10 ;;
    deadlock:baseline) MULTI_THREAD_ENABLE=true ;;
    deadlock:adjusted)  ;;
    *) echo "오류: 지원되지 않는 케이스 조합입니다: ${CASE_NAME}:${PROFILE}" >&2; exit 2 ;;
esac

INTERVAL="${EVIDENCE_INTERVAL:-3}"
OBSERVE_SECONDS="${OBSERVE_SECONDS:-0}"
BOOT_TIMEOUT="${BOOT_TIMEOUT:-30}"
MAX_RUNTIME="${MAX_RUNTIME:-180}"

if [[ ! "$OBSERVE_SECONDS" =~ ^[0-9]+$ ]]; then
    echo "오류: 관측 시간은 0 이상의 정수(초)여야 합니다." >&2
    exit 2
fi

if [[ ! "$BOOT_TIMEOUT" =~ ^[0-9]+$ ]] || (( BOOT_TIMEOUT < 1 )); then
    echo "오류: BOOT_TIMEOUT은 1 이상의 정수여야 합니다." >&2
    exit 2
fi

if [[ ! "$MAX_RUNTIME" =~ ^[0-9]+$ ]] || (( MAX_RUNTIME < 1 )); then
    echo "오류: MAX_RUNTIME은 1 이상의 정수여야 합니다." >&2
    exit 2
fi

# 아직 증거 디렉터리를 만들지 않고 임시 로그만 생성
BOOT_LOG="$(mktemp "${AGENT_HOME}/.run_case_boot.XXXXXX")"

APP_PID=""
STOP_COLLECTION=0
TIME_LIMIT_REACHED=0

trap 'STOP_COLLECTION=1' INT TERM

echo "장애 유형: ${CASE_NAME} / 비교 설정: ${PROFILE}"
echo "실행 설정: 메모리 제한 ${MEMORY_LIMIT} MB, CPU 점유 상한 ${CPU_MAX_OCCUPY}%, 다중 스레드 ${MULTI_THREAD_ENABLE}"
echo "최대 실행 시간: ${MAX_RUNTIME}초"
echo "부팅 검사 진행 중..."

# 앱 실행: 부팅 검사 결과를 임시 로그에 기록
APP_START_SECONDS=$SECONDS

AGENT_HOME="$AGENT_HOME" \
AGENT_PORT="$AGENT_PORT" \
AGENT_UPLOAD_DIR="$AGENT_UPLOAD_DIR" \
AGENT_KEY_PATH="$AGENT_KEY_PATH" \
AGENT_LOG_DIR="$AGENT_LOG_DIR" \
MEMORY_LIMIT="$MEMORY_LIMIT" \
CPU_MAX_OCCUPY="$CPU_MAX_OCCUPY" \
MULTI_THREAD_ENABLE="$MULTI_THREAD_ENABLE" \
    "$APP_BIN" >"$BOOT_LOG" 2>&1 &

APP_PID=$!

# 부팅 검사 성공 또는 실패 판정
BOOT_OK=0
BOOT_START=$SECONDS

while (( SECONDS - BOOT_START < BOOT_TIMEOUT )); do

    # Ctrl-C 등으로 수집이 중단된 경우
    if (( STOP_COLLECTION )); then
        echo "부팅 검사 중단"
        break
    fi

    # 최대 실행 시간 초과
    if (( SECONDS - APP_START_SECONDS >= MAX_RUNTIME )); then
        echo "오류: 최대 실행 시간 초과 (${MAX_RUNTIME}초)"
        TIME_LIMIT_REACHED=1
        break
    fi

    # 명시적인 부팅 실패 확인
    if grep -Eq '\[FAIL\]|System Boot Failed' "$BOOT_LOG"; then
        break
    fi

    # 모든 부팅 검사가 통과한 경우
    if grep -Fq "All Boot Checks Passed!" "$BOOT_LOG"; then
        BOOT_OK=1
        break
    fi

    # 부팅 성공 전에 앱이 종료되었거나 좀비 상태가 된 경우
    APP_STATE="$(ps -p "$APP_PID" -o stat= 2>/dev/null | awk 'NR == 1 { print $1 }')"
    if [[ -z "$APP_STATE" || "$APP_STATE" == Z* || "$APP_STATE" == X* ]]; then
        break
    fi

    sleep 0.2
done

# 부팅 실패 / 중단 / 타임아웃 처리
if (( BOOT_OK == 0 )); then

    APP_STATE="$(ps -p "$APP_PID" -o stat= 2>/dev/null | awk 'NR == 1 { print $1 }')"
    if [[ -n "$APP_STATE" && "$APP_STATE" != Z* && "$APP_STATE" != X* ]]; then
        kill -TERM "$APP_PID" 2>/dev/null || true
        sleep 2

        APP_STATE="$(ps -p "$APP_PID" -o stat= 2>/dev/null | awk 'NR == 1 { print $1 }')"
        if [[ -n "$APP_STATE" && "$APP_STATE" != Z* && "$APP_STATE" != X* ]]; then
            kill -KILL "$APP_PID" 2>/dev/null || true
        fi
    fi

    wait "$APP_PID" 2>/dev/null || true

    if (( STOP_COLLECTION )); then
        echo "오류: 부팅 검사가 사용자에 의해 중단되었습니다."
    elif (( TIME_LIMIT_REACHED )); then
        echo "오류: 부팅 중 최대 실행 시간 초과"
    elif (( SECONDS - BOOT_START >= BOOT_TIMEOUT )); then
        echo "오류: 부팅 검사 시간 초과 (${BOOT_TIMEOUT}초)"
    else
        echo "오류: 애플리케이션 부팅 검사 실패"
    fi

    # 실패 원인은 터미널에만 출력하고 임시 로그 삭제
    echo "----- 부팅 실패 원인 -----"
    tail -n 15 "$BOOT_LOG"
    echo "--------------------------"

    rm -f "$BOOT_LOG"

    echo "증거 자료를 생성하지 않고 종료합니다."
    exit 1
fi

# 여기부터 정식 증거 수집 시작
RUN_ID="$(date '+%Y%m%d_%H%M%S')_${PROFILE}"
RUN_DIR="${AGENT_HOME}/evidence/${CASE_NAME}/${RUN_ID}"

mkdir -p "$RUN_DIR"

APP_LOG="${RUN_DIR}/application.log"
PROCESS_LOG="${RUN_DIR}/process-snapshots.log"
MONITOR_LOG="${RUN_DIR}/monitor-snapshots.log"
CPU_LOG="${RUN_DIR}/cpu-process.log"
PID_FILE="${RUN_DIR}/app.pid"
OOM_LOG="${RUN_DIR}/oom-diagnostics.log"
DEADLOCK_LOG="${RUN_DIR}/deadlock-diagnostics.log"

# 동일 파일시스템 내에서 이동하여 앱의 기존 출력 FD 유지
mv "$BOOT_LOG" "$APP_LOG"

echo "부팅 검사 통과!"
echo "앱 PID: ${APP_PID}"
echo "실행 증거 저장 위치: ${RUN_DIR}"
echo "앱 로그: ${APP_LOG}"

echo "$APP_PID" > "$PID_FILE"

START_SECONDS=$SECONDS

capture_process_state() {
    PROCESS_PIDS=("$APP_PID")

    collect_descendants() {
        local parent="$1"
        local child

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
        ps -p "$PROCESS_PID_LIST" --forest \
            -o pid,ppid,stat,%cpu,%mem,rss,vsz,etime,comm,args

        echo "----- 스레드 상태 -----"
        ps -L -p "$PROCESS_PID_LIST" -o pid,tid,stat,%cpu,comm

        echo "----- 스레드별 top -----"
        top -H -b -n 1 -p "$PROCESS_PID_LIST" | sed -n '1,35p'
        echo

    } >> "$PROCESS_LOG" 2>&1
}

# 앱 실행 중 관제 데이터 수집
while [[ "$STOP_COLLECTION" -eq 0 ]]; do

    # kill -0만으로는 종료된 좀비 프로세스를 구분할 수 없으므로 상태를 함께 확인합니다.
    APP_STATE="$(ps -p "$APP_PID" -o stat= 2>/dev/null | awk 'NR == 1 { print $1 }')"
    if [[ -z "$APP_STATE" || "$APP_STATE" == Z* || "$APP_STATE" == X* ]]; then
        break
    fi

    # 최대 실행 시간 초과 확인
    if (( SECONDS - APP_START_SECONDS >= MAX_RUNTIME )); then
        echo "최대 실행 시간 초과 (${MAX_RUNTIME}초). 앱 종료를 진행합니다."
        TIME_LIMIT_REACHED=1
        STOP_COLLECTION=1
        break
    fi

    capture_process_state

    # OOM 케이스는 별도 스크립트로 메모리 사용량과 MemoryGuard 로그를 수집합니다.
    if [[ "$CASE_NAME" == "oom" ]]; then
        "$OOM_TEST" "$APP_PID" "$MEMORY_LIMIT" "$APP_LOG" "$OOM_LOG" || true
    fi

    # CPU 케이스는 별도 스크립트로 대상 앱 프로세스의 순간 CPU 사용률을 기록합니다.
    if [[ "$CASE_NAME" == "cpu" ]]; then
        "$CPU_SPIKE" "$APP_PID" "$CPU_LOG" || true
    fi

    # Deadlock 케이스는 별도 스크립트로 PID/스레드 대기 상태와 마지막 앱 로그를 별도 수집
    if [[ "$CASE_NAME" == "deadlock" ]]; then
        "$DEADLOCK_TEST" "$APP_PID" "$APP_LOG" "$DEADLOCK_LOG" || true
    fi

    APP_PID="$APP_PID" AGENT_LOG_DIR="$AGENT_LOG_DIR" \
        "$MONITOR" >> "$MONITOR_LOG" 2>&1 || true

    sleep "$INTERVAL" || true

    # 수집 관측 시간 도달
    if (( OBSERVE_SECONDS > 0 && SECONDS - START_SECONDS >= OBSERVE_SECONDS )); then
        STOP_COLLECTION=1
    fi
done

# 종료 직전/직후의 최종 메모리 상태와 MemoryGuard 로그를 보존합니다.
if [[ "$CASE_NAME" == "oom" ]]; then
    "$OOM_TEST" "$APP_PID" "$MEMORY_LIMIT" "$APP_LOG" "$OOM_LOG" || true
fi

# 종료 또는 수집 중단 처리
if (( TIME_LIMIT_REACHED )); then

    echo "최대 실행 시간에 도달했습니다. 앱을 종료합니다."

    APP_STATE="$(ps -p "$APP_PID" -o stat= 2>/dev/null | awk 'NR == 1 { print $1 }')"
    if [[ -n "$APP_STATE" && "$APP_STATE" != Z* && "$APP_STATE" != X* ]]; then
        kill -TERM "$APP_PID" 2>/dev/null || true

        # 정상 종료 대기
        sleep 2

        # 아직 살아 있다면 SIGKILL로 강제 종료
        APP_STATE="$(ps -p "$APP_PID" -o stat= 2>/dev/null | awk 'NR == 1 { print $1 }')"
        if [[ -n "$APP_STATE" && "$APP_STATE" != Z* && "$APP_STATE" != X* ]]; then
            echo "정상 종료되지 않아 SIGKILL을 전송합니다."
            kill -KILL "$APP_PID" 2>/dev/null || true
        fi
    fi

    wait "$APP_PID" 2>/dev/null || true

    APP_PID="$APP_PID" AGENT_LOG_DIR="$AGENT_LOG_DIR" \
        "$MONITOR" >> "$MONITOR_LOG" 2>&1 || true

    echo "앱이 최대 실행 시간 제한으로 종료되었습니다."

elif APP_STATE="$(ps -p "$APP_PID" -o stat= 2>/dev/null | awk 'NR == 1 { print $1 }')" &&
     [[ -n "$APP_STATE" && "$APP_STATE" != Z* && "$APP_STATE" != X* ]]; then

    echo "증거 수집을 멈췄습니다. 앱은 계속 실행 중입니다(PID=${APP_PID})."
    echo "수동 종료 명령: kill ${APP_PID}"

else

    if wait "$APP_PID"; then
        APP_STATUS=0
    else
        APP_STATUS=$?
    fi

    APP_PID="$APP_PID" AGENT_LOG_DIR="$AGENT_LOG_DIR" \
        "$MONITOR" >> "$MONITOR_LOG" 2>&1 || true

    echo "앱이 종료되었습니다. 종료 코드=${APP_STATUS}"

fi

echo "저장된 증거:"
echo "  앱 로그: ${APP_LOG}"
echo "  프로세스/스레드 관측: ${PROCESS_LOG}"
if [[ "$CASE_NAME" == "oom" ]]; then
    echo "  OOM 진단: ${OOM_LOG}"
fi
if [[ "$CASE_NAME" == "cpu" ]]; then
    echo "  프로세스 CPU 관측: ${CPU_LOG}"
fi
echo "  monitor.sh 결과: ${MONITOR_LOG}"
echo "  PID 기록: ${PID_FILE}"
if [[ "$CASE_NAME" == "deadlock" ]]; then
    echo "  Deadlock 진단: ${DEADLOCK_LOG}"
fi

exit 0
