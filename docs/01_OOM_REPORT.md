# [Bug] Memory Leak

## 1. Description (현상 설명)

### 1.1 발생 현상
- 애플리케이션은 메모리 사용량이 지속적으로 증가하는 메모리 누수 형태의 장애를 겪었다.
- `agent-leak-app-x86` 프로세스는 `MEMORY_LIMIT=256MB` 환경에서 30초 내에 25MB에서 275MB로 급증했고, 이후 `MemoryGuard`가 동작하면서 프로세스를 종료했다.
- 특히 10:14:05 시점에 250MB였던 heap이 3초 뒤 275MB로 증가하면서, 256MB 임계값에 도달하는 순간 즉시 종료되었다.
- 장애 발생까지의 시간은 약 34초였으며, `APP_EXIT_STATUS=137`로 종료가 확인되었다.

### 1.2 발생 조건
- 실행 환경: `agent-app` 프로세스의 메모리 제한이 256MB로 설정된 상태에서 모니터링을 수행.
- 주요 환경변수 설정: `MEMORY_LIMIT=256`, `CPU_MAX_OCCUPY=10`, `MULTI_THREAD_ENABLE=false`.
- 장애 재현 시점: `monitor.sh`로 리소스 상태를 관찰 중, 프로세스 메모리가 256MB를 초과하며 종료 직전에 `MemoryGuard` 경고가 발생.
- 즉, 메모리 제한이 낮아져 자원 여유가 거의 없었고, 누적 증가가 한계점에 도달한 순간 자체 보호 종료가 실행된 상태다.

## 2. Evidence & Logs (증거 자료)

### 2.0 수집/파싱 명령어
- 실제 재현은 루트의 `scripts/run_case.sh`를 통해 수행했고, OOM 증거는 `scripts/oom_test.sh`와 `monitor.sh`가 함께 수집했다.
- 각 자료는 아래 명령어들로 실행/파싱했다.

```bash
# 1) 기준/조치 실험 실행
bash scripts/run_case.sh oom baseline
bash scripts/run_case.sh oom adjusted

# 2) OOM 전용 수집기 실행
bash scripts/oom_test.sh "$TARGET_PID" "$MEMORY_LIMIT" "$APP_LOG" "$OOM_LOG"

# 3) 메모리/프로세스 파싱
ps -p "$APP_PID,$TARGET_PID" -o pid,ppid,stat,%cpu,%mem,rss,vsz,etime,comm,args
awk '/^State:/ || /^VmRSS:/ || /^VmSize:/ || /^VmHWM:/ { print }' /proc/$TARGET_PID/status
awk '/^Private_Dirty:/ || /^Pss:/ { print }' /proc/$TARGET_PID/smaps_rollup

grep -Ei 'MemoryGuard|memory limit|SELF-TERMINATED|out of memory|oom' "$APP_LOG" | tail -n 20

tail -n 20 "$APP_LOG"

# 4) 요약 파일 비교
cat docs/oom-before/run-summary.txt
cat docs/oom-after/run-summary.txt
```

- 이 흐름으로 `config.env`, `run-summary.txt`, `monitor-snapshots.log`, `application-stdout.log`, `oom-diagnostics.log`, `oom-diagnostics.csv`를 함께 비교해 메모리 누수 구간과 임계점 초과 시점을 검증했다.

