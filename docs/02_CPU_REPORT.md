# [Bug] CPU Latency - CPU 부하 임계치 초과에 따른 프로세스 종료

## 0. Concept Overview (핵심 개념)

### 0.1 CPU Spike (CPU 과부하)

CPU Spike란 특정 프로세스 또는 시스템의 CPU 사용률이 짧은 시간 동안 급격하게 상승하는 현상을 의미한다.

프로세스가 CPU 자원을 과도하게 점유하면 다른 프로세스가 CPU를 할당받기 어려워질 수 있다. 이로 인해 작업 처리 시간이 길어지고, 애플리케이션 응답 지연이나 시스템 전체의 성능 저하가 발생할 수 있다.

특히 웹 서버처럼 여러 요청을 동시에 처리하는 환경에서는 특정 작업이 CPU를 독점할 경우 다른 요청의 처리까지 지연될 수 있다.

일반적으로 CPU 과부하를 분석할 때는 다음 지표를 확인한다.

| 지표 | 의미 |
|---|---|
| Process CPU | 특정 프로세스가 사용한 CPU 비율 |
| Host CPU | 시스템 전체의 CPU 사용 상태 |
| Load Average | 일정 시간 동안의 시스템 부하 평균 |
| CPU Latency | CPU 자원 부족 등으로 작업 처리가 지연되는 현상 |

### 0.2 CPU 사용률과 애플리케이션 내부 부하 지표의 차이

CPU 장애를 분석할 때는 운영체제가 측정하는 CPU 사용률과 애플리케이션이 자체적으로 계산하는 부하 지표를 구분해야 한다.

이번 실험에서 사용한 `CpuWorker Current Load`는 애플리케이션 내부에서 기록하는 지표이며, 운영체제가 측정한 실제 CPU 사용률과 동일한 값이 아니다.

- `APP_CURRENT_LOAD`: 애플리케이션 내부 `CpuWorker`의 부하 지표
- `PROCESS_CPU`: `/proc/[PID]/stat`의 CPU 시간 변화를 이용해 계산한 프로세스 CPU 사용률
- `PS_CPU`: `ps` 명령어가 표시하는 프로세스 CPU 사용률
- `HOST_LOAD_AVERAGE`: 시스템 전체의 Load Average

따라서 애플리케이션 내부 부하가 증가했다는 사실만으로 실제 CPU 자원 고갈이나 응답 지연이 발생했다고 단정할 수는 없다. 서로 다른 지표를 함께 확인해야 정확한 원인 분석이 가능하다.

### 0.3 Watchdog

Watchdog은 애플리케이션이나 시스템의 상태를 감시하고, 미리 정해진 조건을 위반했을 때 경고 또는 보호 조치를 수행하는 감시 메커니즘이다.

CPU 사용량이 일정 임계치를 초과하거나 프로세스가 정상적으로 동작하지 않는 경우, Watchdog은 프로세스를 종료하거나 부하를 제한하는 방식으로 시스템을 보호할 수 있다.

이번 실험에서는 `CPU_MAX_OCCUPY` 환경변수를 조정하여 애플리케이션의 CPU 부하 제어 동작과 프로세스 생존 시간의 변화를 비교한다.

---

## 1. Description (현상 설명)

### 1.1 발생 현상

애플리케이션 실행 후 `CpuWorker`의 내부 부하 지표인 `Current Load`가 지속적으로 증가하다가 임계치 초과 로그를 남기고 프로세스가 종료되는 현상이 발생했다.

기준 실험에서는 `CPU_MAX_OCCUPY=80`으로 설정했으며, 애플리케이션 로그에서 `Current Load`가 5.00%부터 50.64%까지 증가하는 것을 확인했다.

특히 10:47:23 시점에 43.27%였던 값이 약 6초 후 50.64%에 도달했고, 직후 다음과 같은 임계치 초과 로그가 발생했다.

`CPU Threshold Violated! (50.64000000000001%).`

