#!/usr/bin/env bash
set -euo pipefail

# OrbStack에 Ubuntu 과제용 VM을 만들고 앱, 환경, 관제 도구를 한 번에 준비합니다.
VM_NAME="${VM_NAME:-system-troubleshooting}"
VM_USER="${VM_USER:-${USER}}"
VM_ARCH="${VM_ARCH:-amd64}"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_BINARY="${APP_BINARY:-${PROJECT_DIR}/bin/agent-leak-app-x86}"

if ! command -v orb >/dev/null 2>&1; then
    echo "오류: OrbStack 명령어(orb)를 찾을 수 없습니다. OrbStack을 설치하고 실행한 뒤 다시 시도하세요." >&2
    exit 1
fi
if [[ ! -f "$APP_BINARY" ]]; then
    echo "오류: 앱 바이너리가 없습니다: $APP_BINARY" >&2
    exit 1
fi
if [[ ! -f "${PROJECT_DIR}/monitor.sh" || ! -f "${PROJECT_DIR}/scripts/run_case.sh" || ! -f "${PROJECT_DIR}/scripts/cpu_spike.sh"  || ! -f "${PROJECT_DIR}/scripts/deadlock_test.sh" ]]; then
    echo "오류: 프로젝트의 관제 또는 실행 스크립트를 찾을 수 없습니다." >&2
    exit 1
fi
if [[ ! "$VM_USER" =~ ^[a-z_][a-z0-9_-]*[$]?$ ]]; then
    echo "오류: 올바르지 않은 Linux 사용자 이름입니다: $VM_USER" >&2
    exit 1
fi

if ! orb list -q | grep -Fxq "$VM_NAME"; then
    echo "Ubuntu 24.04 가상머신을 생성합니다: $VM_NAME"
    orb create --arch "$VM_ARCH" --user "$VM_USER" ubuntu:24.04 "$VM_NAME"
else
    echo "기존 가상머신을 재사용합니다: $VM_NAME"
fi

echo "가상머신을 시작합니다."
orb start "$VM_NAME"
echo "장애 관제 및 분석 도구를 설치합니다."
orb -m "$VM_NAME" sudo apt-get update
orb -m "$VM_NAME" sudo apt-get install -y procps iproute2 sysstat python3 python3-venv

echo "앱 디렉터리와 테스트 API 키를 준비합니다."
orb -m "$VM_NAME" bash -lc 'mkdir -p "$HOME/agent-app/upload_files" "$HOME/agent-app/api_keys" "$HOME/agent-app/bin" "$HOME/agent-app/logs" "$HOME/agent-app/evidence"'
orb -m "$VM_NAME" bash -lc 'printf "%s\n" "agent_api_key_test" > "$HOME/agent-app/api_keys/secret.key" && chmod 600 "$HOME/agent-app/api_keys/secret.key"'

echo "앱과 과제 스크립트를 가상머신으로 복사합니다."
orb push --machine "$VM_NAME" "$APP_BINARY" agent-app/bin/
orb push --machine "$VM_NAME" "${PROJECT_DIR}/monitor.sh" agent-app/bin/
orb push --machine "$VM_NAME" "${PROJECT_DIR}/scripts/run_case.sh" agent-app/bin/
orb push --machine "$VM_NAME" "${PROJECT_DIR}/scripts/cpu_spike.sh" agent-app/bin/
orb push --machine "$VM_NAME" "${PROJECT_DIR}/scripts/deadlock_test.sh" agent-app/bin/
orb -m "$VM_NAME" bash -lc 'chmod +x "$HOME/agent-app/bin/agent-leak-app-x86" "$HOME/agent-app/bin/monitor.sh" "$HOME/agent-app/bin/run_case.sh" "$HOME/agent-app/bin/cpu_spike.sh" "$HOME/agent-app/bin/deadlock_test.sh"'

ENV_FILE="$(mktemp)"
trap 'rm -f "$ENV_FILE"' EXIT
cat > "$ENV_FILE" <<'ENVIRONMENT'
#!/usr/bin/env bash
export AGENT_HOME="${HOME}/agent-app"
export AGENT_PORT=15034
export AGENT_UPLOAD_DIR="${AGENT_HOME}/upload_files"
export AGENT_KEY_PATH="${AGENT_HOME}/api_keys"
export AGENT_LOG_DIR="${AGENT_HOME}/logs"
export MEMORY_LIMIT="${MEMORY_LIMIT:-256}"
export CPU_MAX_OCCUPY="${CPU_MAX_OCCUPY:-50}"
export MULTI_THREAD_ENABLE="${MULTI_THREAD_ENABLE:-true}"
ENVIRONMENT
orb push --machine "$VM_NAME" "$ENV_FILE" agent-app/env.sh
orb -m "$VM_NAME" bash -lc 'chmod 600 "$HOME/agent-app/env.sh"'

cat <<INSTRUCTIONS

준비가 끝났습니다.

가상머신 접속:
  orb -m ${VM_NAME}

앱 실행 및 장애 증거 수집:
  source ~/agent-app/env.sh
  ~/agent-app/bin/run_case.sh oom baseline

실행 유형: oom, cpu, deadlock
비교 설정: baseline, adjusted
다른 케이스 예: ~/agent-app/bin/run_case.sh cpu adjusted

실행 자료 위치: ~/agent-app/evidence/
관제 로그 위치: ~/agent-app/logs/monitor.log
실행 도중 Ctrl-C를 누르면 앱은 유지한 채 증거 수집만 멈춥니다.
INSTRUCTIONS
