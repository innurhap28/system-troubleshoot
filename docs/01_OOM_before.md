CASE_NAME=oom
PROFILE=baseline
RESULT=application_exited
APP_PID=3025
APP_EXIT_STATUS=137
STARTED_AT=2026-11-15 06:13:38 +0900
FINISHED_AT=2026-11-15 06:14:11 +0900
ELAPSED_SECONDS=33
MEMORY_LIMIT=256
CPU_MAX_OCCUPY=50
MULTI_THREAD_ENABLE=true
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
   ... MEMORY_LIMIT=256MB, CPU_MAX_OCCUPY=50%, MULTI_THREAD_ENABLE=True
------------------------------------------------------------
All Boot Checks Passed!
Agent READY
2026-11-15 06:13:38,823 [INFO] [SafetyGuard] Process priority lowered (nice=10).
2026-11-15 06:13:38,823 [INFO] Agent listening at port 15034

==================================================
 [ Agent Initiate ] Resource Check 
==================================================
 [ MEMORY ] Limit: 256MB 		[ WARNING: Recommend Over 256MB ]
 [ CPU    ] Limit: 50%  		[ OK ]
 [ THREAD ] Concurrency: True 		[ WARNING ]
--------------------------------------------------
 >>> SYSTEM WARNING: POTENTIAL DEADLOCK IN CONCURRENT MODE.
==================================================

2026-11-15 06:13:40,840 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-15 06:13:43,862 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-15 06:13:46,895 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-15 06:13:49,939 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-15 06:13:52,982 [INFO] [MemoryWorker] Current Heap: 125MB
2026-11-15 06:13:56,026 [INFO] [MemoryWorker] Current Heap: 150MB
2026-11-15 06:13:59,069 [INFO] [MemoryWorker] Current Heap: 175MB
2026-11-15 06:14:02,112 [INFO] [MemoryWorker] Current Heap: 200MB
2026-11-15 06:14:05,154 [INFO] [MemoryWorker] Current Heap: 225MB
2026-11-15 06:14:08,202 [INFO] [MemoryWorker] Current Heap: 250MB
2026-11-15 06:14:11,248 [INFO] [MemoryWorker] Current Heap: 275MB
2026-11-15 06:14:11,248 [CRITICAL] [MemoryGuard] Memory limit exceeded (275MB >= 256MB) / (Recommend Over 256MB)
2026-11-15 06:14:11,248 [CRITICAL] [MemoryGuard] Self-terminating process 3032 to prevent system instability.
===== 2026-11-15 06:13:38 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3025    3011 S+   18.1  0.0  2204   2908       00:00 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3032    3025 SN+  17.6  0.1 18524  28688       00:00  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3025    3025 S+   17.3 agent-leak-app-
   3032    3032 SN+  16.6 agent-leak-app-
----- Thread-level top -----
top - 06:13:39 up 1 min,  0 user,  load average: 0.15, 0.06, 0.02
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15337.5 free,    692.9 used,    311.6 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15354.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3025 innuend+  20   0    2908   2204   1936 S   0.0   0.0   0:00.04 agent-l+
   3032 innuend+  30  10   28688  18524   9968 S   0.0   0.1   0:00.03 agent-l+

===== 2026-11-15 06:13:42 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3025    3011 S+    1.1  0.0  2204   2908       00:03 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3032    3025 SN+   0.8  0.2 44128  54292       00:03  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3025    3025 S+    1.1 agent-leak-app-
   3032    3032 SN+   0.8 agent-leak-app-
----- Thread-level top -----
top - 06:13:42 up 1 min,  0 user,  load average: 0.14, 0.05, 0.02
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15298.1 free,    731.9 used,    312.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15315.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3025 innuend+  20   0    2908   2204   1936 S   0.0   0.0   0:00.04 agent-l+
   3032 innuend+  30  10   54292  44128   9968 S   0.0   0.3   0:00.03 agent-l+

===== 2026-11-15 06:13:45 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3025    3011 S+    0.5  0.0  2204   2908       00:06 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3032    3025 SN+   0.5  0.4 69732  79896       00:06  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3025    3025 S+    0.5 agent-leak-app-
   3032    3032 SN+   0.5 agent-leak-app-
