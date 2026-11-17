# [Bug] Memory Leak

## 1. Description (현상 설명)

### 1.1 발생 현상
- 애플리케이션은 메모리 사용량이 지속적으로 증가하는 메모리 누수 형태의 장애를 겪었다.
- `agent-leak-app-x86` 프로세스는 `MEMORY_LIMIT=256MB` 환경에서 30초 내에 25MB에서 275MB로 급증했고, 이후 `MemoryGuard`가 동작하면서 프로세스를 종료했다.
- 장애 발생까지의 시간은 약 34초였으며, `APP_EXIT_STATUS=137`로 종료가 확인되었다.

### 1.2 발생 조건
- 실행 환경: `agent-app` 프로세스의 메모리 제한이 256MB로 설정된 상태에서 모니터링을 수행.
- 주요 환경변수 설정: `MEMORY_LIMIT=256`, `CPU_MAX_OCCUPY=10`, `MULTI_THREAD_ENABLE=false`.
- 장애 재현 시점: `monitor.sh`로 리소스 상태를 관찰 중, 프로세스 메모리가 256MB를 초과하며 종료 직전에 `MemoryGuard` 경고가 발생.

## 2. Evidence & Logs (증거 자료)

### 2.1 시스템 관제 데이터
- `docs/oom-before/monitor-snapshots.log` 기준으로, 프로세스 메모리는 다음과 같이 상승했다.
- 10:13:37: 18.1MB
- 10:13:40: 43.1MB
- 10:13:43: 68.1MB
- 10:13:46: 93.1MB
- 10:13:50: 143.1MB
- 10:13:56: 193.1MB
- 10:13:59: 218.1MB
- 10:14:03: 243.1MB
- 10:14:06: 268.1MB
- 10:14:08: 275MB
- 즉, 약 30초 동안 메모리가 거의 선형적으로 증가했고, 256MB 한계를 넘기 직전에 종료가 감지되었다.

### 2.2 애플리케이션 로그
- `docs/oom-before/application-stdout.log`의 핵심 로그:
  - `2026-11-15 10:13:35,879 [INFO] [SafetyGuard] Process priority lowered (nice=10).`
  - `2026-11-15 10:13:35,879 [INFO] Agent listening at port 15034`
  - `2026-11-15 10:14:05,322 [INFO] [MemoryWorker] Current Heap: 250MB`
  - `2026-11-15 10:14:08,366 [INFO] [MemoryWorker] Current Heap: 275MB`
  - `2026-11-15 10:14:08,366 [CRITICAL] [MemoryGuard] Memory limit exceeded (275MB >= 256MB) / (Recommend Over 256MB)`
  - `2026-11-15 10:14:08,367 [CRITICAL] [MemoryGuard] Self-terminating process 3026 to prevent system instability.`
- 이 로그는 메모리 누수가 단순한 경고 수준이 아니라, 한계 초과 직후 애플리케이션이 스스로 종료하는 구조임을 명확히 보여준다.

### 2.3 프로세스 진단 결과
- `run-summary.txt`에 따르면 `TARGET_PID=3026`, `ELAPSED_SECONDS=34`, `APP_EXIT_STATUS=137`로 기록되었다.
- `config.env`에서도 기준 실험에서 `MEMORY_LIMIT=256`이 확인되며, 증거 로그와 일치한다.
- 프로세스는 256MB 임계치를 넘은 직후 종료되었고, 이는 운영체제의 강제 종료라기보다 애플리케이션 내부의 `MemoryGuard`에 의한 자가 보호 종료로 해석할 수 있다.

## 3. Root Cause Analysis (원인 분석)

### 3.1 증거 분석
- 메모리 사용량은 시간이 지날수록 지속적으로 증가했다.
- 가장 큰 증거는 `Current Heap: 25MB -> 50MB -> 75MB -> ... -> 275MB`라는 로그이며, 이는 된다고 판단해도 증가가 멈추지 않음을 보여주었다.
- 종료 직전 로그 `Memory limit exceeded (275MB >= 256MB)`는 메모리 제한을 초과했다는 사실을 직접 증명한다.

### 3.2 기술적 원인
- 애플리케이션 내부의 메모리 할당 로직이 적절한 해제 경로 없이 누적되었다.
- `MEMORY_LIMIT=256MB`가 낮게 설정된 상태에서 메모리 증가 속도가 계속 이어졌고, 애플리케이션은 자체적으로 자가 보호 종료를 수행했다.
- 본 장애는 단순한 순간적 스파이크가 아니라, 보유 자원이 계속 증가하는 누수 패턴이다.

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

### 4.3 검증 결과
- 장애는 낮은 메모리 제한과 누수 패턴이 결합되어 재현되었고, `MEMORY_LIMIT=512`로 조정한 뒤에는 심각한 종료가 발생하지 않았다.
- 프로세스 생존 시간이 34초에서 1500초로 증가하여, 메모리 제약에 의한 급격한 종료가 크게 완화되었다.
- 다만, 이 조치는 근본적으로 메모리 누수 자체를 제거한 것이 아니라, 제한을 상향하여 서비스 지속성을 확보한 수준이다.

### 4.4 추가 개선 제안
- 메모리 누수 원인을 추적해 실제 할당 해제를 보장해야 한다.
- `MemoryGuard` 경보의 임계치를 256MB 수준에서 점검하고, 할당/해제 비율을 모니터링하는 메트릭을 추가해야 한다.
- 운영 환경에서는 메모리 제한을 높이는 것만으로는 부족하므로, 누수 지점을 제거하는 근본적 해결이 필요하다.

---
OOM 리포트 필수 증거 최소 요건
monitor.sh 결과(메모리 상승 수치)
종료 직전/직후 실행 로그("Memory limit exceeded…", "SELF-TERMINATED…" 등)
MEMORY_LIMIT 변경 전후 비교(최소 2회 실행)