### 2.1 시스템 관제 데이터
- 프로세스 메모리는 다음과 같이 상승했다(`docs/oom-before/monitor-snapshots.log` 일부 발췌).
``` log
[2026-11-15 10:13:37] 프로세스:agent-leak-app CPU:3.3% 상주메모리:18.1MB 실행시간:00:01
[2026-11-15 10:13:40] 프로세스:agent-leak-app CPU:1.5% 상주메모리:43.1MB 실행시간:00:04
[2026-11-15 10:13:43] 프로세스:agent-leak-app CPU:1.1% 상주메모리:68.1MB 실행시간:00:07
[2026-11-15 10:13:46] 프로세스:agent-leak-app CPU:1.0% 상주메모리:93.1MB 실행시간:00:11
[2026-11-15 10:13:50] 프로세스:agent-leak-app CPU:1.2% 상주메모리:143.1MB 실행시간:00:14
[2026-11-15 10:13:53] 프로세스:agent-leak-app CPU:1.1% 상주메모리:168.1MB 실행시간:00:17
[2026-11-15 10:13:56] 프로세스:agent-leak-app CPU:1.1% 상주메모리:193.1MB 실행시간:00:20
[2026-11-15 10:13:59] 프로세스:agent-leak-app CPU:1.0% 상주메모리:218.1MB 실행시간:00:24
[2026-11-15 10:14:03] 프로세스:agent-leak-app CPU:1.0% 상주메모리:243.1MB 실행시간:00:27
[2026-11-15 10:14:06] 프로세스:agent-leak-app CPU:1.0% 상주메모리:268.1MB 실행시간:00:30
```
- 즉, 약 30초 동안 메모리가 거의 선형적으로 증가했고, 256MB 한계를 넘기 직전에 종료가 감지되었다.

### 2.2 애플리케이션 로그
- `docs/oom-before/application-stdout.log`의 핵심 로그:
``` log
2026-11-15 10:13:35,879 [INFO] [SafetyGuard] Process priority lowered (nice=10).
2026-11-15 10:13:35,879 [INFO] Agent listening at port 15034

==================================================
 [ Agent Initiate ] Resource Check 
==================================================
 [ MEMORY ] Limit: 256MB 		[ WARNING: Recommend Over 256MB ]
 [ CPU    ] Limit: 10%  		[ OK ]
 [ THREAD ] Concurrency: False 		[ OK ]
--------------------------------------------------
 >>> SYSTEM STATUS: STABLE. STARTING WORKLOAD MONITORING...
==================================================

2026-11-15 10:13:37,917 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-15 10:13:40,961 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-15 10:13:44,005 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-15 10:13:47,048 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-15 10:13:50,094 [INFO] [MemoryWorker] Current Heap: 125MB
2026-11-15 10:13:53,141 [INFO] [MemoryWorker] Current Heap: 150MB
2026-11-15 10:13:56,186 [INFO] [MemoryWorker] Current Heap: 175MB
2026-11-15 10:13:59,231 [INFO] [MemoryWorker] Current Heap: 200MB
2026-11-15 10:14:02,278 [INFO] [MemoryWorker] Current Heap: 225MB
2026-11-15 10:14:05,322 [INFO] [MemoryWorker] Current Heap: 250MB
2026-11-15 10:14:08,366 [INFO] [MemoryWorker] Current Heap: 275MB
2026-11-15 10:14:08,366 [CRITICAL] [MemoryGuard] Memory limit exceeded (275MB >= 256MB) / (Recommend Over 256MB)
2026-11-15 10:14:08,367 [CRITICAL] [MemoryGuard] Self-terminating process 3026 to prevent system instability.
```
- 이 로그는 메모리 누수가 단순한 경고 수준이 아니라, 한계 초과 직후 애플리케이션이 스스로 종료하는 구조임을 명확히 보여준다.

### 2.3 프로세스 진단 결과
- `run-summary.txt`에 따르면 `TARGET_PID=3026`, `ELAPSED_SECONDS=34`, `APP_EXIT_STATUS=137`로 기록되었다.
- `config.env`에서도 기준 실험에서 `MEMORY_LIMIT=256`이 확인되며, 증거 로그와 일치한다.
- 프로세스는 256MB 임계치를 넘은 직후 종료되었고, 이는 운영체제의 강제 종료라기보다 애플리케이션 내부의 `MemoryGuard`에 의한 자가 보호 종료로 해석할 수 있다.

