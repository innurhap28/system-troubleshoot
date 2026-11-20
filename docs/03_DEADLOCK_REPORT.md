# [Bug] Deadlock - 멀티스레드 환경의 순환 자원 대기로 인한 교착 상태

## 0. Concept Overview (핵심 개념)

### 0.1 Deadlock (교착 상태)

교착 상태(Deadlock)란 둘 이상의 프로세스 또는 스레드가 서로 상대방이 점유한 자원을 기다리면서, 어떤 작업도 더 이상 진행하지 못하는 상태를 의미한다.

일반적으로 멀티스레드 환경에서는 여러 스레드가 공유 자원에 접근하기 때문에 동기화가 필요하다. 이때 Lock이나 Mutex와 같은 동기화 수단을 사용하여 한 번에 하나의 스레드만 특정 자원을 사용하도록 제어할 수 있다.

그러나 여러 스레드가 서로 다른 자원을 점유한 상태에서 상대방이 보유한 자원을 추가로 요청하면, 서로의 작업이 끝나기를 기다리는 순환 대기가 발생할 수 있다.

예를 들어 다음과 같은 상황이다.

- Thread A는 Resource 1을 획득한 상태에서 Resource 2를 요청한다.
- Thread B는 Resource 2를 획득한 상태에서 Resource 1을 요청한다.
- Thread A는 Thread B가 Resource 2를 반환하기를 기다린다.
- Thread B는 Thread A가 Resource 1을 반환하기를 기다린다.

두 스레드 모두 상대방의 자원 반환을 기다리기 때문에 작업이 진행되지 않는다.

### 0.2 교착 상태의 4가지 발생 조건

교착 상태가 발생하기 위해서는 일반적으로 다음 네 가지 조건이 동시에 성립해야 한다.

| 조건 | 설명 |
|---|---|
| Mutual Exclusion (상호 배제) | 하나의 자원을 한 번에 하나의 스레드만 사용할 수 있다. |
| Hold and Wait (점유 대기) | 자원을 점유한 상태에서 다른 자원을 추가로 요청하고 기다린다. |
| No Preemption (비선점) | 다른 스레드가 점유 중인 자원을 강제로 빼앗을 수 없다. |
| Circular Wait (순환 대기) | 여러 스레드가 서로 상대방이 점유한 자원을 기다리는 순환 구조가 형성된다. |

이 네 가지 조건 중 하나라도 제거하면 교착 상태를 예방할 수 있다.

### 0.3 Lock Ordering (락 획득 순서)

교착 상태를 예방하는 대표적인 방법 중 하나는 모든 스레드가 공유 자원을 동일한 순서로 획득하도록 설계하는 것이다.

예를 들어 모든 스레드가 Resource A를 먼저 획득한 뒤 Resource B를 획득하도록 통일하면, 서로 반대 순서로 자원을 획득하면서 발생하는 순환 대기를 방지할 수 있다.

이외에도 다음과 같은 방법을 사용할 수 있다.

- Lock Timeout: 일정 시간 동안 자원을 획득하지 못하면 대기를 중단한다.
- Deadlock Detection: 스레드 간 자원 대기 관계를 분석하여 교착 상태를 감지한다.
- Resource Ordering: 공유 자원의 획득 순서를 일관되게 유지한다.
- Lock Scope Reduction: Lock을 점유하는 시간을 최소화한다.

이번 실험에서는 `MULTI_THREAD_ENABLE` 환경변수를 변경하여 멀티스레드 환경에서 발생하는 교착 상태를 재현하고, 멀티스레드 비활성화 후 증상이 완화되는지 비교한다.

---

## 1. Description (현상 설명)

### 1.1 발생 현상

애플리케이션의 멀티스레드 모드가 활성화된 상태에서 두 워커 스레드가 서로 다른 공유 자원을 점유한 뒤, 상대방이 보유한 자원을 요청하면서 작업이 진행되지 않는 교착 상태가 발생했다.

기준 실험에서는 `MULTI_THREAD_ENABLE=true`로 설정했으며, `Worker-Thread-1`은 `Shared_Memory_A`를 획득하고 `Worker-Thread-2`는 `Socket_Pool_B`를 획득했다.

이후 두 스레드는 각각 상대방이 점유한 자원을 요청하면서 `WAITING... (Status: BLOCKED)` 로그를 남겼다.

