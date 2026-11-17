# [Bug] CPU Latency

## 1. Description (현상 설명)

### 1.1 발생 현상
- 애플리케이션은 CPU 사용률이 비정상적으로 상승하는 CPU Latency 장애를 겪었다.
- 기준 실험에서는 애플리케이션이 `Current Load`를 단계적으로 증가시키다가 `50.64%`를 넘어서 `CPU Threshold Violated!` 로그를 남긴 뒤 종료되었다.
- 장애 발생까지 걸린 시간은 약 37초였고, 최종적으로 `APP_EXIT_STATUS=143`으로 종료되었다.

### 1.2 발생 조건
- 실행 환경: `MEMORY_LIMIT=512MB`, `CPU_MAX_OCCUPY=80`, `MULTI_THREAD_ENABLE=false`.
- 주요 환경변수 설정: CPU 상한은 80%였지만, 애플리케이션 내부 로직은 이보다 낮은 임계값을 넘어서고 있었다.
- 장애 재현 시점: `agent_app.log`에 `CpuWorker`가 `Current Load`를 5%, 13%, 21%, 27%, 35%, 41%, 45%, 50.64%까지 상승시키다가 장애를 발생시켰다.

## 2. Evidence & Logs (증거 자료)

### 2.1 시스템 관제 데이터
- `docs/cpu-before/cpu-process.log`의 스냅샷은 CPU 사용률이 점진적으로 증가하는 과정을 보여준다.
- 로그 중 일부:
  - `2026-11-15 10:46:58,623 [INFO] [CpuWorker] Started. Maximum CPU Limit: 80%`
  - `2026-11-15 10:47:01,745 [INFO] [CpuWorker] Current Load: 13.07%`
  - `2026-11-15 10:47:04,863 [INFO] [CpuWorker] Current Load: 21.77%`
  - `2026-11-15 10:47:11,102 [INFO] [CpuWorker] Current Load: 27.44%`
  - `2026-11-15 10:47:17,344 [INFO] [CpuWorker] Current Load: 36.67%`
  - `2026-11-15 10:47:23,585 [INFO] [CpuWorker] Current Load: 43.27%`
  - `2026-11-15 10:47:26,706 [INFO] [CpuWorker] Current Load: 45.04%`
  - `2026-11-15 10:47:29,827 [INFO] [CpuWorker] Current Load: 50.64%`
- `cpu-process.log`의 일부 스냅샷은 `WATCHDOG_EVIDENCE_DETECTED=false` 상태였지만, 해당 순간 애플리케이션은 이미 내부 로직 상 한계를 넘었다.

### 2.2 애플리케이션 로그
- `docs/cpu-before/agent_app.log`의 최종 로그는 다음과 같다.
  - `2026-11-15 10:47:29,827 [INFO] [CpuWorker] Current Load: 50.64%`
  - `2026-11-15 10:47:29,929 [CRITICAL] [CpuWorker] CPU Threshold Violated! (50.64000000000001%).`
- 이 로그는 애플리케이션이 자체적으로 한도를 넘었다는 판단을 남긴 것이다.
- `run-summary.txt`에 따르면 `ELAPSED_SECONDS=37`, `APP_EXIT_STATUS=143`이었다.

### 2.3 프로세스 진단 결과
- `docs/cpu-before/cpu-process.log`에서 `PID=28054`, `PROCESS_STATUS=RUNNING`, `process_cpu_pct=0.99%`, `ps_cpu_avg_pct=1.8%`로 관측되었다.
- 즉, 호스트의 OS 레벨 CPU 사용률은 낮았지만, 애플리케이션이 자체적으로 계산한 `APP_CURRENT_LOAD`는 50.64%에 도달했다.
- 이는 CPU 병목이 애플리케이션 내부의 잘못된 로드 증가 로직에서 발생했음을 의미한다.

## 3. Root Cause Analysis (원인 분석)

