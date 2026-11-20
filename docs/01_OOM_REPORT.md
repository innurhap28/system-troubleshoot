# [Bug] OOM Crash - 메모리 누수로 인한 MemoryGuard 프로세스 강제 종료

## 0. Concept Overview (핵심 개념)

### 0.1 메모리 누수(Memory Leak)

메모리 누수란 프로그램이 동적으로 할당한 메모리를 더 이상 사용하지 않음에도 적절히 해제하지 않거나, 참조가 유지되어 불필요한 메모리가 계속 점유되는 현상을 의미한다.

일반적으로 프로그램은 실행 중 필요한 데이터를 Heap 영역에 동적으로 할당한다. 사용이 끝난 메모리는 해제되어야 다른 작업에서 재사용할 수 있다. 그러나 메모리 해제가 제대로 이루어지지 않으면 사용량이 지속적으로 증가하고, 결국 프로세스가 사용할 수 있는 메모리 자원이 부족해진다.

메모리 누수는 다음과 같은 문제를 일으킬 수 있다.

- 프로세스의 메모리 사용량이 지속적으로 증가한다.
- 시스템의 가용 메모리가 감소하고 다른 프로세스에도 영향을 줄 수 있다.
- 메모리 할당 실패 또는 OOM(Out Of Memory) 상황이 발생할 수 있다.
- 운영 환경에서는 응답 지연, 프로세스 종료 및 서비스 장애로 이어질 수 있다.

### 0.2 OOM(Out Of Memory)

OOM은 프로세스 또는 시스템이 필요한 메모리를 확보하지 못하는 상황을 의미한다.

Linux 환경에서는 시스템 전체의 메모리 부족으로 OOM Killer가 프로세스를 종료할 수 있으며, 컨테이너나 cgroup에 설정된 메모리 제한을 초과하는 경우에도 프로세스가 종료될 수 있다.

다만 이번 실험에서는 운영체제의 OOM Killer가 아니라 애플리케이션 내부의 `MemoryGuard`가 메모리 사용량을 감시하고, 설정된 임계치를 초과하면 프로세스를 종료하는 구조를 사용한다.

따라서 이번 장애는 OS 차원의 OOM Killer 동작과 구분하여, **애플리케이션 내부 메모리 보호 정책에 의한 종료**로 분석한다.

### 0.3 Heap과 RSS의 차이

메모리 사용량을 분석할 때는 Heap과 RSS를 구분해야 한다.

| 구분 | 의미 |
|---|---|
| Heap | 애플리케이션이 동적으로 할당하여 사용하는 메모리 영역 |
| RSS (Resident Set Size) | 프로세스가 실제 물리 메모리에 상주하는 메모리 크기 |
| VSZ (Virtual Memory Size) | 프로세스가 확보한 가상 메모리 주소 공간의 크기 |
| PSS | 공유 메모리를 공유 프로세스 수에 따라 분배하여 계산한 메모리 크기 |

이번 실험에서는 애플리케이션 로그의 `Current Heap`과 시스템 관제 데이터의 RSS를 각각 확인하여 메모리 증가 추세를 분석한다.

---

## 1. Description (현상 설명)

### 1.1 발생 현상

`agent-leak-app-x86` 실행 후 메모리 사용량이 지속적으로 증가하다가, 설정된 메모리 임계치를 초과하면서 프로세스가 비정상 종료되는 현상이 발생했다.

기준 실험에서는 `MEMORY_LIMIT=256MB`로 설정했으며, 애플리케이션 로그에서 Heap 사용량이 약 31초 동안 25MB에서 275MB까지 증가하는 것을 확인했다.

특히 10:14:05 시점에 250MB였던 Heap 사용량이 약 3초 후 275MB로 증가하면서 설정된 메모리 임계치인 256MB를 초과했다. 직후 애플리케이션 내부의 `MemoryGuard`가 임계치 초과를 감지하고 프로세스 종료를 실행했다.

