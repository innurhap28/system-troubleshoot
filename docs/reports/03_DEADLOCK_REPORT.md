# [Bug] Deadlock

## 1. Description (현상 설명)

### 1.1 발생 현상
- 애플리케이션은 멀티스레드 환경에서 교착 상태(deadlock)에 빠지는 장애를 겪었다.
- `MULTI_THREAD_ENABLE=true` 상태에서 `Worker-Thread-1`과 `Worker-Thread-2`가 각각 `Shared_Memory_A`와 `Socket_Pool_B`를 획득한 뒤, 서로 상대의 자원을 기다리는 상태를 보였다.
- 이 상태는 11:38:06 경에 발생했고, 시작 후 약 9초 안에 `WAITING... (Status: BLOCKED)`를 기록해 교착 상태가 확실하게 발생했다.

### 1.2 발생 조건
- 실행 환경: `MEMORY_LIMIT=512MB`, `CPU_MAX_OCCUPY=10`, `MULTI_THREAD_ENABLE=true`.
- 주요 환경변수 설정: 멀티스레드 모드가 활성화된 상태에서 자원 잠금 정책이 엄격하게 적용되었다.
- 장애 재현 시점: `System` 로그에서 `POTENTIAL DEADLOCK IN CONCURRENT MODE` 경고가 발생했고, 이후 각 스레드가 서로의 리소스를 요청하는 흐름이 나타났다.

## 2. Evidence & Logs (증거 자료)

### 2.1 시스템 관제 데이터
- `docs/deadlock-before/deadlock-diagnostics.log` 에서 프로세스는 `PID=41956`, `Threads: 3`, `WCHAN=futex_wait` 상태로 관찰되었다.
- 초기에는 `do_select` 상태였지만, 곧 `futex_wait`와 함께 잠금 대기 상태로 전환되었다.
- `ps -L` 결과에서 스레드 상태는 다음과 같았다.
  - `41956 0.4 SNl+ futex_wait ...`
  - `42093 0.0 SNl+ do_select ...`
  - `42094 0.0 SNl+ do_select ...`
- 스레드 수는 증가했고, `RSS`와 CPU 변화는 거의 정체되어 있었으며 이는 대기 상태로의 진입을 지지한다.

### 2.2 애플리케이션 로그
- 핵심 로그:
  - `2026-11-15 11:37:59,458 [WARNING] [System] CAUTION: Strict resource locking is enabled.`
  - `2026-11-15 11:38:04,488 [INFO] [Worker-Thread-1] Process Started. Attempting to lock [Shared_Memory_A]...`
  - `2026-11-15 11:38:04,488 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...`
  - `2026-11-15 11:38:04,489 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)`
  - `2026-11-15 11:38:04,489 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)`
  - `2026-11-15 11:38:06,501 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.`
  - `2026-11-15 11:38:06,501 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)`
  - `2026-11-15 11:38:06,502 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.`
  - `2026-11-15 11:38:06,502 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)`
- 마지막 로그 지점이 바로 교착 상태의 직접 증거이며, 서로가 상대 자원을 요구하고 대기 상태에 빠진 것이다.

### 2.3 프로세스 진단 결과
- `run-summary.txt`에 따르면 기준 실험에서 `MULTI_THREAD_ENABLE=true`, `ELAPSED_SECONDS=213`, `RESULT=collection_stopped_app_running`으로 기록되었다.
- 즉, 애플리케이션은 종료되지 않았지만, 메인 작업이 멈춘 채 계속 실행 상태로 남았다.
- `ps`/`top` 진단 결과는 스레드가 `futex_wait`에 묶여 있고, CPU와 메모리 변화가 거의 정지된 상태라는 점을 보여준다.

## 3. Root Cause Analysis (원인 분석)

