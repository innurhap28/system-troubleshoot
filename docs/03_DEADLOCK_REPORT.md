# [Bug] Deadlock

## 1. Description (현상 설명)

### 1.1 발생 현상
- 애플리케이션은 멀티스레드 환경에서 교착 상태(deadlock)에 빠지는 장애를 겪었다.
- `MULTI_THREAD_ENABLE=true` 상태에서 `Worker-Thread-1`과 `Worker-Thread-2`가 각각 `Shared_Memory_A`와 `Socket_Pool_B`를 획득한 뒤, 서로 상대의 자원을 기다리는 상태를 보였다.
- 이 상태는 11:38:06 경에 발생했고, 시작 후 약 9초 안에 `WAITING... (Status: BLOCKED)`를 기록해 교착 상태가 확실하게 발생했다.
- 특히 하나의 스레드가 자원을 점유한 상태에서 다른 스레드가 같은 자원에 의존하며 멈추는 구조였기 때문에, 외부적으로는 작업이 멈춘 것처럼 보이지만 내부적으로는 lock cycle이 발생한 상태였다.

### 1.2 발생 조건
- 실행 환경: `MEMORY_LIMIT=512MB`, `CPU_MAX_OCCUPY=10`, `MULTI_THREAD_ENABLE=true`.
- 주요 환경변수 설정: 멀티스레드 모드가 활성화된 상태에서 자원 잠금 정책이 엄격하게 적용되었다.
- 장애 재현 시점: `System` 로그에서 `POTENTIAL DEADLOCK IN CONCURRENT MODE` 경고가 발생했고, 이후 각 스레드가 서로의 리소스를 요청하는 흐름이 나타났다.
- 즉, concurrency가 켜진 환경에서 lock acquisition 순서가 충돌하면서, 정상 운영 중에도 `wait-for cycle`가 발생할 수 있는 조건이 만들어진 것이다.

## 2. Evidence & Logs (증거 자료)

### 2.0 수집/파싱 명령어
- 실제 재현은 루트의 `scripts/run_case.sh`로 수행했고, Deadlock 증거는 `scripts/deadlock_test.sh`가 스레드/대기 채널/WCHAN 상태를 수집했다.
- 아래 명령어들로 실행 및 파싱을 수행했다.

```bash
# 1) 기준/조치 실험 실행
bash scripts/run_case.sh deadlock baseline
bash scripts/run_case.sh deadlock adjusted

# 2) Deadlock 전용 증거 수집기 실행
MULTI_THREAD_ENABLE="$MULTI_THREAD_ENABLE" bash scripts/deadlock_test.sh "$TARGET_PID" "$APP_LOG" "$DEADLOCK_LOG"

# 3) 스레드/락 대기 파싱
ps -p "$APP_PID" -o pid,ppid,stat,pcpu,rss,vsz,etime,nice,wchan:25,comm,args
ps -L -p "$APP_PID" -o lwp,pcpu,stat,wchan:25,time,cmd
for task_dir in /proc/$APP_PID/task/*; do
  tid="${task_dir##*/}"
  state="$(awk '/^State:/ {print $2}' "${task_dir}/status" 2>/dev/null || true)"
  wchan="$(cat "${task_dir}/wchan" 2>/dev/null || echo unavailable)"
  printf 'TID=%s STATE=%s WCHAN=%s\n' "$tid" "${state:-unknown}" "$wchan"
done

grep -Ei 'WAITING|BLOCKED|LOCK|DEADLOCK|THREAD|JOIN|MUTEX|SEMAPHORE' "$APP_LOG" | tail -n 40
grep -E '^(Name|State|VmRSS|VmSize|Threads|voluntary_ctxt_switches|nonvoluntary_ctxt_switches):' /proc/$APP_PID/status

# 4) 요약 파일 비교
cat docs/deadlock-before/run-summary.txt
cat docs/deadlock-after/run-summary.txt
```

- 이 흐름으로 `deadlock-diagnostics.log`, `deadlock-diagnostics.csv`, `run-summary.txt`, `config.env`, `application-stdout.log`를 비교해 `futex_wait`와 `BLOCKED` 상태가 실제로 lock cycle를 의미하는지 검증했다.