실행 요약 파일에서는 전체 경과 시간 34초와 `APP_EXIT_STATUS=137`이 확인되었다.

### 1.2 발생 조건

- 실행 대상: `agent-leak-app-x86`
- 실행 환경: Linux
- 메모리 제한: `MEMORY_LIMIT=256`
- CPU 제한: `CPU_MAX_OCCUPY=10`
- 멀티스레드: `MULTI_THREAD_ENABLE=false`
- 장애 발생 조건: Heap 사용량이 지속적으로 증가하여 MemoryGuard의 설정 임계치를 초과하는 경우

이번 실험에서는 CPU 사용량이나 멀티스레드 설정을 변경하지 않고 메모리 제한만 기준값으로 설정하여 OOM 재현 여부를 확인했다.

## 2. Evidence & Logs (증거 자료)

### 2.1 실험 환경 및 재현 방법

실험은 `scripts/run_case.sh`를 통해 수행했다. 해당 스크립트는 실행 프로파일에 따라 환경변수를 설정하고, 애플리케이션 실행과 함께 `monitor.sh`, `oom_test.sh`를 이용한 증거 수집을 진행한다.

기준 실험과 조치 실험은 다음 명령어로 실행했다.

```bash
# 기준 실험: MEMORY_LIMIT=256MB
bash scripts/run_case.sh oom baseline

# 조치 실험: MEMORY_LIMIT=512MB
bash scripts/run_case.sh oom adjusted
```

각 실행 결과는 다음과 같은 자료로 저장된다.

- `config.env`: 실험 환경변수 및 설정값
- `run-summary.txt`: 실행 시간, PID, 종료 상태 및 실험 결과
- `monitor-snapshots.log`: 프로세스 및 시스템 리소스 관제 데이터
- `application-stdout.log`: 애플리케이션 실행 로그
- `oom-diagnostics.log`: 프로세스 메모리 및 OOM 관련 진단 자료
- `oom-diagnostics.csv`: 시간별 메모리 사용량 측정 데이터

`oom_test.sh`는 `/proc/[PID]/status`와 `/proc/[PID]/smaps_rollup`을 이용해 RSS, VSZ, PSS 등의 메모리 정보를 수집한다.

### 2.2 시스템 관제 데이터

`monitor.sh`를 통해 수집한 데이터를 분석한 결과, 프로세스의 상주 메모리(RSS)가 실행 시간에 따라 지속적으로 증가하는 패턴을 확인했다.

다음은 기준 실험의 `monitor-snapshots.log` 일부 발췌다.

```log
[2026-11-15 10:13:37] PROCESS:agent-leak-app CPU:3.3% MEM:18.1MB
[2026-11-15 10:13:40] PROCESS:agent-leak-app CPU:1.5% MEM:43.1MB
[2026-11-15 10:13:43] PROCESS:agent-leak-app CPU:1.1% MEM:68.1MB
[2026-11-15 10:13:46] PROCESS:agent-leak-app CPU:1.0% MEM:93.1MB
[2026-11-15 10:13:50] PROCESS:agent-leak-app CPU:1.2% MEM:143.1MB
[2026-11-15 10:13:53] PROCESS:agent-leak-app CPU:1.1% MEM:168.1MB
[2026-11-15 10:13:56] PROCESS:agent-leak-app CPU:1.1% MEM:193.1MB
[2026-11-15 10:13:59] PROCESS:agent-leak-app CPU:1.0% MEM:218.1MB
[2026-11-15 10:14:03] PROCESS:agent-leak-app CPU:1.0% MEM:243.1MB
[2026-11-15 10:14:06] PROCESS:agent-leak-app CPU:1.0% MEM:268.1MB
```

관제 데이터에서 RSS가 약 18MB에서 268MB까지 증가한 것을 확인할 수 있다.

이는 일시적인 메모리 사용량 증가가 아니라, 프로세스가 실행되는 동안 메모리 점유량이 지속적으로 증가하는 패턴임을 보여준다.