실행 요약 파일에서는 전체 경과 시간 37초와 `APP_EXIT_STATUS=143`이 확인되었다.

### 1.2 발생 조건

- 실행 대상: `agent-leak-app-x86`
- 실행 환경: Linux
- 메모리 제한: `MEMORY_LIMIT=512`
- CPU 제한: `CPU_MAX_OCCUPY=80`
- 멀티스레드: `MULTI_THREAD_ENABLE=false`
- 장애 발생 조건: `CpuWorker`의 내부 부하 지표가 애플리케이션의 임계치를 초과하는 경우

이번 실험에서는 메모리 제한과 멀티스레드 설정을 고정하고 `CPU_MAX_OCCUPY` 값에 따른 CPU 부하 제어 동작의 차이를 확인했다.

## 2. Evidence & Logs (증거 자료)

### 2.1 실험 환경 및 재현 방법

실험은 `scripts/run_case.sh`를 통해 수행했다. 해당 스크립트는 실행 프로파일에 따라 환경변수를 설정하고, 애플리케이션 실행과 함께 `monitor.sh`, `cpu_spike.sh`를 이용한 증거 수집을 진행한다.

기준 실험과 조치 실험은 다음 명령어로 실행했다.

```bash
# 기준 실험: CPU_MAX_OCCUPY=80%
bash scripts/run_case.sh cpu baseline

# 조치 실험: CPU_MAX_OCCUPY=10%
bash scripts/run_case.sh cpu adjusted
```

CPU 전용 수집기인 `cpu_spike.sh`는 다음 정보를 수집한다.

- 프로세스 CPU 사용률: `/proc/[PID]/stat`의 CPU 시간 변화량으로 계산
- 프로세스 상태: `ps` 명령어를 통한 CPU, RSS, 상태 확인
- 시스템 부하: `/proc/loadavg`의 Load Average
- 애플리케이션 내부 부하: `CpuWorker Current Load`
- Watchdog 및 종료 관련 로그
- Cooldown 및 부하 회복 관련 로그

수집된 자료는 다음과 같다.

- `config.env`: 실험 환경변수 및 설정값
- `run-summary.txt`: 실행 시간, PID, 종료 상태 및 실험 결과
- `cpu-process.log`: CPU 및 프로세스 상태 진단 자료
- `cpu-process.csv`: 시간별 CPU 측정 데이터
- `agent_app.log`: 애플리케이션 실행 로그

### 2.2 시스템 관제 데이터

`cpu-process.log`에서 수집한 기준 실험의 초기 스냅샷은 다음과 같다.

```log
========== CPU SPIKE SNAPSHOT 2026-11-15 10:46:57 ==========
EXPERIMENT_CPU_MAX_OCCUPY=80%
PID=28054 PROCESS_STATUS=RUNNING
PROCESS_CPU=0.99% SAMPLE_ELAPSED=1.01s
PS_CPU_AVG=1.8% PS_RSS=18580KB PROCESS_STATE=SN+
APP_CURRENT_LOAD=5.00 (application-internal metric; not OS CPU%)
HOST_LOAD_AVERAGE_1M_5M_15M=0.00,0.00,0.00
WATCHDOG_EVIDENCE_DETECTED=false

--- Process snapshot (ps) ---
PID    PPID %CPU   RSS    VSZ STAT NI ELAPSED CMD
28054  28046 1.8 18580 28688 SN+  10 00:02 /home/innuendo3712/agent-app/bin/agent-leak-app-x86

--- Host top snapshot ---
%Cpu(s): 0.6 us, 0.0 sy, 0.0 ni, 99.4 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
```

초기 스냅샷에서는 프로세스 CPU 사용률이 `0.99%`, `ps` 기준 CPU 사용률이 `1.8%`로 관측되었다. 애플리케이션 내부 부하 지표는 `5.00%`였다.

이 자료는 실험 초반의 상태를 보여주므로, 장애 직전의 실제 CPU 사용률을 판단하는 근거로 사용할 수는 없다.