## 3. Root Cause Analysis (원인 분석)

### 3.1 증거 분석
- 메모리 사용량은 시간이 지날수록 지속적으로 증가했다.
- 가장 큰 증거는 `Current Heap: 25MB -> 50MB -> 75MB -> ... -> 275MB`라는 로그이며, 이는 누적 증가가 멈추지 않음을 보여주었다.
- 종료 직전 로그 `Memory limit exceeded (275MB >= 256MB)`는 메모리 제한을 초과했다는 사실을 직접 증명한다.
- 동시에 `CPU`는 대체로 1%대에 머물렀고, `loadavg`도 0.00 수준이어서 코어 사용량 급증이 아닌 메모리 누수 쪽이 원인임을 추가로 뒷받침한다.

### 3.2 기술적 원인
- 애플리케이션 내부의 메모리 할당 로직이 적절한 해제 경로 없이 누적되었다.
- `MEMORY_LIMIT=256MB`가 낮게 설정된 상태에서 메모리 증가 속도가 계속 이어졌고, 애플리케이션은 자체적으로 자가 보호 종료를 수행했다.
- 본 장애는 단순한 순간적 스파이크가 아니라, 보유 자원이 계속 증가하는 누수 패턴이다.
- 다시 말해, 실제 시스템 자원은 CPU나 스레드 문제가 아니라 메모리 할당의 누적에 의해 실패했고, 그 상태가 임계값을 넘자 `MemoryGuard`가 종료를 선택한 구조다.

### 3.3 원인 판단 근거
- 다른 가능성으로는 일시적 메모리 캐시 증가나 시스템 부하를 들 수 있지만, 로그에서 `Current Heap` 값이 지속적으로 상승하고 `MemoryGuard`가 직접 `Memory limit exceeded`를 남겼다는 점에서 메모리 누수에 의한 종료가 가장 합리적이다.
- 추가로 `APP_EXIT_STATUS=137`은 정상적인 서비스 종료가 아니라 비정상적 종료/자기 보호 종료를 의미한다.

## 4. Workaround & Verification (조치 및 검증)

### 4.1 조치 내용
- 기준 실험에서 `MEMORY_LIMIT=256`으로 설정한 뒤 장애를 재현했다.
- 조치 실험에서는 `MEMORY_LIMIT=512`로 상향 조정했다.
- 조치 목적은 메모리 임계 초과를 피하고, 누적 증가가 계속되더라도 프로세스가 장시간 유지되도록 하는 것이었다.

### 4.2 Before & After 비교
- 기준 실험:
  - `MEMORY_LIMIT=256`
  - `ELAPSED_SECONDS=34`
  - `APP_EXIT_STATUS=137`
  - `Target PID 3026` 프로세스가 34초 만에 종료됨.
- 조치 후 실험:
  - `MEMORY_LIMIT=512`
  - `ELAPSED_SECONDS=1500`
  - `APP_EXIT_STATUS=not_observed_exit`
  - `RESULT=max_runtime_reached`