### 2.3 애플리케이션 로그

다음은 기준 실험의 `application-stdout.log`에서 발췌한 핵심 로그다.

```log
[2026-11-15 10:13:35,879] [INFO] [SafetyGuard] Process priority lowered (nice=10).
[2026-11-15 10:13:35,879] [INFO] Agent listening at port 15034

[ Agent Initiate ] Resource Check
[ MEMORY ] Limit: 256MB [ WARNING: Recommend Over 256MB ]
[ CPU    ] Limit: 10%   [ OK ]
[ THREAD ] Concurrency: False [ OK ]

>>> SYSTEM STATUS: STABLE. STARTING WORKLOAD MONITORING...

[2026-11-15 10:13:37,917] [INFO] [MemoryWorker] Current Heap: 25MB
[2026-11-15 10:13:40,961] [INFO] [MemoryWorker] Current Heap: 50MB
[2026-11-15 10:13:44,005] [INFO] [MemoryWorker] Current Heap: 75MB
[2026-11-15 10:13:47,048] [INFO] [MemoryWorker] Current Heap: 100MB
[2026-11-15 10:13:50,094] [INFO] [MemoryWorker] Current Heap: 125MB
[2026-11-15 10:13:53,141] [INFO] [MemoryWorker] Current Heap: 150MB
[2026-11-15 10:13:56,186] [INFO] [MemoryWorker] Current Heap: 175MB
[2026-11-15 10:13:59,231] [INFO] [MemoryWorker] Current Heap: 200MB
[2026-11-15 10:14:02,278] [INFO] [MemoryWorker] Current Heap: 225MB
[2026-11-15 10:14:05,322] [INFO] [MemoryWorker] Current Heap: 250MB
[2026-11-15 10:14:08,366] [INFO] [MemoryWorker] Current Heap: 275MB

[2026-11-15 10:14:08,366] [CRITICAL] [MemoryGuard] Memory limit exceeded (275MB >= 256MB)
[2026-11-15 10:14:08,367] [CRITICAL] [MemoryGuard] Self-terminating process 3026 to prevent system instability.
```

로그를 통해 다음 두 가지 사실을 확인할 수 있다.

1. `MemoryWorker`의 Heap 사용량이 일정한 간격으로 증가하고 있다.
2. 설정 임계치를 초과한 직후 `MemoryGuard`가 종료를 실행했다.

따라서 이번 장애는 메모리 증가 현상과 애플리케이션의 메모리 보호 정책에 의한 종료가 연속적으로 발생한 사례다.

### 2.4 프로세스 진단 결과

기준 실험의 `run-summary.txt`와 `config.env`를 확인한 결과는 다음과 같다.

| 항목 | 측정 결과 |
|---|---|
| CASE_NAME | oom |
| PROFILE | baseline |
| TARGET_PID | 3026 |
| MEMORY_LIMIT | 256MB |
| ELAPSED_SECONDS | 34 |
| APP_EXIT_STATUS | 137 |
| RESULT | application_exited |

`APP_EXIT_STATUS=137`은 일반적으로 SIGKILL(9)에 해당하는 종료 상태다. 다만 이 값만으로 운영체제의 OOM Killer가 프로세스를 종료했다고 단정할 수는 없다.

이번 사례에서는 종료 직전 애플리케이션 로그에 `MemoryGuard`의 `Self-terminating process` 메시지가 남아 있으므로, 애플리케이션 내부 보호 정책이 종료를 실행했다는 점을 주요 근거로 판단한다.

## 3. Root Cause Analysis (원인 분석)

### 3.1 증거 분석

수집한 증거를 종합하면 다음과 같다.