### 3.1 증거 분석
- 두 스레드가 각각 자원을 획득한 다음, 상대 자원을 다시 요청하는 순환 의존 구조를 보였다.
- `Worker-Thread-1`은 `Shared_Memory_A`를 보유한 채 `Socket_Pool_B`를 기다리고,
- `Worker-Thread-2`는 `Socket_Pool_B`를 보유한 채 `Shared_Memory_A`를 기다리고 있었다.
- 이 구조는 전형적인 circular wait이며, 교착 상태를 설명하는 대표적인 패턴이다.

### 3.2 기술적 원인
- 멀티스레드 동시성 모드가 활성화되어 있으나, 락 획득 순서가 서로 반대로 설정되었다.
- 자원 `A`와 `B`를 각각 획득한 뒤, 각 스레드가 다른 자원을 요구하면서 상호 대기하게 되었다.
- 커널 관측에서는 `futex_wait` 상태와 `WCHAN=__futex_wait`가 확인되어, 실제 워커 스레드가 락을 기다리는 상태로 정지되었음을 보여준다.

### 3.3 원인 판단 근거
- 다른 가능성으로는 단순한 I/O 대기나 스레드 생성 지연이 있을 수 있으나, 자원 `A`와 `B`를 각자 보유한 뒤 서로 상대 자원을 요청하는 로그가 직접 확인되었다.
- 따라서 교착 상태가 아닌 단순 지연 가능성은 배제되며, 실제 deadlock 조건이 성립한다.
- 실험 후 `MULTI_THREAD_ENABLE=false`로 변경한 상태에서 같은 증상이 사라진 점도, 교착 상태의 직접적 원인이 멀티스레드 락 경합이라는 근거가 된다.

## 4. Workaround & Verification (조치 및 검증)

### 4.1 조치 내용
- 기준 실험에서는 `MULTI_THREAD_ENABLE=true`.
- 조치 실험에서는 `MULTI_THREAD_ENABLE=false`로 변경하여 멀티스레드 동시성 모드를 비활성화했다.
- 조치 목적은 공유 자원에 대한 대기 루프를 제거하고, 스레드 간 순환 대기를 해소하는 것이었다.

### 4.2 Before & After 비교
- 기준 실험:
  - `MULTI_THREAD_ENABLE=true`
  - `ELAPSED_SECONDS=213`
  - `RESULT=collection_stopped_app_running`
  - `Worker-Thread-1/2`가 각각 자원을 보유한 상태에서 서로를 기다렸다.
- 조치 후 실험:
  - `MULTI_THREAD_ENABLE=false`
  - `ELAPSED_SECONDS=213`
  - `RESULT=collection_stopped_app_running`
  - `DEADLOCK_KEYWORD_PRESENT: false`
  - `app log`에는 대기/차단 로그가 없고, 프로세스는 계속 살아 있으나 대기 상태가 사라졌다.

### 4.3 검증 결과
- 멀티스레드 모드를 끄자 교착 상태 증상이 사라졌다.
- 프로세스는 종료하지 않았고, 관측 기간 동안 `WAITING... BLOCKED` 로그가 기록되지 않았으며, `futex_wait` 상태도 더 이상 누적되지 않았다.
- 따라서 교착 상태의 핵심 원인은 `MULTI_THREAD_ENABLE=true`로 인한 동시 락 경합으로 결론지을 수 있다.

### 4.4 추가 개선 제안
- 락 획득 순서를 통일해야 한다.
- 자원 확보 시 timeout과 retry 메커니즘을 추가해 교착 상태 진입을 방지해야 한다.
- 장기적으로는 스레드가 공유 자원을 순차적으로 획득하는 lock ordering, deadlock detector, lock timeout 정책을 도입하는 것이 필요하다.

---
Deadlock 리포트 필수 증거 최소 요건
PID 존재 증거(ps -ef | grep …)
CPU/MEM 변화 정체 증거(top -H 또는 ps -L)
마지막 로그 지점("WAITING… BLOCKED")
스레드/락 대기 추론 근거