innuendo3712@system-troubleshooting:/Users/innuendo3712/projects/system-troubleshooting-mission$ ~/agent-app/bin/run_case.sh oom baseline
장애 유형: oom / 비교 설정: baseline
실행 설정: 메모리 제한 128 MB, CPU 점유 상한 50%, 다중 스레드 false
실행 증거 저장 위치: /home/innuendo3712/agent-app/evidence/oom/20261108_222047_baseline
앱을 실행했습니다. PID=49522
실행 로그: /home/innuendo3712/agent-app/evidence/oom/20261108_222047_baseline/application.log
교착상태처럼 앱이 끝나지 않으면 Ctrl-C를 눌러 앱은 유지하고 증거 수집만 멈출 수 있습니다.
/home/innuendo3712/agent-app/bin/run_case.sh: line 108: 49522 Killed                  AGENT_HOME="$AGENT_HOME" AGENT_PORT="$AGENT_PORT" AGENT_UPLOAD_DIR="$AGENT_UPLOAD_DIR" AGENT_KEY_PATH="$AGENT_KEY_PATH" AGENT_LOG_DIR="$AGENT_LOG_DIR" MEMORY_LIMIT="$MEMORY_LIMIT" CPU_MAX_OCCUPY="$CPU_MAX_OCCUPY" MULTI_THREAD_ENABLE="$MULTI_THREAD_ENABLE" "$APP_BIN" > "$APP_LOG" 2>&1
앱이 종료되었습니다. 종료 코드=137
저장된 증거:
  앱 로그: /home/innuendo3712/agent-app/evidence/oom/20261108_222047_baseline/application.log
  프로세스/스레드 관측: /home/innuendo3712/agent-app/evidence/oom/20261108_222047_baseline/process-snapshots.log
  monitor.sh 결과: /home/innuendo3712/agent-app/evidence/oom/20261108_222047_baseline/monitor-snapshots.log
  PID 기록: /home/innuendo3712/agent-app/evidence/oom/20261108_222047_baseline/app.pid
innuendo3712@system-troubleshooting:/Users/innuendo3712/projects/system-troubleshooting-mission$ cat ~/agent-app/evidence/oom/20261108_222047_baseline/application.log
>>> Starting Agent Boot Sequence...
[1/6] Checking User Account               [OK]
   ... Running as service user 'innuendo3712' (uid=1267600711)
[2/6] Verifying Environment Variables     [OK]
   ... All required Envs correct
[3/6] Checking Required Files             [OK]
   ... Verified 'secret.key' with correct key string.
[4/6] Checking Port Availability          [OK]
   ... Port 15034 is available.
[5/6] Verifying Log Permission            [OK]
   ... Log directory is writable: /home/innuendo3712/agent-app/logs
[6/6] Verifying Mission Environment       [OK]
   ... MEMORY_LIMIT=128MB, CPU_MAX_OCCUPY=50%, MULTI_THREAD_ENABLE=False
------------------------------------------------------------
All Boot Checks Passed!
Agent READY
2026-11-08 22:20:47,800 [INFO] [SafetyGuard] Process priority lowered (nice=10).
2026-11-08 22:20:47,800 [INFO] Agent listening at port 15034

==================================================
 [ Agent Initiate ] Resource Check 
==================================================
 [ MEMORY ] Limit: 128MB                [ WARNING: Recommend Over 256MB ]
 [ CPU    ] Limit: 50%                  [ OK ]
 [ THREAD ] Concurrency: False          [ OK ]
--------------------------------------------------
 >>> SYSTEM STATUS: STABLE. STARTING WORKLOAD MONITORING...
==================================================

2026-11-08 22:20:49,840 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-08 22:20:52,885 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-08 22:20:55,934 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-08 22:20:58,978 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-08 22:21:02,026 [INFO] [MemoryWorker] Current Heap: 125MB
2026-11-08 22:21:05,072 [INFO] [MemoryWorker] Current Heap: 150MB
2026-11-08 22:21:05,072 [CRITICAL] [MemoryGuard] Memory limit exceeded (150MB >= 128MB) / (Recommend Over 256MB)
2026-11-08 22:21:05,072 [CRITICAL] [MemoryGuard] Self-terminating process 49531 to prevent system instability.
innuendo3712@system-troubleshooting:/Users/innuendo3712/projects/system-troubleshooting-mission$ cat ~/agent-app/evidence/oom/20261108_222047_baseline/monitor-snapshots.log
[2026-11-08 22:20:47] 프로세스:agent-leak-app PID:49531 부모PID:49522 CPU:25.0% 상주메모리:18.1MB 실행시간:00:00 포트:15034/열림
[2026-11-08 22:20:51] 프로세스:agent-leak-app PID:49531 부모PID:49522 CPU:2.0% 상주메모리:43.1MB 실행시간:00:03 포트:15034/열림
[2026-11-08 22:20:54] 프로세스:agent-leak-app PID:49531 부모PID:49522 CPU:1.3% 상주메모리:68.1MB 실행시간:00:06 포트:15034/열림
[2026-11-08 22:20:57] 프로세스:agent-leak-app PID:49531 부모PID:49522 CPU:1.2% 상주메모리:93.1MB 실행시간:00:09 포트:15034/열림
[2026-11-08 22:21:00] 프로세스:agent-leak-app PID:49531 부모PID:49522 CPU:1.1% 상주메모리:118.1MB 실행시간:00:13 포트:15034/열림
[2026-11-08 22:21:04] 프로세스:agent-leak-app PID:49531 부모PID:49522 CPU:1.0% 상주메모리:143.1MB 실행시간:00:16 포트:15034/열림
[2026-11-08 22:21:07] 프로세스:agent-leak-app 상태:종료 포트:15034/닫힘
innuendo3712@system-troubleshooting:/Users/innuendo3712/projects/system-troubleshooting-mission$ cat ~/agent-app/evidence/oom/20261108_222047_baseline/process-snapshots.log
===== 2026-11-08 22:20:47 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
  49522   49519 R+    0.0  0.0  1820   2904       00:00 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
  49522   49522 R+    0.0 agent-leak-app-