- 애플리케이션 로그에서 Heap 사용량이 25MB부터 275MB까지 지속적으로 증가했다.
- 시스템 관제 데이터에서도 RSS가 약 18MB에서 268MB까지 증가했다.
- CPU 사용률은 관측 구간에서 대체로 1% 수준을 유지했다.
- Heap 사용량이 설정 임계치를 초과하자 MemoryGuard가 종료를 실행했다.

특히 Heap과 RSS라는 서로 다른 측정 지표에서 모두 메모리 증가 추세가 확인되었다는 점이 중요하다.

이는 애플리케이션 내부의 메모리 사용량 증가가 실제 프로세스의 물리 메모리 점유 증가로 이어졌음을 뒷받침한다.

### 3.2 기술적 원인

이번 장애의 근본 원인은 애플리케이션 내부의 메모리 할당이 지속적으로 누적되는 현상으로 판단된다.

일반적으로 애플리케이션은 데이터를 처리하기 위해 Heap 메모리를 할당하고, 사용이 끝난 데이터는 참조를 제거하거나 메모리를 해제하여 재사용할 수 있도록 해야 한다.

그러나 이번 실험에서는 `MemoryWorker`의 Heap 사용량이 일정한 간격으로 계속 증가했으며, 관측 구간 내에 메모리 사용량이 감소하는 패턴은 확인되지 않았다.

이러한 현상은 메모리 누수 또는 불필요한 메모리 보유가 지속되는 상황과 일치한다.

이후 Heap 사용량이 `MEMORY_LIMIT=256MB`를 초과하자 애플리케이션 내부의 `MemoryGuard`가 이를 감지하고 프로세스 종료를 실행했다.

즉, 장애 발생 과정은 다음과 같이 정리할 수 있다.

1. 애플리케이션에서 메모리 할당이 반복된다.
2. 사용이 끝난 메모리가 적절히 회수되지 않거나 불필요한 메모리 보유가 지속된다.
3. 프로세스의 Heap 및 RSS 사용량이 계속 증가한다.
4. Heap 사용량이 MemoryGuard의 설정 임계치를 초과한다.
5. MemoryGuard가 시스템 불안정 방지를 위해 프로세스 종료를 실행한다.

### 3.3 최종 원인 판단

이번 장애는 CPU 과점유나 멀티스레드 경합보다는 지속적인 메모리 사용량 증가와 메모리 보호 임계치 초과에 의해 발생한 것으로 판단한다.

다만 제공된 로그만으로 실제 메모리 할당 코드의 특정 위치나 해제 누락을 직접 확인할 수는 없다. 따라서 정확한 메모리 누수 지점까지 규명한 것은 아니며, 관측된 메모리 증가 패턴을 근거로 메모리 누수성 동작을 원인으로 판단한 것이다.

## 4. Workaround & Verification (조치 및 검증)

### 4.1 조치 내용

기준 실험에서는 `MEMORY_LIMIT=256MB`로 설정하여 장애를 재현했다.

조치 실험에서는 해당 값을 `512MB`로 상향 조정했다.

이번 조치는 메모리 할당 및 해제 로직을 수정한 근본적인 해결책이 아니라, 애플리케이션 내부 MemoryGuard의 허용 임계치를 높여 종료 시점을 늦추는 임시 조치다.

### 4.2 Before & After 비교

| 비교 항목 | Before | After |
|---|---:|---:|
| MEMORY_LIMIT | 256MB | 512MB |
| ELAPSED_SECONDS | 34초 | 1,500초 |
| APP_EXIT_STATUS | 137 | 미관측 |
| RESULT | application_exited | max_runtime_reached |
| 실행 결과 | MemoryGuard 종료 | 최대 관측 시간까지 생존 |

기준 실험에서는 약 34초 만에 프로세스가 종료되었다.

반면 조치 실험에서는 메모리 제한을 512MB로 상향한 결과, 프로세스가 1,500초 동안 실행되었으며 최대 실행 시간에 도달했다.

다음은 조치 실험에서 수집한 애플리케이션 로그 일부다.