----- Thread-level top -----
top - 06:13:45 up 1 min,  0 user,  load average: 0.13, 0.05, 0.02
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15264.2 free,    765.7 used,    312.1 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15281.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3025 innuend+  20   0    2908   2204   1936 S   0.0   0.0   0:00.04 agent-l+
   3032 innuend+  30  10   79896  69732   9968 S   0.0   0.4   0:00.04 agent-l+

===== 2026-11-15 06:13:48 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3025    3011 S+    0.3  0.0  2204   2908       00:10 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3032    3025 SN+   0.6  0.5 95336 105500       00:09  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3025    3025 S+    0.3 agent-leak-app-
   3032    3032 SN+   0.6 agent-leak-app-
----- Thread-level top -----
top - 06:13:48 up 1 min,  0 user,  load average: 0.13, 0.05, 0.02
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15249.5 free,    780.4 used,    312.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15266.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3025 innuend+  20   0    2908   2204   1936 S   0.0   0.0   0:00.04 agent-l+
   3032 innuend+  30  10  105500  95336   9968 S   0.0   0.6   0:00.06 agent-l+

===== 2026-11-15 06:13:52 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3025    3011 S+    0.3  0.0  2204   2908       00:13 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3032    3025 SN+   0.6  0.7 120940 131104      00:13  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3025    3025 S+    0.3 agent-leak-app-
   3032    3032 SN+   0.6 agent-leak-app-
----- Thread-level top -----
top - 06:13:52 up 1 min,  0 user,  load average: 0.12, 0.05, 0.02
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15212.4 free,    817.6 used,    312.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15229.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3025 innuend+  20   0    2908   2204   1936 S   0.0   0.0   0:00.04 agent-l+
   3032 innuend+  30  10  131104 120940   9968 S   0.0   0.7   0:00.08 agent-l+

===== 2026-11-15 06:13:55 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3025    3011 S+    0.2  0.0  2204   2908       00:16 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3032    3025 SN+   0.6  0.8 146544 156708      00:16  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3025    3025 S+    0.2 agent-leak-app-
   3032    3032 SN+   0.6 agent-leak-app-
----- Thread-level top -----
top - 06:13:55 up 1 min,  0 user,  load average: 0.11, 0.05, 0.02
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.6 us,  0.0 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15185.0 free,    844.9 used,    312.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15202.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3025 innuend+  20   0    2908   2204   1936 S   0.0   0.0   0:00.04 agent-l+
   3032 innuend+  30  10  156708 146544   9968 S   0.0   0.9   0:00.11 agent-l+

===== 2026-11-15 06:13:58 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3025    3011 S+    0.2  0.0  2204   2908       00:19 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3032    3025 SN+   0.7  1.0 172148 182312      00:19  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3025    3025 S+    0.2 agent-leak-app-
   3032    3032 SN+   0.7 agent-leak-app-
----- Thread-level top -----
top - 06:13:58 up 1 min,  0 user,  load average: 0.11, 0.05, 0.02
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15150.0 free,    879.9 used,    312.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15167.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3025 innuend+  20   0    2908   2204   1936 S   0.0   0.0   0:00.04 agent-l+
   3032 innuend+  30  10  182312 172148   9968 S   0.0   1.0   0:00.14 agent-l+

===== 2026-11-15 06:14:01 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3025    3011 S+    0.1  0.0  2204   2908       00:23 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3032    3025 SN+   0.6  1.2 197752 207916      00:23  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3025    3025 S+    0.1 agent-leak-app-
   3032    3032 SN+   0.6 agent-leak-app-
----- Thread-level top -----
top - 06:14:02 up 1 min,  0 user,  load average: 0.10, 0.05, 0.02
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15128.3 free,    901.6 used,    312.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15145.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3025 innuend+  20   0    2908   2204   1936 S   0.0   0.0   0:00.04 agent-l+
   3032 innuend+  30  10  207916 197752   9968 S   0.0   1.2   0:00.16 agent-l+

===== 2026-11-15 06:14:05 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3025    3011 S+    0.1  0.0  2204   2908       00:26 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3032    3025 RN+   0.7  1.3 227160 259124      00:26  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3025    3025 S+    0.1 agent-leak-app-
   3032    3032 RN+   0.7 agent-leak-app-