해당 현상은 11:38:06경 확인되었으며, 애플리케이션 로그상 두 스레드가 서로 상대 자원을 기다리는 순환 대기 구조가 형성되었다.

외부에서는 프로세스가 종료되지 않고 실행 상태를 유지하지만, 내부 작업은 더 이상 진행되지 않는 형태로 나타났다.

### 1.2 발생 조건

- 실행 대상: `agent-leak-app-x86`
- 실행 환경: Linux
- 메모리 제한: `MEMORY_LIMIT=512`
- CPU 제한: `CPU_MAX_OCCUPY=10`
- 멀티스레드: `MULTI_THREAD_ENABLE=true`
- 장애 발생 조건: 여러 스레드가 서로 다른 공유 자원을 점유한 상태에서 상대방이 보유한 자원을 추가로 요청하는 경우

이번 실험에서는 메모리 및 CPU 제한을 고정하고 멀티스레드 활성화 여부에 따른 교착 상태 발생 차이를 확인했다.

## 2. Evidence & Logs (증거 자료)

### 2.1 실험 환경 및 재현 방법

실험은 `scripts/run_case.sh`를 통해 수행했다. 해당 스크립트는 실행 프로파일에 따라 환경변수를 설정하고, `deadlock_test.sh`를 이용해 프로세스와 스레드 상태 및 대기 채널을 수집한다.

기준 실험과 조치 실험은 다음 명령어로 실행했다.

```bash
# 기준 실험: 멀티스레드 활성화
bash scripts/run_case.sh deadlock baseline

# 조치 실험: 멀티스레드 비활성화
bash scripts/run_case.sh deadlock adjusted
```

Deadlock 전용 수집기인 `deadlock_test.sh`는 다음 정보를 수집한다.

- 프로세스 생존 여부 및 실행 상태
- 프로세스의 RSS 및 CPU 시간 변화
- 프로세스의 스레드 수
- 스레드별 상태 및 대기 채널(WCHAN)
- `ps -L` 및 `top -H`를 통한 스레드별 상태
- 애플리케이션 로그의 WAITING, BLOCKED, LOCK 관련 메시지
- CPU, RSS, 애플리케이션 로그의 변화 여부를 이용한 정체 징후

수집된 자료는 다음과 같다.

- `config.env`: 실험 환경변수 및 설정값
- `run-summary.txt`: 실행 시간, PID, 종료 상태 및 실험 결과
- `deadlock-diagnostics.log`: 프로세스 및 스레드 상태 진단 자료
- `deadlock-diagnostics.csv`: 시간별 CPU, RSS, 로그 변화 및 정체 판정 데이터
- `application-stdout.log`: 애플리케이션 실행 로그

### 2.2 시스템 관제 데이터

기준 실험의 `deadlock-diagnostics.log`에서 수집한 프로세스 및 스레드 상태는 다음과 같다.

```log
========== DEADLOCK SNAPSHOT 2026-11-15 11:38:05 ==========
PID: 41956
MULTI_THREAD_ENABLE: true
PROCESS_STATUS: ALIVE
CLASSIFICATION: OBSERVING
RSS_KB: 18604 (delta: 80)
APP_LOG_BYTES: 1077
DEADLOCK_KEYWORD_PRESENT: false

----- Process snapshot -----
PID    PPID STAT %CPU RSS   VSZ    ELAPSED NI WCHAN
41956  41948 SNl+ 0.4  18604 176152 00:08  10 futex_wait

----- Thread snapshot (ps -L) -----
LWP   %CPU STAT WCHAN
41956 0.4  SNl+ futex_wait
42093 0.0  SNl+ do_select
42094 0.0  SNl+ do_select

----- /proc/41956/status -----
State: S (sleeping)
Threads: 3

TID=41956 COMM=agent-leak-app- STATE=S WCHAN=__futex_wait
```

프로세스 진단 결과 PID 41956은 종료되지 않고 `ALIVE` 상태를 유지하고 있었다.

또한 프로세스의 스레드 수는 3개였으며, 메인 스레드의 대기 채널에서 `futex_wait`가 확인되었다.

