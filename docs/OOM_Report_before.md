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
2026-11-10 00:43:30,062 [INFO] [SafetyGuard] Process priority lowered (nice=10).
2026-11-10 00:43:30,063 [INFO] Agent listening at port 15034

==================================================
 [ Agent Initiate ] Resource Check 
==================================================
 [ MEMORY ] Limit: 128MB 		[ WARNING: Recommend Over 256MB ]
 [ CPU    ] Limit: 50%  		[ OK ]
 [ THREAD ] Concurrency: False 		[ OK ]
--------------------------------------------------
 >>> SYSTEM STATUS: STABLE. STARTING WORKLOAD MONITORING...
==================================================

2026-11-10 00:43:32,103 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-10 00:43:35,148 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-10 00:43:38,192 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-10 00:43:41,236 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-10 00:43:44,282 [INFO] [MemoryWorker] Current Heap: 125MB
2026-11-10 00:43:47,324 [INFO] [MemoryWorker] Current Heap: 150MB
2026-11-10 00:43:47,325 [CRITICAL] [MemoryGuard] Memory limit exceeded (150MB >= 128MB) / (Recommend Over 256MB)
2026-11-10 00:43:47,325 [CRITICAL] [MemoryGuard] Self-terminating process 3067 to prevent system instability.
===== 2026-11-10 00:43:30 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3063    3061 S+   18.1  0.0  2208   2908       00:00 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3067    3063 SN+  23.5  0.1 18464  28688       00:00  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3063    3063 S+   18.1 agent-leak-app-
   3067    3067 SN+  23.5 agent-leak-app-
----- 스레드별 top -----
top - 00:43:30 up 23:53,  0 user,  load average: 0.17, 0.09, 0.03
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15342.4 free,    683.6 used,    317.4 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15363.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3063 innuend+  20   0    2908   2208   1936 S   0.0   0.0   0:00.04 agent-l+
   3067 innuend+  30  10   28688  18464   9904 S   0.0   0.1   0:00.04 agent-l+

===== 2026-11-10 00:43:33 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3063    3061 S+    1.1  0.0  2208   2908       00:03 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3067    3063 SN+   1.7  0.2 44068  54292       00:03  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3063    3063 S+    1.1 agent-leak-app-
   3067    3067 SN+   1.7 agent-leak-app-
----- 스레드별 top -----
top - 00:43:33 up 23:53,  0 user,  load average: 0.17, 0.09, 0.03
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15308.4 free,    717.4 used,    317.7 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15329.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3063 innuend+  20   0    2908   2208   1936 S   0.0   0.0   0:00.04 agent-l+
   3067 innuend+  30  10   54292  44068   9904 S   0.0   0.3   0:00.06 agent-l+

===== 2026-11-10 00:43:36 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3063    3061 S+    0.5  0.0  2208   2908       00:06 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3067    3063 SN+   1.3  0.4 69672  79896       00:06  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3063    3063 S+    0.5 agent-leak-app-
   3067    3067 SN+   1.3 agent-leak-app-
----- 스레드별 top -----
top - 00:43:36 up 23:54,  0 user,  load average: 0.16, 0.09, 0.03
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15277.5 free,    748.2 used,    317.7 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15299.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3063 innuend+  20   0    2908   2208   1936 S   0.0   0.0   0:00.04 agent-l+
   3067 innuend+  30  10   79896  69672   9904 S   0.0   0.4   0:00.09 agent-l+

===== 2026-11-10 00:43:39 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3063    3061 S+    0.4  0.0  2208   2908       00:09 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3067    3063 SN+   1.3  0.5 95276 105500       00:09  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3063    3063 S+    0.4 agent-leak-app-
   3067    3067 SN+   1.3 agent-leak-app-
----- 스레드별 top -----
top - 00:43:40 up 23:54,  0 user,  load average: 0.14, 0.09, 0.03
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15246.2 free,    779.4 used,    317.7 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15267.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3063 innuend+  20   0    2908   2208   1936 S   0.0   0.0   0:00.04 agent-l+
   3067 innuend+  30  10  105500  95276   9904 S   0.0   0.6   0:00.13 agent-l+

===== 2026-11-10 00:43:43 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3063    3061 S+    0.3  0.0  2208   2908       00:13 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3067    3063 SN+   1.1  0.7 120880 131104      00:13  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3063    3063 S+    0.3 agent-leak-app-
   3067    3067 SN+   1.1 agent-leak-app-
----- 스레드별 top -----
top - 00:43:43 up 23:54,  0 user,  load average: 0.14, 0.09, 0.03
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15215.9 free,    809.8 used,    317.6 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15237.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3063 innuend+  20   0    2908   2208   1936 S   0.0   0.0   0:00.04 agent-l+
   3067 innuend+  30  10  131104 120880   9904 S   0.0   0.7   0:00.15 agent-l+

===== 2026-11-10 00:43:46 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3063    3061 S+    0.2  0.0  2208   2908       00:16 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3067    3063 SN+   1.0  0.8 146484 156708      00:16  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3063    3063 S+    0.2 agent-leak-app-
   3067    3067 SN+   1.0 agent-leak-app-
----- 스레드별 top -----
top - 00:43:46 up 23:54,  0 user,  load average: 0.13, 0.08, 0.03
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15185.2 free,    840.5 used,    317.6 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15206.8 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3063 innuend+  20   0    2908   2208   1936 S   0.0   0.0   0:00.04 agent-l+
   3067 innuend+  30  10  156708 146484   9904 S   0.0   0.9   0:00.18 agent-l+

[2026-11-10 00:43:30] 프로세스:agent-leak-app PID:3067 부모PID:3063 CPU:10.0% 상주메모리:18.0MB 실행시간:00:00 포트:15034/열림
[2026-11-10 00:43:33] 프로세스:agent-leak-app PID:3067 부모PID:3063 CPU:1.6% 상주메모리:43.0MB 실행시간:00:03 포트:15034/열림
[2026-11-10 00:43:36] 프로세스:agent-leak-app PID:3067 부모PID:3063 CPU:1.3% 상주메모리:68.0MB 실행시간:00:06 포트:15034/열림
[2026-11-10 00:43:40] 프로세스:agent-leak-app PID:3067 부모PID:3063 CPU:1.2% 상주메모리:93.0MB 실행시간:00:10 포트:15034/열림
[2026-11-10 00:43:43] 프로세스:agent-leak-app PID:3067 부모PID:3063 CPU:1.1% 상주메모리:118.0MB 실행시간:00:13 포트:15034/열림
[2026-11-10 00:43:46] 프로세스:agent-leak-app PID:3067 부모PID:3063 CPU:1.0% 상주메모리:143.1MB 실행시간:00:16 포트:15034/열림
[2026-11-10 00:43:49] 프로세스:agent-leak-app 상태:종료 포트:15034/닫힘
3063
