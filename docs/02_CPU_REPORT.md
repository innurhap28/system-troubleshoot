# [Bug] CPU Latency

## 1. Description (현상 설명)

### 1.1 발생 현상
- 애플리케이션은 CPU 사용률이 비정상적으로 상승하는 CPU Latency 장애를 겪었다.
- 기준 실험에서는 애플리케이션이 `Current Load`를 단계적으로 증가시키다가 `50.64%`를 넘어서 `CPU Threshold Violated!` 로그를 남긴 뒤 종료되었다.
- 특히 10:47:23에서 43.27%였던 값이 6초도 채 지나지 않아 50.64%에 도달했고, 그 직후 `CRITICAL` 로그가 발생했다.
- 장애 발생까지 걸린 시간은 약 37초였고, 최종적으로 `APP_EXIT_STATUS=143`으로 종료되었다.

### 1.2 발생 조건
- 실행 환경: `MEMORY_LIMIT=512MB`, `CPU_MAX_OCCUPY=80`, `MULTI_THREAD_ENABLE=false`.
- 주요 환경변수 설정: CPU 상한은 80%였지만, 애플리케이션 내부 로직은 이보다 낮은 임계값을 넘어서고 있었다.
- 장애 재현 시점: `agent_app.log`에 `CpuWorker`가 `Current Load`를 5%, 13%, 21%, 27%, 35%, 41%, 45%, 50.64%까지 상승시키다가 장애를 발생시켰다.
- 즉, 설정값과 내부 로직이 서로 다른 기준을 사용하면서, 애플리케이션이 자신이 정한 한계치를 넘어 파급 장애를 일으킨 상태였다.

## 2. Evidence & Logs (증거 자료)

### 2.0 수집/파싱 명령어
- 실제 재현은 루트의 `scripts/run_case.sh`로 수행했고, CPU 증거는 `scripts/cpu_spike.sh`가 내부 부하와 OS 수준 CPU를 같이 기록했다.
- 아래 명령어들로 실행 및 파싱을 수행했다.

```bash
# 1) 기준/조치 실험 실행
bash scripts/run_case.sh cpu baseline
bash scripts/run_case.sh cpu adjusted

# 2) CPU 전용 증거 수집기 실행
CPU_MAX_OCCUPY="$CPU_MAX_OCCUPY" bash scripts/cpu_spike.sh "$TARGET_PID" "$APP_LOG" "$CPU_LOG"

# 3) CPU/프로세스 파싱
ps -o pid,ppid,pcpu,rss,vsz,stat,nice,etime,cmd -p "$APP_PID"
top -b -n 1 -p "$APP_PID" | sed -n '1,20p'
cat /proc/loadavg

grep -E 'CpuWorker.*Current Load|Current Load' "$APP_LOG" | tail -n 20
grep -Ei 'WATCHDOG|EMERGENCY ABORT|SIGTERM|CPU Threshold Violated' "$APP_LOG" | tail -n 20

# 4) 요약 파일 비교
cat docs/cpu-before/run-summary.txt
cat docs/cpu-after/run-summary.txt
```

- 이 과정을 통해 `cpu-process.log`, `cpu-process.csv`, `agent_app.log`, `run-summary.txt`, `config.env`를 기준/조치 비교해 내부 `Current Load` 급상승 지점과 실제 호스트 CPU 상태를 분리해서 확인했다.

### 2.1 시스템 관제 데이터
- `docs/cpu-before/cpu-process.log`의 스냅샷은 CPU 사용률이 점진적으로 증가하는 과정을 보여준다.
``` log
========== CPU SPIKE SNAPSHOT 2026-11-15 10:46:57 ==========
EXPERIMENT_CPU_MAX_OCCUPY=80%
PID=28054 PROCESS_STATUS=RUNNING
PROCESS_CPU=0.99% SAMPLE_ELAPSED=1.01s
PS_CPU_AVG=1.8% PS_RSS=18580KB PROCESS_STATE=SN+
APP_CURRENT_LOAD=5.00 (application-internal metric; not OS CPU%)
HOST_LOAD_AVERAGE_1M_5M_15M=0.00,0.00,0.00
WATCHDOG_EVIDENCE_DETECTED=false
--- Process snapshot (ps) ---
    PID    PPID %CPU   RSS    VSZ STAT  NI     ELAPSED CMD
  28054   28046  1.8 18580  28688 SN+   10       00:02 /home/innuendo3712/agent-app/bin/agent-leak-app-x86
--- Host top snapshot ---
%Cpu(s):  0.6 us,  0.0 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
```
- 마지막 임계치 초과 시점에는 아래처럼 기록되었다.
``` log
2026-11-15 10:47:29,827 [INFO] [CpuWorker] Current Load: 50.64%
2026-11-15 10:47:29,929 [CRITICAL] [CpuWorker] CPU Threshold Violated! (50.64000000000001%).
--- Watchdog / termination evidence ---
2026-11-15 10:47:29,929 [CRITICAL] [CpuWorker] CPU Threshold Violated! (50.64000000000001%).
```