`futex_wait`는 Linux에서 Futex 기반 동기화 객체를 기다릴 때 관찰될 수 있는 대기 상태다. 따라서 동기화 관련 대기가 발생했을 가능성을 뒷받침하지만, 이 값만으로 특정 Lock이나 교착 상태를 확정할 수는 없다.

특히 `ps -L` 결과에서 메인 스레드는 `futex_wait`, 나머지 두 스레드는 `do_select`로 기록되었다. 따라서 두 워커 스레드가 모두 커널 수준에서 Futex Lock을 기다리고 있었다고 단정하지 않는다.

이번 실험에서 교착 상태를 판단하는 핵심 근거는 애플리케이션 로그에 기록된 두 워커의 상호 자원 대기 관계이며, 커널 진단 자료는 프로세스가 종료되지 않은 채 대기 상태를 유지했다는 점을 보조적으로 뒷받침한다.

### 2.3 애플리케이션 로그

다음은 기준 실험의 애플리케이션 로그에서 발췌한 핵심 내용이다.

```log
[2026-11-15 11:37:57,446] [INFO] [SafetyGuard] Process priority lowered (nice=10).
[2026-11-15 11:37:57,446] [INFO] Agent listening at port 15034

[2026-11-15 11:37:59,458] [WARNING] [System] CAUTION: Strict resource locking is enabled.

[2026-11-15 11:38:04,488] [INFO] [Worker-Thread-1] Process Started. Attempting to lock [Shared_Memory_A]...
[2026-11-15 11:38:04,488] [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...

[2026-11-15 11:38:04,489] [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
[2026-11-15 11:38:04,489] [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)

[2026-11-15 11:38:06,501] [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
[2026-11-15 11:38:06,501] [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)

[2026-11-15 11:38:06,502] [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
[2026-11-15 11:38:06,502] [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
```

로그를 통해 다음과 같은 자원 점유 및 대기 관계를 확인할 수 있다.

| 스레드 | 점유한 자원 | 추가 요청 자원 | 상태 |
|---|---|---|---|
| Worker-Thread-1 | Shared_Memory_A | Socket_Pool_B | BLOCKED |
| Worker-Thread-2 | Socket_Pool_B | Shared_Memory_A | BLOCKED |

두 스레드는 각각 자원을 점유한 상태에서 상대방이 점유한 자원을 요청하고 있다.

이는 단순히 하나의 스레드가 외부 I/O를 기다리는 상황과 달리, 두 자원 사이에 순환 대기 관계가 형성되었음을 보여주는 핵심 증거다.

**(여기에 `application-stdout.log`의 두 스레드 자원 획득부터 BLOCKED 로그까지 이어지는 원본 구간을 첨부!)**

### 2.4 프로세스 진단 결과

기준 실험의 `run-summary.txt`에서 확인한 주요 결과는 다음과 같다.

```text
CASE_NAME=deadlock
PROFILE=baseline
RESULT=collection_stopped_app_running
APP_PID=41948
TARGET_PID=41956
APP_EXIT_STATUS=still_running
CLEANUP_EXIT_STATUS=not_performed
ELAPSED_SECONDS=213
MEMORY_LIMIT=512
CPU_MAX_OCCUPY=10
MULTI_THREAD_ENABLE=true
```

프로세스는 213초 동안 실행 상태를 유지했으며, 해당 시점에 애플리케이션이 종료된 것이 아니라 증거 수집이 종료되었다.

`RESULT=collection_stopped_app_running`은 수집 작업이 종료되었지만 대상 애플리케이션은 여전히 실행 중이었다는 의미다.

따라서 프로세스의 생존 여부만으로 정상 동작 여부를 판단할 수 없으며, 애플리케이션 로그와 스레드별 상태를 함께 확인해야 한다.

**(여기에 기준 실험의 `run-summary.txt`와 마지막 `deadlock-diagnostics.log`를 첨부!)**

## 3. Root Cause Analysis (원인 분석)

### 3.1 증거 분석

수집한 증거를 종합하면 다음과 같다.

- `Worker-Thread-1`은 `Shared_Memory_A`를 획득한 상태에서 `Socket_Pool_B`를 요청했다.
- `Worker-Thread-2`는 `Socket_Pool_B`를 획득한 상태에서 `Shared_Memory_A`를 요청했다.
- 두 스레드는 모두 `WAITING ... (Status: BLOCKED)` 로그를 남겼다.
- 프로세스는 종료되지 않고 `ALIVE` 상태를 유지했다.
- 메인 스레드의 대기 채널에서 `futex_wait`가 관찰되었다.