----- Thread-level top -----
top - 06:14:05 up 2 min,  0 user,  load average: 0.09, 0.05, 0.01
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15071.2 free,    958.6 used,    312.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15088.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3025 innuend+  20   0    2908   2204   1936 S   0.0   0.0   0:00.04 agent-l+
   3032 innuend+  30  10  259124 248960   9968 S   0.0   1.5   0:00.21 agent-l+

===== 2026-11-15 06:14:08 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3025    3011 S+    0.1  0.0  2204   2908       00:29 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3032    3025 SN+   0.8  1.6 274564 284728      00:29  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3025    3025 S+    0.1 agent-leak-app-
   3032    3032 SN+   0.8 agent-leak-app-
----- Thread-level top -----
top - 06:14:08 up 2 min,  0 user,  load average: 0.09, 0.05, 0.01
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15039.2 free,    990.3 used,    312.4 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15057.0 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3025 innuend+  20   0    2908   2204   1936 S   0.0   0.0   0:00.04 agent-l+
   3032 innuend+  30  10  284728 274564   9968 S   0.0   1.7   0:00.24 agent-l+

[2026-11-15 06:13:39] 프로세스:agent-leak-app PID:3032 부모PID:3025 CPU:6.9% 상주메모리:18.1MB 실행시간:00:00 포트:15034/열림
[2026-11-15 06:13:42] 프로세스:agent-leak-app PID:3032 부모PID:3025 CPU:0.8% 상주메모리:43.1MB 실행시간:00:03 포트:15034/열림
[2026-11-15 06:13:45] 프로세스:agent-leak-app PID:3032 부모PID:3025 CPU:0.5% 상주메모리:68.1MB 실행시간:00:06 포트:15034/열림
[2026-11-15 06:13:49] 프로세스:agent-leak-app PID:3032 부모PID:3025 CPU:0.5% 상주메모리:93.1MB 실행시간:00:10 포트:15034/열림
[2026-11-15 06:13:52] 프로세스:agent-leak-app PID:3032 부모PID:3025 CPU:0.5% 상주메모리:118.1MB 실행시간:00:13 포트:15034/열림
[2026-11-15 06:13:55] 프로세스:agent-leak-app PID:3032 부모PID:3025 CPU:0.6% 상주메모리:143.1MB 실행시간:00:16 포트:15034/열림
[2026-11-15 06:13:58] 프로세스:agent-leak-app PID:3032 부모PID:3025 CPU:0.6% 상주메모리:168.1MB 실행시간:00:20 포트:15034/열림
[2026-11-15 06:14:02] 프로세스:agent-leak-app PID:3032 부모PID:3025 CPU:0.8% 상주메모리:218.0MB 실행시간:00:23 포트:15034/열림
[2026-11-15 06:14:05] 프로세스:agent-leak-app PID:3032 부모PID:3025 CPU:0.7% 상주메모리:243.1MB 실행시간:00:26 포트:15034/열림
[2026-11-15 06:14:08] 프로세스:agent-leak-app PID:3032 부모PID:3025 CPU:0.8% 상주메모리:268.1MB 실행시간:00:29 포트:15034/열림
[2026-11-15 06:14:11] 프로세스:agent-leak-app 상태:종료 포트:15034/닫힘

========== OOM SNAPSHOT 2026-11-15 06:13:39 ==========
CONFIGURED_MEMORY_LIMIT_MB=256
PROCESS_STATUS: PID 3025 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3025    3011 S+    8.8  0.0  2204   2908       00:00 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3025/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2204 VmHWM_kB=2204
PROCESS_RSS_MB=2.15
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.8%
----- Detailed memory from smaps_rollup -----
Rss:                2204 kB
Pss:                 486 kB
Pss_Anon:            268 kB
Pss_File:            214 kB
Shared_Clean:       1900 kB
Shared_Dirty:          0 kB
Private_Clean:        32 kB
Private_Dirty:       272 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       697Mi        14Gi        26Mi       311Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15700412 kB
MemAvailable:   15717908 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
      8 21672  0.1 orbstack-agent:
   3032 18524  0.1 agent-leak-app-
      1 13320  0.0 systemd
   1792 11280  0.0 systemd
    122 10164  0.0 systemd-journal
    238  9536  0.0 systemd-logind
    180  8972  0.0 systemd-network
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
   ... Port 15034 is available.