한편 애플리케이션 로그에서는 장애 직전 내부 부하 지표가 50.64%까지 증가한 사실이 확인되었다.

### 2.3 애플리케이션 로그

다음은 기준 실험의 `agent_app.log`에서 발췌한 핵심 로그다.

```log
[2026-11-15 10:46:56,611] [INFO] [SafetyGuard] Process priority lowered (nice=10).
[2026-11-15 10:46:56,611] [INFO] Agent listening at port 15034

[2026-11-15 10:46:58,623] [INFO] [CpuWorker] Started. Maximum CPU Limit: 80%
[2026-11-15 10:46:58,623] [INFO] [CpuWorker] Current Load: 5.00%
[2026-11-15 10:47:01,745] [INFO] [CpuWorker] Current Load: 13.07%
[2026-11-15 10:47:04,863] [INFO] [CpuWorker] Current Load: 21.77%
[2026-11-15 10:47:07,982] [INFO] [CpuWorker] Current Load: 22.33%
[2026-11-15 10:47:11,102] [INFO] [CpuWorker] Current Load: 27.44%
[2026-11-15 10:47:14,224] [INFO] [CpuWorker] Current Load: 35.61%
[2026-11-15 10:47:17,344] [INFO] [CpuWorker] Current Load: 36.67%
[2026-11-15 10:47:20,466] [INFO] [CpuWorker] Current Load: 41.09%
[2026-11-15 10:47:23,585] [INFO] [CpuWorker] Current Load: 43.27%
[2026-11-15 10:47:26,706] [INFO] [CpuWorker] Current Load: 45.04%
[2026-11-15 10:47:29,827] [INFO] [CpuWorker] Current Load: 50.64%

[2026-11-15 10:47:29,929] [CRITICAL] [CpuWorker] CPU Threshold Violated! (50.64000000000001%).
```

로그를 통해 `Current Load`가 실행 시간에 따라 증가했으며, 50.64%에 도달한 직후 임계치 초과 로그가 발생했음을 확인할 수 있다.

다만 `Maximum CPU Limit: 80%`와 실제 임계치 초과 시점인 50.64% 사이의 관계는 제공된 로그만으로 명확하게 확인되지 않는다. 따라서 80%가 실제 종료 임계치인지, 별도의 내부 임계값이 존재하는지 추가 확인이 필요하다.

### 2.4 프로세스 진단 결과

기준 실험의 `run-summary.txt`와 `cpu-process.log`에서 확인한 주요 결과는 다음과 같다.

| 항목 | 측정 결과 |
|---|---|
| CASE_NAME | cpu |
| PROFILE | baseline |
| TARGET_PID | 28054 |
| CPU_MAX_OCCUPY | 80% |
| 초기 PROCESS_CPU | 0.99% |
| 초기 PS_CPU | 1.8% |
| 초기 APP_CURRENT_LOAD | 5.00% |
| ELAPSED_SECONDS | 37 |
| APP_EXIT_STATUS | 143 |

`APP_EXIT_STATUS=143`은 일반적으로 `SIGTERM(15)`에 의해 프로세스가 종료되었을 때 나타나는 종료 코드다.

이는 프로세스가 SIGTERM을 받아 종료되었을 가능성을 뒷받침하지만, 종료 코드만으로 Watchdog이 직접 종료를 실행했다고 확정할 수는 없다.

애플리케이션 로그에서는 `CPU Threshold Violated!`가 확인되므로 CPU 임계치 초과가 종료 직전 발생한 사실은 확인할 수 있다. 다만 실제 종료 주체와 Watchdog의 동작 여부를 확정하려면 종료 관련 로그를 추가로 확인해야 한다.

## 3. Root Cause Analysis (원인 분석)

### 3.1 증거 분석

수집한 증거를 종합하면 다음과 같다.

