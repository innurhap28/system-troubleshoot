# 리눅스 프로세스 및 시스템 리소스 트러블슈팅

## 1. 구성

- `run_case.sh`: 앱 실행, 부팅 확인, 프로세스 탐색, 증거 수집 및 종료 관리
- `oom_test.sh`: `/proc` 기반 RSS/VmSize/PSS/Private_Dirty 수집
- `cpu_spike.sh`: 앱 내부 Current Load, 프로세스 CPU, 시스템 load average 수집
- `deadlock_test.sh`: 프로세스/스레드 상태, CPU tick, 로그 정체 시간 수집

## 2. 실행

`agent-admin` 일반 사용자로 실행한다.

```bash
cd /system-troubleshoot

bash run_case.sh oom baseline
bash run_case.sh oom adjusted

bash run_case.sh cpu baseline
bash run_case.sh cpu adjusted

bash run_case.sh deadlock baseline
bash run_case.sh deadlock adjusted
```

## 3. 실험 설정

| 케이스 | baseline | adjusted |
|---|---|---|
| OOM | `MEMORY_LIMIT=256` | `MEMORY_LIMIT=512` |
| CPU | `CPU_MAX_OCCUPY=80` | `CPU_MAX_OCCUPY=10` |
| Deadlock | `MULTI_THREAD_ENABLE=true` | `MULTI_THREAD_ENABLE=false` |

다른 변수는 케이스 간 간섭을 줄이도록 고정한다.

- OOM: CPU=10
- CPU: MEMORY_LIMIT=512, MULTI_THREAD_ENABLE=false
- Deadlock: MEMORY_LIMIT=512, CPU=10

## 4. 실행 시간 조정

기본 최대 실행 시간은 OOM 1500초, CPU 900초, Deadlock 600초다.
실행 시간 등의 변수값을 변경한 실험은 다음과 같이 진행한다. 

```bash
MAX_RUNTIME=30 EVIDENCE_INTERVAL=2 bash run_case.sh deadlock baseline
```

- `BOOT_TIMEOUT`: 부팅 대기 시간 (기본 30초)
- `EVIDENCE_INTERVAL`: 증거 수집 간격 (기본 3초)
- `OBSERVE_SECONDS`: 양수 지정 시 해당 시간 후 증거 수집만 중단하고 앱은 계속 실행
- `MAX_RUNTIME`: 최대 실행 시간 (케이스별 기본값 적용)

## 5. 증거 저장 위치

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

각 케이스의 baseline과 adjusted를 각각 실행한 뒤 `run-summary.txt`, CSV, 로그 등을 비교해 리포트를 작성한다.

## 6. 환경 정리

실험 종료 후 VM을 삭제하려면 제공된 `remove.sh`를 사용할 수 있다.

```bash
bash remove.sh -n <VM_NAME>
# 또는
bash remove.sh --name <VM_NAME>
```