[5/6] Verifying Log Permission            [OK]
   ... Log directory is writable: /home/innuendo3712/agent-app/logs
[6/6] Verifying Mission Environment       [OK]
   ... MEMORY_LIMIT=256MB, CPU_MAX_OCCUPY=50%, MULTI_THREAD_ENABLE=True
------------------------------------------------------------
All Boot Checks Passed!
Agent READY
2026-11-15 06:13:38,823 [INFO] [SafetyGuard] Process priority lowered (nice=10).
2026-11-15 06:13:38,823 [INFO] Agent listening at port 15034
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:13:42 ==========
CONFIGURED_MEMORY_LIMIT_MB=256
PROCESS_STATUS: PID 3025 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3025    3011 S+    1.0  0.0  2204   2908       00:03 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3025/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2204 VmHWM_kB=2204
PROCESS_RSS_MB=2.15
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.8%
----- Detailed memory from smaps_rollup -----
Rss:                2204 kB
Pss:                 486 kB
Pss_Anon:            268 kB
Pss_File:            214 kB
Shared_Clean:       1900 kB
Shared_Dirty:          0 kB
Private_Clean:        32 kB
Private_Dirty:       272 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       733Mi        14Gi        26Mi       312Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15663128 kB
MemAvailable:   15680892 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3032 44128  0.2 agent-leak-app-
      8 21672  0.1 orbstack-agent:
      1 13320  0.0 systemd
   1792 11280  0.0 systemd
    122 10164  0.0 systemd-journal
    238  9536  0.0 systemd-logind
    180  8972  0.0 systemd-network
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
 [ Agent Initiate ] Resource Check 
==================================================
 [ MEMORY ] Limit: 256MB 		[ WARNING: Recommend Over 256MB ]
 [ CPU    ] Limit: 50%  		[ OK ]
 [ THREAD ] Concurrency: True 		[ WARNING ]
--------------------------------------------------
 >>> SYSTEM WARNING: POTENTIAL DEADLOCK IN CONCURRENT MODE.
==================================================

2026-11-15 06:13:40,840 [INFO] [MemoryWorker] Current Heap: 25MB
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:13:45 ==========
CONFIGURED_MEMORY_LIMIT_MB=256
PROCESS_STATUS: PID 3025 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3025    3011 S+    0.5  0.0  2204   2908       00:06 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3025/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2204 VmHWM_kB=2204
PROCESS_RSS_MB=2.15
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.8%
----- Detailed memory from smaps_rollup -----
Rss:                2204 kB
Pss:                 486 kB
Pss_Anon:            268 kB
Pss_File:            214 kB
Shared_Clean:       1900 kB
Shared_Dirty:          0 kB
Private_Clean:        32 kB
Private_Dirty:       272 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       768Mi        14Gi        26Mi       312Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15627296 kB
MemAvailable:   15645104 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3032 69732  0.4 agent-leak-app-
      8 21672  0.1 orbstack-agent:
      1 13320  0.0 systemd
   1792 11280  0.0 systemd
    122 10164  0.0 systemd-journal
    238  9536  0.0 systemd-logind
    180  8972  0.0 systemd-network
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
==================================================
 [ MEMORY ] Limit: 256MB 		[ WARNING: Recommend Over 256MB ]
 [ CPU    ] Limit: 50%  		[ OK ]
 [ THREAD ] Concurrency: True 		[ WARNING ]
--------------------------------------------------
 >>> SYSTEM WARNING: POTENTIAL DEADLOCK IN CONCURRENT MODE.
==================================================