특히 두 워커 스레드가 서로 상대방의 자원을 기다리는 구조는 교착 상태의 핵심적인 특징인 Circular Wait에 해당한다.

다만 커널의 WCHAN 값은 스레드가 현재 어떤 커널 대기 경로에 있는지를 보여주는 자료이며, 특정 애플리케이션 Lock의 소유 관계나 순환 대기 자체를 직접 증명하지는 않는다.

따라서 애플리케이션 로그에서 확인된 자원 점유 및 대기 관계를 핵심 근거로 사용하고, 프로세스 및 스레드 진단 자료를 보조 근거로 활용한다.

### 3.2 기술적 원인

이번 장애의 근본 원인은 멀티스레드 환경에서 공유 자원의 획득 순서가 서로 다르게 구성된 데 있다.

두 워커 스레드의 동작은 다음과 같다.

1. `Worker-Thread-1`이 `Shared_Memory_A`를 획득한다.
2. `Worker-Thread-2`가 `Socket_Pool_B`를 획득한다.
3. `Worker-Thread-1`이 작업 완료를 위해 `Socket_Pool_B`를 요청한다.
4. `Worker-Thread-2`가 로그 기록을 위해 `Shared_Memory_A`를 요청한다.
5. 두 스레드 모두 상대방이 보유한 자원이 반환되기를 기다린다.

이로 인해 두 스레드 사이에 순환 대기 관계가 형성되고, 작업이 더 이상 진행되지 않는 상태가 발생했다.

이번 사례는 교착 상태의 네 가지 조건과 다음과 같이 연결된다.

| 발생 조건 | 이번 실험에서의 근거 |
|---|---|
| Mutual Exclusion | 각 스레드가 Lock을 획득하고 다른 스레드가 해당 자원을 기다리는 구조 |
| Hold and Wait | 각 스레드가 기존 자원을 보유한 채 추가 자원을 요청 |
| No Preemption | 로그상 기존 자원을 강제로 회수하는 동작이 확인되지 않음 |
| Circular Wait | Thread-1은 B를 기다리고 Thread-2는 A를 기다리는 순환 구조 |

이 중 Hold and Wait와 Circular Wait는 애플리케이션 로그에서 직접 확인할 수 있다.

Mutual Exclusion은 사용된 자원이 배타적 Lock으로 동작한다는 전제에 기반한다. No Preemption 역시 현재 로그만으로 자원 회수 정책을 완전히 증명할 수는 없으므로, 자원 관리 구현이나 추가 로그를 통해 확인할 필요가 있다.

### 3.3 최종 원인 판단

이번 장애는 멀티스레드 모드가 활성화된 상태에서 두 워커가 서로 다른 공유 자원을 점유하고, 반대 순서로 추가 자원을 요청하면서 발생한 순환 대기 문제로 판단한다.

애플리케이션 로그에서 두 스레드의 자원 획득 및 상호 대기 관계가 명시적으로 확인되므로, 단순한 프로세스 지연보다 교착 상태로 설명하는 것이 타당하다.

다만 `futex_wait` 및 `do_select`와 같은 커널 대기 채널은 개별 스레드의 대기 상태를 보여주는 보조 자료이며, 해당 값만으로 두 워커의 Lock 소유 관계를 확정하지 않는다.

## 4. Workaround & Verification (조치 및 검증)

### 4.1 조치 내용

기준 실험에서는 `MULTI_THREAD_ENABLE=true`로 설정하여 멀티스레드 동시성 모드를 활성화했다.

조치 실험에서는 해당 값을 `MULTI_THREAD_ENABLE=false`로 변경하여 멀티스레드 모드를 비활성화했다.

이번 조치의 목적은 여러 워커가 공유 자원을 동시에 점유하는 상황을 제거하고, 스레드 간 순환 대기 발생 가능성을 완화하는 것이다.

다만 멀티스레드를 비활성화하는 것은 교착 상태의 발생 조건을 우회하는 방법이며, 공유 자원 획득 순서가 잘못된 근본적인 설계를 수정한 것은 아니다.

### 4.2 Before & After 비교

현재 제공된 실행 요약 정보는 다음과 같다.