- 애플리케이션 내부 `Current Load`가 5.00%에서 50.64%까지 지속적으로 증가했다.
- 50.64%에 도달한 직후 `CPU Threshold Violated!` 로그가 발생했다.
- 실행 요약 파일에서 37초의 경과 시간과 종료 코드 143이 확인되었다.
- 실험 초반 OS 기준 프로세스 CPU 사용률은 0.99%, `ps` 기준 1.8%로 관측되었다.

이 중 가장 직접적인 증거는 `Current Load`의 증가와 `CPU Threshold Violated!` 로그다.

다만 초기 OS CPU 스냅샷은 장애 발생 시점의 측정값이 아니므로, 실제 CPU 과점유 여부를 판단하려면 장애 직전의 `PROCESS_CPU`, `ps`, `top` 데이터를 추가로 확인해야 한다.

### 3.2 기술적 원인

이번 장애에서는 애플리케이션 내부 `CpuWorker`가 부하 지표를 지속적으로 증가시키다가, 특정 임계치를 초과한 시점에 오류 로그를 발생시켰다.

기준 실험에서 설정한 `CPU_MAX_OCCUPY`는 80%였지만, `Current Load`가 50.64%인 시점에 `CPU Threshold Violated!`가 기록되었다.

이는 로그에 표시된 `Maximum CPU Limit`과 실제 임계치 초과 판정에 사용된 기준 사이에 차이가 존재할 가능성을 보여준다.

다만 현재 자료만으로는 다음 중 어느 경우인지 확정할 수 없다.

- `CPU_MAX_OCCUPY`와 별도로 애플리케이션 내부에 고정된 임계치가 존재하는 경우
- `Current Load`가 실제 CPU 사용률과 다른 방식으로 계산되는 경우
- 내부 부하 증가 로직이 설정값과 다른 조건으로 종료를 판단하는 경우

따라서 이번 장애의 직접적인 원인은 `CpuWorker`의 내부 부하 임계치 초과로 판단할 수 있지만, 설정값과 내부 판정 로직의 불일치가 발생한 정확한 구현 원인까지 규명한 것은 아니다.

### 3.3 최종 원인 판단

이번 장애는 애플리케이션 내부 CPU 부하 지표가 지속적으로 증가하다가 임계치를 초과하면서 발생한 프로세스 종료 사례다.

`CPU Threshold Violated!` 로그와 종료 코드 143은 해당 현상을 뒷받침한다.

다만 실제 OS CPU 과점유가 발생했는지, Watchdog이 종료를 실행했는지, `CPU_MAX_OCCUPY=80`과 내부 임계치가 어떤 관계인지에 대해서는 추가적인 종료 시점 관제 데이터와 로그가 필요하다.

따라서 현재 단계에서는 **애플리케이션 내부 부하 임계치 초과에 따른 종료**를 확인된 원인으로 기록하고, 실제 CPU 자원 고갈 및 Watchdog 동작 여부는 추가 검증 항목으로 구분한다.

## 4. Workaround & Verification (조치 및 검증)

### 4.1 조치 내용

기준 실험에서는 `CPU_MAX_OCCUPY=80`으로 설정하여 부하 증가에 따른 종료 현상을 재현했다.

조치 실험에서는 해당 값을 `CPU_MAX_OCCUPY=10`으로 낮추어 동일한 애플리케이션의 부하 제어 동작을 비교했다.

이번 조치는 CPU 부하 제어의 상한을 낮춰 내부 부하 증가를 제한하고, 임계치 초과에 따른 조기 종료를 완화하기 위한 임시 대응이다.

### 4.2 Before & After 비교

| 비교 항목 | Before | After |
|---|---:|---:|
| CPU_MAX_OCCUPY | 80% | 10% |
| ELAPSED_SECONDS | 37초 | 902초 |
| APP_EXIT_STATUS | 143 | 미관측 |
| RESULT | application_exited | max_runtime_reached |
| 실행 결과 | 임계치 초과 후 종료 | 최대 관측 시간까지 생존 |

기준 실험에서는 `Current Load`가 50.64%까지 증가한 뒤 임계치 초과 로그가 발생했고, 약 37초 만에 프로세스가 종료되었다.