2026-11-15 06:13:40,840 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-15 06:13:43,862 [INFO] [MemoryWorker] Current Heap: 50MB
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:13:48 ==========
CONFIGURED_MEMORY_LIMIT_MB=256
PROCESS_STATUS: PID 3025 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3025    3011 S+    0.3  0.0  2204   2908       00:10 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3025/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2204 VmHWM_kB=2204
PROCESS_RSS_MB=2.15
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.8%
----- Detailed memory from smaps_rollup -----
Rss:                2204 kB
Pss:                 486 kB
Pss_Anon:            268 kB
Pss_File:            214 kB
Shared_Clean:       1900 kB
Shared_Dirty:          0 kB
Private_Clean:        32 kB
Private_Dirty:       272 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       786Mi        14Gi        26Mi       312Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15609476 kB
MemAvailable:   15627252 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3032 95336  0.5 agent-leak-app-
      8 21672  0.1 orbstack-agent:
      1 13320  0.0 systemd
   1792 11280  0.0 systemd
    122 10164  0.0 systemd-journal
    238  9536  0.0 systemd-logind
    180  8972  0.0 systemd-network
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
 [ MEMORY ] Limit: 256MB 		[ WARNING: Recommend Over 256MB ]
 [ CPU    ] Limit: 50%  		[ OK ]
 [ THREAD ] Concurrency: True 		[ WARNING ]
--------------------------------------------------
 >>> SYSTEM WARNING: POTENTIAL DEADLOCK IN CONCURRENT MODE.
==================================================

2026-11-15 06:13:40,840 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-15 06:13:43,862 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-15 06:13:46,895 [INFO] [MemoryWorker] Current Heap: 75MB
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:13:52 ==========
CONFIGURED_MEMORY_LIMIT_MB=256
PROCESS_STATUS: PID 3025 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3025    3011 S+    0.2  0.0  2204   2908       00:13 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3025/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2204 VmHWM_kB=2204
PROCESS_RSS_MB=2.15
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.8%
----- Detailed memory from smaps_rollup -----
Rss:                2204 kB
Pss:                 486 kB
Pss_Anon:            268 kB
Pss_File:            214 kB
Shared_Clean:       1900 kB
Shared_Dirty:          0 kB
Private_Clean:        32 kB
Private_Dirty:       272 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       820Mi        14Gi        26Mi       312Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15574688 kB
MemAvailable:   15592472 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3032 120940  0.7 agent-leak-app-
      8 21672  0.1 orbstack-agent:
      1 13320  0.0 systemd
   1792 11280  0.0 systemd
    122 10164  0.0 systemd-journal
    238  9536  0.0 systemd-logind
    180  8972  0.0 systemd-network
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
 [ CPU    ] Limit: 50%  		[ OK ]
 [ THREAD ] Concurrency: True 		[ WARNING ]
--------------------------------------------------
 >>> SYSTEM WARNING: POTENTIAL DEADLOCK IN CONCURRENT MODE.
==================================================

2026-11-15 06:13:40,840 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-15 06:13:43,862 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-15 06:13:46,895 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-15 06:13:49,939 [INFO] [MemoryWorker] Current Heap: 100MB
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:13:55 ==========
CONFIGURED_MEMORY_LIMIT_MB=256
PROCESS_STATUS: PID 3025 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3025    3011 S+    0.2  0.0  2204   2908       00:16 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3025/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2204 VmHWM_kB=2204
PROCESS_RSS_MB=2.15
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.8%
----- Detailed memory from smaps_rollup -----
Rss:                2204 kB
Pss:                 486 kB
Pss_Anon:            268 kB
Pss_File:            214 kB
Shared_Clean:       1900 kB
Shared_Dirty:          0 kB
Private_Clean:        32 kB
Private_Dirty:       272 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       849Mi        14Gi        26Mi       312Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15544936 kB
MemAvailable:   15562720 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3032 146544  0.8 agent-leak-app-
      8 21672  0.1 orbstack-agent:
      1 13320  0.0 systemd
   1792 11280  0.0 systemd
    122 10164  0.0 systemd-journal
    238  9536  0.0 systemd-logind
    180  8972  0.0 systemd-network
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
 [ THREAD ] Concurrency: True 		[ WARNING ]
--------------------------------------------------
 >>> SYSTEM WARNING: POTENTIAL DEADLOCK IN CONCURRENT MODE.
==================================================