| 비교 항목 | Before | After |
|---|---|---|
| MULTI_THREAD_ENABLE | true | false |
| ELAPSED_SECONDS | 213초 | 213초 |
| RESULT | collection_stopped_app_running | collection_stopped_app_running |
| APP_EXIT_STATUS | still_running | still_running |
| 실행 결과 | 수집 종료 시 프로세스 생존 | 수집 종료 시 프로세스 생존 |

기준 실험에서는 멀티스레드 모드가 활성화된 상태에서 두 워커의 상호 자원 대기 로그가 확인되었다.

조치 실험에서는 멀티스레드 모드를 비활성화한 상태로 동일한 시간 동안 관측을 수행했다.

### 4.3 검증 결과

멀티스레드 모드를 비활성화한 뒤에도 프로세스는 213초의 관측 기간 동안 실행 상태를 유지했다.

그러나 `run-summary.txt`의 `collection_stopped_app_running`은 수집 작업이 종료된 시점에 프로세스가 살아 있었다는 의미일 뿐, 애플리케이션의 모든 작업이 정상적으로 완료되었다는 의미는 아니다.

따라서 조치가 성공적으로 이루어졌다고 판단하려면 다음 항목을 추가로 확인해야 한다.

- 조치 실험에서 두 워커의 `WAITING`, `BLOCKED` 로그가 더 이상 발생하지 않는지 확인한다.
- `deadlock-diagnostics.csv`에서 프로세스 및 스레드 상태가 장시간 정체되지 않는지 확인한다.
- 워커 작업이 실제로 완료되었다는 로그가 기록되는지 확인한다.
- 기준 실험과 조치 실험의 스레드 수 및 WCHAN 상태를 비교한다.

위 증거에서 조치 후 작업 완료와 교착 상태 미발생이 확인된다면, `MULTI_THREAD_ENABLE=false`가 이번 실험의 교착 상태를 우회하는 효과가 있다고 판단할 수 있다.

### 4.4 추가 개선 제안

- **Lock Ordering 적용:** 모든 스레드가 공유 자원을 동일한 순서로 획득하도록 설계하여 순환 대기를 예방한다.
- **Lock Timeout 도입:** 일정 시간 이상 Lock을 획득하지 못하면 대기를 중단하고 오류 처리 또는 재시도를 수행한다.
- **Lock Scope 최소화:** Lock을 보유하는 시간을 줄여 다른 스레드가 대기하는 시간을 최소화한다.
- **Deadlock Detection 구현:** 스레드와 자원 간 대기 관계를 추적하여 순환 대기가 발생하는지 감지한다.
- **자원 관리 정책 개선:** 필요한 경우 Lock을 일정한 순서로 획득하고, 작업 실패 시 이미 획득한 자원을 적절히 반환하도록 설계한다.

장기적으로는 멀티스레드 자체를 비활성화하는 것보다 공유 자원의 획득 순서를 통일하고, 동시성 제어 로직을 개선하여 병렬 처리 성능을 유지하면서 교착 상태를 방지하는 방향이 바람직하다.

## 5. Conclusion (최종 결론)

이번 실험에서는 `MULTI_THREAD_ENABLE=true` 환경에서 두 워커 스레드가 각각 `Shared_Memory_A`와 `Socket_Pool_B`를 점유한 뒤, 서로 상대방의 자원을 요청하면서 교착 상태가 발생하는 현상을 확인했다.

애플리케이션 로그에서 두 스레드의 자원 점유와 `WAITING... (Status: BLOCKED)` 메시지가 확인되었으며, 프로세스는 종료되지 않은 채 실행 상태를 유지했다.

이후 `MULTI_THREAD_ENABLE=false`로 조정하여 멀티스레드 동시성 모드를 비활성화하는 방식으로 조치했다.

다만 조치 실험의 실행 요약만으로는 실제 작업 완료 여부와 교착 상태 해소를 완전히 입증할 수 없으므로, 스레드 상태 및 워커 작업 완료 로그를 추가로 확인해야 한다.

**이번 장애의 핵심은 멀티스레드 환경에서 공유 자원의 획득 순서가 충돌하면서 순환 대기가 발생했고, 이를 방지하기 위해 자원 획득 순서와 동시성 제어 정책을 개선해야 한다는 점이다.**