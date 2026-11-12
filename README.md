# 리눅스 프로세스 및 시스템 리소스 트러블슈팅

`agent-leak-app-x86`를 Linux 가상머신에서 실행해 OOM, CPU 과점유, Deadlock 증거를 수집하고 결과를 이슈 형식의 보고서로 정리하는 과제입니다. 세 장애를 반복 재현할 수 있도록 이전 시스템 자동화 과제의 VM 준비, 앱 설정, 관제 흐름을 이번 과제에 맞게 연결했습니다.

## 자동화 스크립트

| 파일 | 역할 |
|---|---|
| `scripts/setup_vm.sh` | OrbStack Ubuntu 24.04 VM 생성 또는 재사용, Linux 도구 설치, 디렉터리/API 키 준비, 앱과 과제 스크립트 복사 |
| `scripts/run_case.sh` | OOM·CPU·Deadlock 설정별 앱 실행, 앱 로그와 PID·프로세스·스레드·관제 증거 수집 |
| `monitor.sh` | 앱의 PID·CPU·RSS 메모리·생존 시간·15034 포트 상태를 한 번 기록하고 로그 순환 보관 |

이전 과제의 SSH 포트 변경, 방화벽, 사용자·그룹·ACL 설정은 이번 장애 분석과 관계가 없어 가져오지 않았습니다. VM 초기화나 네트워크 보안 설정으로 장애 재현 조건이 바뀌는 것도 피합니다.

## 1. 가상머신 준비

OrbStack이 설치되어 있어야 합니다. 스크립트가 Ubuntu 24.04 amd64 VM을 만들거나 같은 이름의 기존 VM을 재사용합니다. 제공 바이너리가 x86용이므로 기본 아키텍처는 `amd64`입니다.

```bash
./scripts/setup_vm.sh
```

기본 VM 이름은 `system-troubleshooting`이고, Linux 사용자는 호스트 사용자 이름과 같습니다. 새 VM의 이름, 사용자, 아키텍처는 `VM_NAME`, `VM_USER`, `VM_ARCH`로 지정할 수 있습니다.

```bash
VM_NAME=troubleshooting-lab VM_USER=student ./scripts/setup_vm.sh
```

설정이 끝나면 다음과 같이 VM에 접속합니다.

```bash
orb -m system-troubleshooting
```

## 2. 장애 재현 및 증거 수집

VM 안에서 실행 환경을 읽고, 아래 명령으로 유형과 비교 설정을 선택합니다.

```bash
source ~/agent-app/env.sh
~/agent-app/bin/run_case.sh oom baseline
```

| 장애 유형 | 기준 설정 `baseline` | 조정 설정 `adjusted` |
|---|---|---|
| `oom` | `MEMORY_LIMIT=128` MB | `MEMORY_LIMIT=512` MB |
| `cpu` | `CPU_MAX_OCCUPY=10`% | `CPU_MAX_OCCUPY=100`% |
| `deadlock` | `MULTI_THREAD_ENABLE=true` | `MULTI_THREAD_ENABLE=false` |

예를 들어 CPU 조정 결과는 `~/agent-app/bin/run_case.sh cpu adjusted`로 실행합니다. OOM·CPU 비교는 교착상태가 섞이지 않도록 멀티스레드를 끄며, 교착상태는 별도 케이스에서만 비교합니다. 앱은 root가 아닌 VM 사용자로 실행됩니다. 교착상태처럼 앱이 종료되지 않으면 `Ctrl-C` 또는 `OBSERVE_SECONDS=30`으로 관제 수집만 멈출 수 있으며, 실행 중인 앱은 남겨 두어 PID와 스레드 상태를 추가로 확인할 수 있습니다. 종료할 때 출력된 `kill <PID>` 명령을 사용합니다.

각 실행 자료는 `~/agent-app/evidence/<장애유형>/<실행시각>_<비교설정>/`에 저장됩니다.

- `application.log`: 앱 출력과 MemoryGuard·Watchdog·대기 로그
- `process-snapshots.log`: 주기별 PID, CPU, 메모리, 스레드 상태와 `top -H` 출력
- `monitor-snapshots.log`: 해당 실행의 `monitor.sh` 출력
- `app.pid`: 실행한 앱의 PID
- `~/agent-app/logs/monitor.log`: 누적 관제 기록

`monitor.sh`를 별도로 한 번 실행하려면 VM 안에서 `source ~/agent-app/env.sh` 후 `~/agent-app/bin/monitor.sh`를 실행합니다. 기본 설정은 10 MiB 단위로 로그를 회전하며 최근 10개 파일을 보관합니다.