2026-11-15 06:13:40,840 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-15 06:13:43,862 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-15 06:13:46,895 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-15 06:13:49,939 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-15 06:13:52,982 [INFO] [MemoryWorker] Current Heap: 125MB
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:13:58 ==========
CONFIGURED_MEMORY_LIMIT_MB=256
PROCESS_STATUS: PID 3025 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3025    3011 S+    0.1  0.0  2204   2908       00:20 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3025/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2204 VmHWM_kB=2204
PROCESS_RSS_MB=2.15
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.8%
----- Detailed memory from smaps_rollup -----
Rss:                2204 kB
Pss:                 486 kB
Pss_Anon:            268 kB
Pss_File:            214 kB
Shared_Clean:       1900 kB
Shared_Dirty:          0 kB
Private_Clean:        32 kB
Private_Dirty:       272 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       870Mi        14Gi        26Mi       312Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15522172 kB
MemAvailable:   15539960 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3032 172148  1.0 agent-leak-app-
      8 21672  0.1 orbstack-agent:
      1 13320  0.0 systemd
   1792 11280  0.0 systemd
    122 10164  0.0 systemd-journal
    238  9536  0.0 systemd-logind
    180  8972  0.0 systemd-network
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
--------------------------------------------------
 >>> SYSTEM WARNING: POTENTIAL DEADLOCK IN CONCURRENT MODE.
==================================================

2026-11-15 06:13:40,840 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-15 06:13:43,862 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-15 06:13:46,895 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-15 06:13:49,939 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-15 06:13:52,982 [INFO] [MemoryWorker] Current Heap: 125MB
2026-11-15 06:13:56,026 [INFO] [MemoryWorker] Current Heap: 150MB
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:14:02 ==========
CONFIGURED_MEMORY_LIMIT_MB=256
PROCESS_STATUS: PID 3025 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3025    3011 S+    0.1  0.0  2204   2908       00:23 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3025/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2204 VmHWM_kB=2204
PROCESS_RSS_MB=2.15
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.8%
----- Detailed memory from smaps_rollup -----
Rss:                2204 kB
Pss:                 486 kB
Pss_Anon:            268 kB
Pss_File:            214 kB
Shared_Clean:       1900 kB
Shared_Dirty:          0 kB
Private_Clean:        32 kB
Private_Dirty:       272 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       908Mi        14Gi        26Mi       312Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15483504 kB
MemAvailable:   15501296 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3032 204508  1.2 agent-leak-app-
      8 21672  0.1 orbstack-agent:
      1 13320  0.0 systemd
   1792 11280  0.0 systemd
    122 10164  0.0 systemd-journal
    238  9536  0.0 systemd-logind
    180  8972  0.0 systemd-network
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
 >>> SYSTEM WARNING: POTENTIAL DEADLOCK IN CONCURRENT MODE.
==================================================

2026-11-15 06:13:40,840 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-15 06:13:43,862 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-15 06:13:46,895 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-15 06:13:49,939 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-15 06:13:52,982 [INFO] [MemoryWorker] Current Heap: 125MB
2026-11-15 06:13:56,026 [INFO] [MemoryWorker] Current Heap: 150MB
2026-11-15 06:13:59,069 [INFO] [MemoryWorker] Current Heap: 175MB
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:14:05 ==========
CONFIGURED_MEMORY_LIMIT_MB=256
PROCESS_STATUS: PID 3025 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3025    3011 S+    0.1  0.0  2204   2908       00:26 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3025/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2204 VmHWM_kB=2204
PROCESS_RSS_MB=2.15
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.8%
----- Detailed memory from smaps_rollup -----
Rss:                2204 kB
Pss:                 486 kB
Pss_Anon:            268 kB
Pss_File:            214 kB
Shared_Clean:       1900 kB
Shared_Dirty:          0 kB
Private_Clean:        32 kB
Private_Dirty:       272 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       960Mi        14Gi        26Mi       312Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15430536 kB
MemAvailable:   15448532 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3032 248960  1.5 agent-leak-app-
      8 21672  0.1 orbstack-agent:
      1 13320  0.0 systemd
   1792 11280  0.0 systemd
    122 10164  0.0 systemd-journal
    238  9536  0.0 systemd-logind
    180  8972  0.0 systemd-network
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----