### 3.1 증거 분석
- CPU 사용률은 점진적으로 증가하다가 `50.64%`에서 급격히 예외를 발생시켰다.
- 애플리케이션 내부 메트릭은 `Current Load`가 점점 커지며, 한계치를 넘어서자 `CRITICAL` 로그를 남겼다.
- 실제 호스트 CPU는 낮았으나, 이 상황은 애플리케이션 알고리즘의 잘못된 부하 증가와 운영 정책의 비정합이 원인임을 보여준다.

### 3.2 기술적 원인
- 애플리케이션은 `CpuWorker`를 통해 내부 부하를 증가시켰고, 이를 `Current Load` 값을 기반으로 계속 증가시켰다.
- 설정상 `CPU_MAX_OCCUPY=80`였지만, 내부 한계 판단에 따라 애플리케이션이 50.64%를 기준으로 `Threshold Violated`를 중단했다.
- 즉, 실제 OS CPU를 과도하게 점유한 것이 아니라, 애플리케이션이 과도한 내부 계산 부하를 유발하면서 서비스 장애를 만들었다.

### 3.3 원인 판단 근거
- `top` 및 `ps` 결과는 호스트 CPU가 낮은 상태였다는 점을 보여주고, `APP_CURRENT_LOAD` 값이 급증한 점이 핵심 증거다.
- 따라서 CPU 지연은 운영체제 자원 부족이 아니라 애플리케이션의 로직적 부하 과다와 임계값 정책 불일치로 판단하는 것이 적절하다.
- 이와 같이 `CPU Threshold Violated!` 로그가 직접 남겨졌다는 점은 판정 근거로 충분하다.

## 4. Workaround & Verification (조치 및 검증)

### 4.1 조치 내용
- 기준 실험은 `CPU_MAX_OCCUPY=80` 상태에서 장애 재현.
- 조치 실험은 `CPU_MAX_OCCUPY=10`으로 낮춘 상태에서 동일한 모니터링을 수행.
- 조치 목적은 CPU 부하를 낮게 유지하면서, 내부 부하가 갑자기 증가하더라도 워치독/종료 조건을 피하도록 하는 것이었다.

### 4.2 Before & After 비교
- 기준 실험:
  - `CPU_MAX_OCCUPY=80`
  - `ELAPSED_SECONDS=37`
  - `APP_EXIT_STATUS=143`
  - `Current Load`가 50.64%까지 급증하며 종료 발생.
- 조치 후 실험:
  - `CPU_MAX_OCCUPY=10`
  - `ELAPSED_SECONDS=902`
  - `APP_EXIT_STATUS=not_observed_exit`
  - `RESULT=max_runtime_reached`
- `agent_app.log` 기준으로, 조치 후에는 `Current Load`가 5~10% 수준에서 반복되고 `Peak reached (10.00%). Starting cooldown...`, `Cooldown complete (5.00%). Resuming load increase...`와 같은 정상적 사이클을 보였다.

### 4.3 검증 결과
- 조치 후 애플리케이션은 심각한 종료 없이 장시간 계속 실행되었다.
- 프로세스 생존 시간이 37초에서 902초로 크게 증가했다.
- CPU 부하가 낮아지자, `Peak reached (10.00%)` 이후 `Cooldown` 구간을 반복하면서 안정적으로 동작하였다.
- 다만, 본 조치는 내부 로직 자체를 수정한 것이 아니며, 사용자 정의 제한 값을 낮춰서 특성을 완화한 수준이다.

### 4.4 추가 개선 제안
- CPU 임계값 정책을 재검토해 내부 계산 부하와 실제 OS 자원 사용량을 분리해야 한다.
- `Current Load`를 단순 수치로 사용하지 않고, 실제 사용률/대기시간/스레드 수를 함께 모니터링해야 한다.
- 장기적으로는 CPU 무한 증가 루프를 제거하고, 부하 점진적 증가 로직을 제한하는 코드 수정이 필요하다.

---
CPU 리포트 필수 증거 최소 요건
CPU 사용률 급상승 구간(top/ps/관제) 캡처
종료 로그("WATCHDOG… SIGTERM" 등)
CPU_MAX_OCCUPY 변경 전후 비교