----- 스레드별 top -----
top - 22:20:47 up 10 days,  1:11,  0 user,  load average: 0.01, 0.01, 0.00
Threads:   1 total,   0 running,   1 sleeping,   0 stopped,   0 zombie
%Cpu(s):  4.3 us,  1.9 sy,  0.0 ni, 93.8 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15414.8 free,    711.7 used,    195.1 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15335.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
  49522 innuend+  20   0    2908   2192   1920 S   0.0   0.0   0:00.07 agent-l+

===== 2026-11-08 22:20:50 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
  49522   49519 S+    2.1  0.0  2192   2908       00:03 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
  49531   49522 SN+   2.2  0.2 44164  54280       00:03  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
  49522   49522 S+    2.1 agent-leak-app-
  49531   49531 SN+   2.2 agent-leak-app-
----- 스레드별 top -----
top - 22:20:51 up 10 days,  1:11,  0 user,  load average: 0.01, 0.01, 0.00
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15383.2 free,    742.9 used,    195.6 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15304.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
  49522 innuend+  20   0    2908   2192   1920 S   0.0   0.0   0:00.07 agent-l+
  49531 innuend+  30  10   54280  44164   9996 S   0.0   0.3   0:00.07 agent-l+

===== 2026-11-08 22:20:54 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
  49522   49519 S+    1.0  0.0  2192   2908       00:06 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
  49531   49522 SN+   1.4  0.4 69768  79884       00:06  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
  49522   49522 S+    1.0 agent-leak-app-
  49531   49531 SN+   1.4 agent-leak-app-
----- 스레드별 top -----
top - 22:20:54 up 10 days,  1:11,  0 user,  load average: 0.01, 0.01, 0.00
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15354.5 free,    771.7 used,    195.6 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15275.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
  49522 innuend+  20   0    2908   2192   1920 S   0.0   0.0   0:00.07 agent-l+
  49531 innuend+  30  10   79884  69768   9996 S   0.0   0.4   0:00.09 agent-l+

===== 2026-11-08 22:20:57 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
  49522   49519 S+    0.7  0.0  2192   2908       00:09 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
  49531   49522 SN+   1.2  0.5 95372 105488       00:09  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
  49522   49522 S+    0.7 agent-leak-app-
  49531   49531 SN+   1.2 agent-leak-app-
----- 스레드별 top -----
top - 22:20:57 up 10 days,  1:12,  0 user,  load average: 0.01, 0.01, 0.00
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15326.9 free,    799.3 used,    195.6 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15248.0 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
  49522 innuend+  20   0    2908   2192   1920 S   0.0   0.0   0:00.07 agent-l+
  49531 innuend+  30  10  105488  95372   9996 S   0.0   0.6   0:00.12 agent-l+

===== 2026-11-08 22:21:00 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
  49522   49519 S+    0.5  0.0  2192   2908       00:12 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
  49531   49522 SN+   1.1  0.7 120976 131092      00:12  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
  49522   49522 S+    0.5 agent-leak-app-
  49531   49531 SN+   1.1 agent-leak-app-
----- 스레드별 top -----
top - 22:21:00 up 10 days,  1:12,  0 user,  load average: 0.01, 0.01, 0.00
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15316.5 free,    820.4 used,    174.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15226.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
  49522 innuend+  20   0    2908   2192   1920 S   0.0   0.0   0:00.07 agent-l+
  49531 innuend+  30  10  131092 120976   9996 S   0.0   0.7   0:00.15 agent-l+

===== 2026-11-08 22:21:03 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
  49522   49519 S+    0.4  0.0  2192   2908       00:16 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
  49531   49522 SN+   1.1  0.8 146580 156696      00:16  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
  49522   49522 S+    0.4 agent-leak-app-
  49531   49531 SN+   1.1 agent-leak-app-
----- 스레드별 top -----
top - 22:21:04 up 10 days,  1:12,  0 user,  load average: 0.01, 0.01, 0.00
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15288.5 free,    848.3 used,    174.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15199.0 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
  49522 innuend+  20   0    2908   2192   1920 S   0.0   0.0   0:00.07 agent-l+
  49531 innuend+  30  10  156696 146580   9996 S   0.0   0.9   0:00.18 agent-l+