2026-11-15 06:13:40,840 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-15 06:13:43,862 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-15 06:13:46,895 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-15 06:13:49,939 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-15 06:13:52,982 [INFO] [MemoryWorker] Current Heap: 125MB
2026-11-15 06:13:56,026 [INFO] [MemoryWorker] Current Heap: 150MB
2026-11-15 06:13:59,069 [INFO] [MemoryWorker] Current Heap: 175MB
2026-11-15 06:14:02,112 [INFO] [MemoryWorker] Current Heap: 200MB
2026-11-15 06:14:05,154 [INFO] [MemoryWorker] Current Heap: 225MB
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:14:08 ==========
CONFIGURED_MEMORY_LIMIT_MB=256
PROCESS_STATUS: PID 3025 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3025    3011 S+    0.1  0.0  2204   2908       00:29 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3025/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2204 VmHWM_kB=2204
PROCESS_RSS_MB=2.15
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.8%
----- Detailed memory from smaps_rollup -----
Rss:                2204 kB
Pss:                 486 kB
Pss_Anon:            268 kB
Pss_File:            214 kB
Shared_Clean:       1900 kB
Shared_Dirty:          0 kB
Private_Clean:        32 kB
Private_Dirty:       272 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       992Mi        14Gi        26Mi       312Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15397708 kB
MemAvailable:   15415876 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3032 274564  1.6 agent-leak-app-
      8 21672  0.1 orbstack-agent:
      1 13320  0.0 systemd
   1792 11280  0.0 systemd
    122 10164  0.0 systemd-journal
    238  9536  0.0 systemd-logind
    180  8972  0.0 systemd-network
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:13:40,840 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-15 06:13:43,862 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-15 06:13:46,895 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-15 06:13:49,939 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-15 06:13:52,982 [INFO] [MemoryWorker] Current Heap: 125MB
2026-11-15 06:13:56,026 [INFO] [MemoryWorker] Current Heap: 150MB
2026-11-15 06:13:59,069 [INFO] [MemoryWorker] Current Heap: 175MB
2026-11-15 06:14:02,112 [INFO] [MemoryWorker] Current Heap: 200MB
2026-11-15 06:14:05,154 [INFO] [MemoryWorker] Current Heap: 225MB
2026-11-15 06:14:08,202 [INFO] [MemoryWorker] Current Heap: 250MB
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:14:11 ==========
CONFIGURED_MEMORY_LIMIT_MB=256
PROCESS_STATUS: PID 3025 is not present in /proc
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       698Mi        14Gi        12Mi       298Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15699376 kB
MemAvailable:   15717580 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
      8 21672  0.1 orbstack-agent:
      1 13320  0.0 systemd
   1792 11280  0.0 systemd
    122 10164  0.0 systemd-journal
    238  9536  0.0 systemd-logind
    180  8972  0.0 systemd-network
    176  6128  0.0 systemd-udevd
----- MemoryGuard / termination log evidence -----
2026-11-15 06:14:11,248 [CRITICAL] [MemoryGuard] Memory limit exceeded (275MB >= 256MB) / (Recommend Over 256MB)
2026-11-15 06:14:11,248 [CRITICAL] [MemoryGuard] Self-terminating process 3032 to prevent system instability.
----- Last application log lines -----
2026-11-15 06:13:49,939 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-15 06:13:52,982 [INFO] [MemoryWorker] Current Heap: 125MB
2026-11-15 06:13:56,026 [INFO] [MemoryWorker] Current Heap: 150MB
2026-11-15 06:13:59,069 [INFO] [MemoryWorker] Current Heap: 175MB
2026-11-15 06:14:02,112 [INFO] [MemoryWorker] Current Heap: 200MB
2026-11-15 06:14:05,154 [INFO] [MemoryWorker] Current Heap: 225MB
2026-11-15 06:14:08,202 [INFO] [MemoryWorker] Current Heap: 250MB
2026-11-15 06:14:11,248 [INFO] [MemoryWorker] Current Heap: 275MB
2026-11-15 06:14:11,248 [CRITICAL] [MemoryGuard] Memory limit exceeded (275MB >= 256MB) / (Recommend Over 256MB)
2026-11-15 06:14:11,248 [CRITICAL] [MemoryGuard] Self-terminating process 3032 to prevent system instability.
========== END OOM SNAPSHOT ==========