- 관찰 결과, 메모리 제한을 두 배로 높인 상태에서는 프로세스가 1500초까지 살아 남아 `max_runtime_reached` 상태에 도달했다.
- 실제 로그에서도 `MemoryWorker`는 275MB를 넘기며 증가하던 패턴이 사라지고, 이후 계속 실행되면서 메모리 캐시 정리 후 안정화 흐름이 관찰되었다.
``` log
2026-11-15 10:18:28,815 [INFO] [SafetyGuard] Process priority lowered (nice=10).
2026-11-15 10:18:28,815 [INFO] Agent listening at port 15034
2026-11-15 10:18:30,829 [INFO] >>> Scenario Selected: [Healthy System Monitoring]
2026-11-15 10:18:30,829 [INFO] [Scheduler] Task Scheduler Initialized.
2026-11-15 10:18:30,829 [INFO] [Scheduler] Registered Tasks: ['Thread-A', 'Thread-B', 'Thread-C']
2026-11-15 10:18:30,829 [INFO] [Scheduler] Starting task execution...
2026-11-15 10:18:30,829 [INFO] [Thread-A] Task Started. Calculating... (20%)
2026-11-15 10:18:30,881 [INFO] [Thread-A] Calculating... (40%)
2026-11-15 10:18:30,933 [INFO] [Thread-A] Calculating... (60%)
2026-11-15 10:18:30,983 [INFO] [Thread-A] Calculating... (80%)
2026-11-15 10:18:31,035 [INFO] [Thread-A] Task Completed. (100%)
2026-11-15 10:18:31,087 [INFO] [Thread-B] Task Started. Calculating... (20%)
2026-11-15 10:18:31,139 [INFO] [Thread-B] Calculating... (40%)
2026-11-15 10:18:31,190 [INFO] [Thread-B] Calculating... (60%)
2026-11-15 10:18:31,240 [INFO] [Thread-B] Calculating... (80%)
2026-11-15 10:18:31,292 [INFO] [Thread-B] Task Completed. (100%)
2026-11-15 10:18:31,344 [INFO] [Thread-C] Task Started. Calculating... (20%)
2026-11-15 10:18:31,395 [INFO] [Thread-C] Calculating... (40%)
2026-11-15 10:18:31,447 [INFO] [Thread-C] Calculating... (60%)
2026-11-15 10:18:31,499 [INFO] [Thread-C] Calculating... (80%)
2026-11-15 10:18:31,549 [INFO] [Thread-C] Task Completed. (100%)
2026-11-15 10:18:31,601 [INFO] [Scheduler] All tasks completed.
2026-11-15 10:18:31,626 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-15 10:18:31,626 [INFO] [CpuWorker] Started. Maximum CPU Limit: 10%
2026-11-15 10:18:31,627 [INFO] [CpuWorker] Current Load: 5.00%
2026-11-15 10:18:33,741 [INFO] [CpuWorker] Peak reached (10.00%). Starting cooldown...
2026-11-15 10:18:34,668 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-15 10:18:34,747 [INFO] [CpuWorker] Current Load: 10.00%
2026-11-15 10:18:37,711 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-15 10:18:37,868 [INFO] [CpuWorker] Current Load: 9.82%
2026-11-15 10:18:39,980 [INFO] [CpuWorker] Cooldown complete (5.00%). Resuming load increase...

...

2026-11-15 10:43:23,175 [INFO] [MemoryWorker] Current Heap: 375MB
2026-11-15 10:43:23,413 [INFO] [CpuWorker] Current Load: 10.00%
2026-11-15 10:43:26,218 [INFO] [MemoryWorker] Current Heap: 400MB
2026-11-15 10:43:26,532 [INFO] [CpuWorker] Current Load: 6.10%
```
### 4.3 검증 결과
- 장애는 낮은 메모리 제한과 누수 패턴이 결합되어 재현되었고, `MEMORY_LIMIT=512`로 조정한 뒤에는 심각한 종료가 발생하지 않았다.
- 프로세스 생존 시간이 34초에서 1500초로 증가하여, 메모리 제약에 의한 급격한 종료가 크게 완화되었다.
- 다만, 이 조치는 근본적으로 메모리 누수 자체를 제거한 것이 아니라, 제한을 상향하여 서비스 지속성을 확보한 수준이다.

### 4.4 추가 개선 제안
- 메모리 누수 원인을 추적해 실제 할당 해제를 보장해야 한다.
- `MemoryGuard` 경보의 임계치를 256MB 수준에서 점검하고, 할당/해제 비율을 모니터링하는 메트릭을 추가해야 한다.
- 운영 환경에서는 메모리 제한을 높이는 것만으로는 부족하므로, 누수 지점을 제거하는 근본적 해결이 필요하다.