### 2.2 애플리케이션 로그
- `docs/cpu-before/agent_app.log`의 최종 로그는 다음과 같다.
``` log
2026-11-15 10:46:56,611 [INFO] [SafetyGuard] Process priority lowered (nice=10).
2026-11-15 10:46:56,611 [INFO] Agent listening at port 15034
2026-11-15 10:46:58,623 [INFO] [CpuWorker] Started. Maximum CPU Limit: 80%
2026-11-15 10:46:58,623 [INFO] [CpuWorker] Current Load: 5.00%
2026-11-15 10:47:01,745 [INFO] [CpuWorker] Current Load: 13.07%
2026-11-15 10:47:04,863 [INFO] [CpuWorker] Current Load: 21.77%
2026-11-15 10:47:07,982 [INFO] [CpuWorker] Current Load: 22.33%
2026-11-15 10:47:11,102 [INFO] [CpuWorker] Current Load: 27.44%
2026-11-15 10:47:14,224 [INFO] [CpuWorker] Current Load: 35.61%
2026-11-15 10:47:17,344 [INFO] [CpuWorker] Current Load: 36.67%
2026-11-15 10:47:20,466 [INFO] [CpuWorker] Current Load: 41.09%
2026-11-15 10:47:23,585 [INFO] [CpuWorker] Current Load: 43.27%
2026-11-15 10:47:26,706 [INFO] [CpuWorker] Current Load: 45.04%
2026-11-15 10:47:29,827 [INFO] [CpuWorker] Current Load: 50.64%
2026-11-15 10:47:29,929 [CRITICAL] [CpuWorker] CPU Threshold Violated! (50.64000000000001%).
```
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
- `top`/`ps` 결과는 `PID=28054`의 %CPU가 0.99% 수준으로 낮게 보였다는 점에서, 장애는 커널 수준의 CPU 폭주라기보다 애플리케이션 내부 로드 계산의 이상 케이스로 해석하는 것이 더 정확하다.

### 3.2 기술적 원인
- 애플리케이션은 `CpuWorker`를 통해 내부 부하를 증가시켰고, 이를 `Current Load` 값을 기반으로 계속 증가시켰다.
- 설정상 `CPU_MAX_OCCUPY=80`였지만, 내부 한계 판단에 따라 애플리케이션이 50.64%를 기준으로 `Threshold Violated`를 중단했다.
- 즉, 실제 OS CPU를 과도하게 점유한 것이 아니라, 애플리케이션이 과도한 내부 계산 부하를 유발하면서 서비스 장애를 만들었다.
- 결과적으로 이 장애는 자원 고갈이라기보다, 내부 부하 제어 로직이 실제 시스템 자원과 부정합을 일으킨 지점에서 발생한 미묘한 CPU Latency 문제로 볼 수 있다.

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
- 즉, 낮은 상한값을 설정함으로써 애플리케이션 내부 부하가 스파이크를 일으키더라도, 이를 즉시 종료시키지 않고 안정적인 범위 안에서 진동하도록 제어되었다.

### 4.3 검증 결과
- 조치 후 애플리케이션은 심각한 종료 없이 장시간 계속 실행되었다.
- 프로세스 생존 시간이 37초에서 902초로 크게 증가했다.
- CPU 부하가 낮아지자, `Peak reached (10.00%)` 이후 `Cooldown` 구간을 반복하면서 안정적으로 동작하였다.
- 다만, 본 조치는 내부 로직 자체를 수정한 것이 아니며, 사용자 정의 제한 값을 낮춰서 특성을 완화한 수준이다.
- 따라서 장기적으로는 내부 루프의 증가 폭 자체를 줄이는 설계 수정이 필요하며, 현재 조치는 운영 중단을 방지하는 임시 완화책으로 볼 수 있다.

### 4.4 추가 개선 제안
- CPU 임계값 정책을 재검토해 내부 계산 부하와 실제 OS 자원 사용량을 분리해야 한다.
- `Current Load`를 단순 수치로 사용하지 않고, 실제 사용률/대기시간/스레드 수를 함께 모니터링해야 한다.
- 장기적으로는 CPU 무한 증가 루프를 제거하고, 부하 점진적 증가 로직을 제한하는 코드 수정이 필요하다.