### 2.1 시스템 관제 데이터
- `docs/deadlock-before/deadlock-diagnostics.log` 에서 프로세스는 `PID=41956`, `Threads: 3`, `WCHAN=futex_wait` 상태로 관찰되었다.
``` log
========== DEADLOCK SNAPSHOT 2026-11-15 11:38:05 ==========
PID: 41956
MULTI_THREAD_ENABLE: true
PROCESS_STATUS: ALIVE
CLASSIFICATION: OBSERVING
RSS_KB: 18604 (delta: 80)
APP_LOG_BYTES: 1077
DEADLOCK_KEYWORD_PRESENT: false
----- Process snapshot -----
    PID    PPID STAT %CPU   RSS    VSZ     ELAPSED  NI WCHAN                     COMMAND         COMMAND
  41956   41948 SNl+  0.4 18604 176152       00:08  10 futex_wait                agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread snapshot (ps -L) -----
    LWP %CPU STAT WCHAN                         TIME CMD
  41956  0.4 SNl+ futex_wait                00:00:00 /home/innuendo3712/agent-app/bin/agent-leak-app-x86
  42093  0.0 SNl+ do_select                 00:00:00 /home/innuendo3712/agent-app/bin/agent-leak-app-x86
  42094  0.0 SNl+ do_select                 00:00:00 /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- /proc/41956/status -----
State: S (sleeping)
Threads: 3
TID=41956 COMM=agent-leak-app- STATE=S WCHAN=__futex_wait
```
- 스레드 수는 증가했고, `RSS`와 CPU 변화는 거의 정체되어 있었으며 이는 대기 상태로의 진입을 지지한다.
- 이 상태는 task가 실제로는 끝나지 않았으나 리소스 대기를 계속하고 있다는 점에서, 장시간 서비스 중단을 유발하는 대표적인 deadlock 패턴이다.

### 2.2 애플리케이션 로그
- 핵심 로그:
``` log
2026-11-15 11:37:57,446 [INFO] [SafetyGuard] Process priority lowered (nice=10).
2026-11-15 11:37:57,446 [INFO] Agent listening at port 15034
2026-11-15 11:37:59,458 [WARNING] [System] CAUTION: Strict resource locking is enabled.
2026-11-15 11:38:04,488 [INFO] [Worker-Thread-1] Process Started. Attempting to lock [Shared_Memory_A]...
2026-11-15 11:38:04,488 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 11:38:04,489 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 11:38:04,489 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 11:38:06,501 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 11:38:06,501 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 11:38:06,502 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 11:38:06,502 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
```
- 마지막 로그 지점이 바로 교착 상태의 직접 증거이며, 서로가 상대 자원을 요구하고 대기 상태에 빠진 것이다.
- 이 로그는 단일 스레드의 I/O 대기와는 다르게, 두 스레드가 각각 다른 lock을 보유한 상태에서 서로를 향해 대기하는 순환 구조를 분명하게 나타낸다.

### 2.3 프로세스 진단 결과
- `run-summary.txt`에 따르면 기준 실험에서 `MULTI_THREAD_ENABLE=true`, `ELAPSED_SECONDS=213`, `RESULT=collection_stopped_app_running`으로 기록되었다.
``` log
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
- 즉, 애플리케이션은 종료되지 않았지만, 메인 작업이 멈춘 채 계속 실행 상태로 남았다.
- `ps`/`top` 진단 결과는 스레드가 `futex_wait`에 묶여 있고, CPU와 메모리 변화가 거의 정지된 상태라는 점을 보여준다.

## 3. Root Cause Analysis (원인 분석)

### 3.1 증거 분석
- 두 스레드가 각각 자원을 획득한 다음, 상대 자원을 다시 요청하는 순환 의존 구조를 보였다.
- `Worker-Thread-1`은 `Shared_Memory_A`를 보유한 채 `Socket_Pool_B`를 기다리고,
- `Worker-Thread-2`는 `Socket_Pool_B`를 보유한 채 `Shared_Memory_A`를 기다리고 있었다.
- 이 구조는 전형적인 circular wait이며, 교착 상태를 설명하는 대표적인 패턴이다.
- 또한 `futex_wait`와 `WCHAN` 값이 함께 관찰되었기 때문에, 로그 말고도 커널 수준에서도 해당 스레드가 lock 대기 상태에 들어갔음을 확인할 수 있다.

### 3.2 기술적 원인
- 멀티스레드 동시성 모드가 활성화되어 있으나, 락 획득 순서가 서로 반대로 설정되었다.
- 자원 `A`와 `B`를 각각 획득한 뒤, 각 스레드가 다른 자원을 요구하면서 상호 대기하게 되었다.
- 커널 관측에서는 `futex_wait` 상태와 `WCHAN=__futex_wait`가 확인되어, 실제 워커 스레드가 락을 기다리는 상태로 정지되었음을 보여준다.
- 결과적으로 `WAITING for [X]... (Status: BLOCKED)`와 `futex_wait`는 같은 문제를 서로 다른 계층에서 보여주는 증거이며, 둘을 결합하면 deadlock을 강하게 입증할 수 있다.

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
- 이 비교는 교착 상태가 단지 “프로세스가 멈춘 상태”가 아니라, `MULTI_THREAD_ENABLE`에 의해 활성화된 lock cycle 때문에 발생했음을 보여준다.

### 4.3 검증 결과
- 멀티스레드 모드를 끄자 교착 상태 증상이 사라졌다.
- 프로세스는 종료하지 않았고, 관측 기간 동안 `WAITING... BLOCKED` 로그가 기록되지 않았으며, `futex_wait` 상태도 더 이상 누적되지 않았다.
- 따라서 교착 상태의 핵심 원인은 `MULTI_THREAD_ENABLE=true`로 인한 동시 락 경합으로 결론지을 수 있다.
- 이를 통해 thread가 아닌 resource ordering 문제라는 근본 원인을 더 구체적으로 제시할 수 있다.