반면 조치 실험에서는 `CPU_MAX_OCCUPY=10`으로 설정한 상태에서 프로세스가 902초 동안 실행되었으며, 최대 실행 시간에 도달했다.

조치 실험에서 확인된 애플리케이션 로그는 다음과 같다.

```log
[INFO] [CpuWorker] Started. Maximum CPU Limit: 10%
[INFO] [CpuWorker] Current Load: 5.00%

...

[INFO] [CpuWorker] Peak reached (10.00%). Starting cooldown...
[INFO] [CpuWorker] Current Load: 10.00%
[INFO] [CpuWorker] Cooldown complete (5.00%). Resuming load increase...
```

위 로그는 내부 부하가 10%에 도달했을 때 Cooldown 동작이 시작되고, 부하가 5%로 감소한 뒤 다시 증가하는 제어 사이클이 수행되었음을 보여준다.

### 4.3 검증 결과

`CPU_MAX_OCCUPY`를 80%에서 10%로 낮춘 결과, 프로세스 생존 시간이 37초에서 902초로 증가했다.

조치 실험에서는 `Peak reached (10.00%). Starting cooldown...`과 `Cooldown complete (5.00%). Resuming load increase...` 로그가 확인되어 내부 부하가 일정 범위에서 제어되는 동작을 관찰할 수 있었다.

따라서 환경변수 조정이 애플리케이션 내부 부하 제어에 영향을 주고, 프로세스의 조기 종료를 완화하는 효과가 있음을 확인했다.

다만 이 결과만으로 실제 OS CPU 사용률이 안정화되었다거나 서비스 응답 지연이 해결되었다고 단정할 수는 없다. 이를 확인하려면 조치 전후의 프로세스 CPU 사용률과 실제 요청 처리 시간 등을 추가로 비교해야 한다.

### 4.4 추가 개선 제안

- **CPU 측정 기준 명확화:** 애플리케이션 내부 `Current Load`와 OS 기준 `PROCESS_CPU`를 별도로 관리하고, 각 지표의 계산 방식을 명확하게 정의한다.
- **임계치 정책 통일:** `CPU_MAX_OCCUPY`와 실제 임계치 초과 판정에 사용되는 기준이 일치하는지 확인한다.
- **부하 제어 로직 개선:** CPU 부하가 일정 수준에 도달하면 작업량을 조절하거나 Cooldown을 적용하여 급격한 증가를 방지한다.
- **Watchdog 동작 검증:** 임계치 초과 시 실제로 Watchdog이 종료를 실행하는지, 종료 신호와 관련 로그를 통해 확인한다.
- **실제 응답 지연 측정:** 요청 처리 시간, 응답 지연 시간, 처리량 등의 지표를 추가하여 CPU 부하가 서비스 성능에 미치는 영향을 검증한다.

## 5. Conclusion (최종 결론)

이번 실험에서는 `CPU_MAX_OCCUPY=80` 환경에서 애플리케이션 내부 `Current Load`가 지속적으로 증가하고, 50.64%에 도달한 시점에 `CPU Threshold Violated!` 로그와 프로세스 종료가 발생하는 현상을 확인했다.

이후 `CPU_MAX_OCCUPY=10`으로 조정한 결과, 내부 부하가 10%에 도달했을 때 Cooldown 동작이 수행되었으며 프로세스 생존 시간이 37초에서 902초로 증가했다.

이를 통해 CPU 부하 제한값을 낮추는 조치가 애플리케이션 내부 부하 제어와 프로세스 생존 시간에 영향을 준다는 점을 확인했다.

다만 실제 OS CPU 과점유와 서비스 응답 지연 여부, Watchdog의 종료 개입 여부는 추가 증거가 필요하다.

**이번 장애의 핵심은 애플리케이션 내부 부하 지표의 임계치 초과가 확인되었으며, 부하 제한값 조정을 통해 프로세스의 조기 종료를 완화할 수 있었다는 점이다.**