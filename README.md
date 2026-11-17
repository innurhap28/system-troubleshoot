# 리눅스 프로세스 및 시스템 리소스 트러블슈팅

## 1. 구성

- `run_case.sh`: 앱 실행, 부팅 확인, 프로세스 탐색, 증거 수집 및 종료 관리
- `oom_test.sh`: `/proc` 기반 RSS/VmSize/PSS/Private_Dirty 수집
- `cpu_spike.sh`: 앱 내부 Current Load, 프로세스 CPU, 시스템 load average 수집
- `deadlock_test.sh`: 프로세스/스레드 상태, CPU tick, 로그 정체 시간 수집

기존 배포된 `$AGENT_HOME/bin/monitor.sh`를 함께 호출한다. 앱 로그(`agent_app.log`)와 앱 stdout/stderr는 서로 다른 파일로 보존한다.

## 2. 설치 위치

네 파일을 같은 디렉터리에 둔다. `run_case.sh`는 진단 스크립트를 `$AGENT_HOME/bin/`에서 먼저 찾고, 없으면 자기 파일과 같은 디렉터리에서 찾는다.

앱 바이너리는 GitHub 기준 경로인 `$AGENT_HOME/agent-leak-app`을 우선 사용한다. 기존 배포본 `$AGENT_HOME/bin/agent-leak-app` 또는 `$AGENT_HOME/bin/agent-leak-app-x86`도 지원한다.

## 3. 실행

`agent-admin` 일반 사용자로 실행한다. root 실행은 미션 조건에 따라 거부한다.

```bash
cd /system-troubleshoot

bash run_case.sh oom baseline
bash run_case.sh oom adjusted

bash run_case.sh cpu baseline
bash run_case.sh cpu adjusted

bash run_case.sh deadlock baseline
bash run_case.sh deadlock adjusted
```

환경변수는 GitHub 기준 저장소처럼 로그인 셸의 환경변수를 사용한다. `AGENT_HOME`, `AGENT_PORT`, `AGENT_UPLOAD_DIR`, `AGENT_KEY_PATH`, `AGENT_LOG_DIR`가 이미 설정돼 있으면 그 값을 사용한다. `$HOME/agent-app/env.sh`가 있으면 먼저 읽는다. 미설정 시 기준 저장소 기본 경로를 사용한다.

## 4. 실험 설정

| 케이스 | baseline | adjusted |
|---|---|---|
| OOM | `MEMORY_LIMIT=256` | `MEMORY_LIMIT=512` |
| CPU | `CPU_MAX_OCCUPY=80` | `CPU_MAX_OCCUPY=10` |
| Deadlock | `MULTI_THREAD_ENABLE=true` | `MULTI_THREAD_ENABLE=false` |

다른 변수는 케이스 간 간섭을 줄이도록 고정한다.

- OOM: CPU=10
- CPU: MEMORY_LIMIT=512, MULTI_THREAD_ENABLE=false
- Deadlock: MEMORY_LIMIT=512, CPU=10

## 5. 실행 시간 조정

기본 최대 실행 시간은 기준 저장소의 실험 시간에 맞춰 OOM 1500초, CPU 900초, Deadlock 600초다.

빠른 동작 확인만 할 때는 다음처럼 줄일 수 있지만, 짧은 실행은 실제 장애 재현 증거로 제출하면 안 된다.

```bash
MAX_RUNTIME=30 EVIDENCE_INTERVAL=2 bash run_case.sh deadlock baseline
```

- `BOOT_TIMEOUT`: 부팅 대기 시간 (기본 30초)
- `EVIDENCE_INTERVAL`: 증거 수집 간격 (기본 3초)
- `OBSERVE_SECONDS`: 양수 지정 시 해당 시간 후 증거 수집만 중단하고 앱은 계속 실행
- `MAX_RUNTIME`: 최대 실행 시간 (케이스별 기본값 적용)

## 6. 증거 저장 위치

각 실행 결과는 다음 구조로 저장된다.

```text
$AGENT_HOME/evidence/<case>/<timestamp>_<profile>_<random>/
├── config.env
├── run-summary.txt
├── app.pid
├── target.pid
├── application-stdout.log
├── app-logs/
│   ├── agent_app.log
│   └── monitor.log
├── process-snapshots.log
├── monitor-snapshots.log
├── collector-errors.log
├── oom-diagnostics.log       # OOM만
├── oom-diagnostics.csv       # OOM만
├── cpu-process.log           # CPU만
├── cpu-process.csv           # CPU만
├── deadlock-diagnostics.log  # Deadlock만
└── deadlock-diagnostics.csv  # Deadlock만
```

각 케이스의 baseline과 adjusted를 각각 실행한 뒤 `run-summary.txt`, CSV, 로그를 비교해 리포트를 작성한다.

## 7. 환경 정리

실험 종료 후 VM을 삭제하려면 제공된 `remove.sh`를 사용할 수 있다.

```bash
bash remove.sh -n <VM_NAME>
# 또는
bash remove.sh --name <VM_NAME>
```

## 8. 검증 범위 및 주의 사항

스크립트 문법 검사(`bash -n`)와 임시 모의 앱/모의 monitor를 이용한 OOM·CPU·Deadlock 실행 흐름 및 수집기 smoke test를 통과했다.

실제 제공 바이너리와 수업 서버에 접속할 수 없으므로, 실제 바이너리의 장애 발생 시점과 최종 Before/After 결과까지 여기서 검증한 것은 아니다.

실제 실행 결과의 `run-summary.txt`와 `collector-errors.log`를 확인하고, 수집된 증거를 바탕으로 장애 분석 리포트를 작성한다.