```log
[2026-11-15 10:18:28,815] [INFO] [SafetyGuard] Process priority lowered (nice=10).
[2026-11-15 10:18:28,815] [INFO] Agent listening at port 15034

[2026-11-15 10:18:30,829] [INFO] >>> Scenario Selected: [Healthy System Monitoring]
[2026-11-15 10:18:30,829] [INFO] [Scheduler] Task Scheduler Initialized.
[2026-11-15 10:18:30,829] [INFO] [Scheduler] Registered Tasks: ['Thread-A', 'Thread-B', 'Thread-C']

[2026-11-15 10:18:31,626] [INFO] [MemoryWorker] Current Heap: 25MB
[2026-11-15 10:18:34,668] [INFO] [MemoryWorker] Current Heap: 50MB
[2026-11-15 10:18:37,711] [INFO] [MemoryWorker] Current Heap: 75MB

...

[2026-11-15 10:43:23,175] [INFO] [MemoryWorker] Current Heap: 375MB
[2026-11-15 10:43:26,218] [INFO] [MemoryWorker] Current Heap: 400MB
```

조치 실험에서도 Heap 사용량은 지속적으로 증가하여 400MB까지 도달했다.

이는 메모리 제한을 상향한 뒤에도 메모리 증가 현상 자체는 사라지지 않았다는 것을 보여준다.

### 4.3 검증 결과

메모리 제한을 256MB에서 512MB로 상향한 결과, 프로세스 생존 시간이 34초에서 1,500초로 증가했다.

따라서 MemoryGuard의 임계치 상향이 메모리 제한에 의한 조기 종료를 지연시키는 효과가 있음을 확인했다.

그러나 조치 실험에서도 Heap 사용량은 400MB까지 증가했으므로, 메모리 누수성 동작이 해결되었다고 볼 수는 없다.

이번 조치는 장애 발생 시점을 늦춘 임시 대응이며, 장기적으로는 메모리 사용량이 계속 증가하는 원인을 제거해야 한다.

### 4.4 추가 개선 제안

- **메모리 할당 및 해제 로직 점검:** 불필요한 객체 참조나 해제되지 않는 데이터가 누적되는 지점을 추적한다.
- **Heap 프로파일링:** 메모리 스냅샷을 비교하여 어떤 객체 또는 데이터 구조가 메모리를 지속적으로 점유하는지 확인한다.
- **메모리 모니터링 강화:** RSS, Heap, PSS 등의 지표를 지속적으로 수집하여 증가 추세와 회수 여부를 관찰한다.
- **MemoryGuard 임계치 관리:** 단순히 제한을 높이는 것이 아니라, 실제 서버의 물리 메모리와 다른 프로세스의 자원 사용량을 고려하여 적절한 임계치를 설정한다.

최종적으로 메모리 제한 상향은 서비스의 일시적인 생존 시간을 확보하는 수단으로 활용하고, 실제 메모리 누수 지점을 찾아 제거하는 것을 근본적인 해결 방향으로 삼아야 한다.

---

## 5. Conclusion (최종 결론)

이번 실험에서는 `MEMORY_LIMIT=256MB` 환경에서 애플리케이션의 Heap 및 RSS 사용량이 지속적으로 증가하다가, MemoryGuard의 메모리 임계치 초과 감지로 프로세스가 종료되는 현상을 재현했다.

이후 `MEMORY_LIMIT=512MB`로 조정한 결과 프로세스 생존 시간이 34초에서 1,500초로 증가했다.

이를 통해 메모리 보호 임계치 조정이 프로세스의 조기 종료를 지연시킬 수 있음을 확인했다.

다만 조치 후에도 Heap 사용량이 계속 증가했으므로, 근본적인 문제는 해결되지 않았다.

**이번 장애의 핵심은 메모리 제한 초과 자체가 아니라, 메모리 사용량이 지속적으로 증가하는 원인을 제거하지 못한 상태에서 보호 임계치에 도달했다는 점이다.**