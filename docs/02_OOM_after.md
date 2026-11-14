CASE_NAME=oom
PROFILE=adjusted
RESULT=max_runtime_reached
APP_PID=3743
APP_EXIT_STATUS=143
STARTED_AT=2026-11-15 06:27:47 +0900
FINISHED_AT=2026-11-15 06:30:47 +0900
ELAPSED_SECONDS=180
MEMORY_LIMIT=512
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
   ... MEMORY_LIMIT=512MB, CPU_MAX_OCCUPY=50%, MULTI_THREAD_ENABLE=True
------------------------------------------------------------
All Boot Checks Passed!
Agent READY
2026-11-15 06:27:47,388 [INFO] [SafetyGuard] Process priority lowered (nice=10).
2026-11-15 06:27:47,388 [INFO] Agent listening at port 15034

==================================================
 [ Agent Initiate ] Resource Check 
==================================================
 [ MEMORY ] Limit: 512MB 		[ OK ]
 [ CPU    ] Limit: 50%  		[ OK ]
 [ THREAD ] Concurrency: True 		[ WARNING ]
--------------------------------------------------
 >>> SYSTEM WARNING: POTENTIAL DEADLOCK IN CONCURRENT MODE.
==================================================

2026-11-15 06:27:49,401 [WARNING] [AgentWorker] Initializing concurrent transaction processors...
2026-11-15 06:27:49,401 [WARNING] [System] CAUTION: Strict resource locking is enabled.
2026-11-15 06:27:54,428 [INFO] [Worker-Thread-1] Process Started. Attempting to lock [Shared_Memory_A]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)

===== 2026-11-15 06:27:47 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+   26.0  0.0  2196   2908       00:00 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SN+  26.6  0.1 18584  28688       00:00  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+   26.0 agent-leak-app-
   3750    3750 SN+  26.6 agent-leak-app-
----- Thread-level top -----
top - 06:27:47 up 15 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15508.9 free,    647.2 used,    135.7 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15400.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10   28688  18584  10028 S   0.0   0.1   0:00.04 agent-l+

===== 2026-11-15 06:27:50 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    1.7  0.0  2196   2908       00:03 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SN+   1.1  0.1 18584  28688       00:03  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    1.7 agent-leak-app-
   3750    3750 SN+   1.1 agent-leak-app-
----- Thread-level top -----
top - 06:27:50 up 15 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15506.3 free,    661.1 used,    113.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15386.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10   28688  18584  10028 S   0.0   0.1   0:00.04 agent-l+

===== 2026-11-15 06:27:54 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.8  0.0  2196   2908       00:06 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SN+   0.5  0.1 18584  28688       00:06  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.8 agent-leak-app-
   3750    3750 SN+   0.5 agent-leak-app-
----- Thread-level top -----
top - 06:27:54 up 15 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15472.4 free,    685.5 used,    132.1 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15361.8 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10   28688  18584  10028 S   0.0   0.1   0:00.04 agent-l+

===== 2026-11-15 06:27:57 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.5  0.0  2196   2908       00:10 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.4  0.1 18680 176152       00:09  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.5 agent-leak-app-
   3750    3750 SNl+  0.4 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:27:57 up 15 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15481.2 free,    676.6 used,    132.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15370.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:00 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.4  0.0  2196   2908       00:13 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.3  0.1 18680 176152       00:13  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.4 agent-leak-app-
   3750    3750 SNl+  0.3 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:00 up 15 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15475.2 free,    682.7 used,    132.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15364.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:03 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.3  0.0  2196   2908       00:16 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.2  0.1 18680 176152       00:16  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.3 agent-leak-app-
   3750    3750 SNl+  0.2 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:04 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15466.9 free,    691.0 used,    132.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15356.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:07 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.3  0.0  2196   2908       00:19 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.2  0.1 18680 176152       00:19  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.3 agent-leak-app-
   3750    3750 SNl+  0.2 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:07 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15462.7 free,    695.1 used,    132.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15352.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:10 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.2  0.0  2196   2908       00:23 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.1  0.1 18680 176152       00:23  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.2 agent-leak-app-
   3750    3750 SNl+  0.1 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:10 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15480.6 free,    677.2 used,    132.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15370.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:13 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.2  0.0  2196   2908       00:26 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.1  0.1 18680 176152       00:26  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.2 agent-leak-app-
   3750    3750 SNl+  0.1 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:13 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15473.7 free,    684.1 used,    132.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15363.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:16 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.2  0.0  2196   2908       00:29 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.1  0.1 18680 176152       00:29  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.2 agent-leak-app-
   3750    3750 SNl+  0.1 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:17 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15468.9 free,    688.9 used,    132.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15358.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:20 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2196   2908       00:32 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.1  0.1 18680 176152       00:32  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.1 agent-leak-app-
   3750    3750 SNl+  0.1 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:20 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15470.3 free,    687.4 used,    132.4 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15359.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:23 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2196   2908       00:36 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.1  0.1 18680 176152       00:36  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.1 agent-leak-app-
   3750    3750 SNl+  0.1 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:23 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15461.1 free,    696.6 used,    132.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15350.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:26 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2196   2908       00:39 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.1  0.1 18680 176152       00:39  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.1 agent-leak-app-
   3750    3750 SNl+  0.1 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:26 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15459.5 free,    698.1 used,    132.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15349.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:30 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2196   2908       00:42 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18680 176152       00:42  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.1 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:30 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15455.2 free,    702.4 used,    132.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15344.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:33 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2196   2908       00:46 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18680 176152       00:45  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.1 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:33 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15475.9 free,    681.7 used,    132.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15365.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18680  10028 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:36 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2092   2908       00:49 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18480 176152       00:49  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.1 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:36 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15496.1 free,    675.2 used,    105.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15372.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:39 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2092   2908       00:52 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18480 176152       00:52  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.1 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:40 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15488.7 free,    682.4 used,    105.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15364.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:43 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2092   2908       00:55 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18480 176152       00:55  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.1 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:43 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15507.5 free,    663.6 used,    105.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15383.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:46 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2092   2908       00:59 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18480 176152       00:59  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.1 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:46 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15498.3 free,    672.8 used,    105.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15374.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:49 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:02 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18480 176152       01:02  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:49 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15492.1 free,    679.1 used,    105.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15368.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:52 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:05 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18480 176152       01:05  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:53 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.6 us,  0.0 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15498.3 free,    672.1 used,    107.1 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15375.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:56 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:08 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18480 176152       01:08  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:56 up 16 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15508.4 free,    662.0 used,    107.1 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15385.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:28:59 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:12 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18480 176152       01:12  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:28:59 up 16 min,  0 user,  load average: 0.08, 0.02, 0.01
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15499.5 free,    670.9 used,    107.1 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15376.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:02 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:15 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18480 176152       01:15  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:02 up 16 min,  0 user,  load average: 0.08, 0.02, 0.01
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15494.4 free,    676.0 used,    107.1 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15371.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:06 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:18 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18480 176152       01:18  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:06 up 17 min,  0 user,  load average: 0.07, 0.02, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15501.2 free,    669.2 used,    107.1 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15378.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:09 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:22 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18480 176152       01:21  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:09 up 17 min,  0 user,  load average: 0.07, 0.02, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15491.7 free,    676.7 used,    111.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15370.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:12 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:25 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18480 176152       01:25  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:12 up 17 min,  0 user,  load average: 0.07, 0.02, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15504.4 free,    664.0 used,    111.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15383.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:15 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:28 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18480 176152       01:28  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:16 up 17 min,  0 user,  load average: 0.06, 0.02, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15501.6 free,    666.8 used,    111.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15380.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:19 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:31 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18480 176152       01:31  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:19 up 17 min,  0 user,  load average: 0.06, 0.02, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15509.0 free,    659.4 used,    111.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15387.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18480   9828 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:22 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:35 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       01:35  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:22 up 17 min,  0 user,  load average: 0.06, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15521.2 free,    656.6 used,     92.1 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15390.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:25 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:38 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       01:38  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:25 up 17 min,  0 user,  load average: 0.05, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15527.7 free,    650.1 used,     92.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15397.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:28 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:41 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       01:41  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:29 up 17 min,  0 user,  load average: 0.05, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15534.8 free,    643.0 used,     92.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15404.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:32 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:44 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       01:44  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:32 up 17 min,  0 user,  load average: 0.05, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15526.1 free,    651.1 used,     93.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15396.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:35 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:48 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       01:48  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:35 up 17 min,  0 user,  load average: 0.04, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15520.8 free,    656.5 used,     93.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15390.8 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:38 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:51 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       01:51  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:38 up 17 min,  0 user,  load average: 0.04, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15524.4 free,    652.8 used,     93.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15394.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:41 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:54 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       01:54  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:42 up 17 min,  0 user,  load average: 0.04, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15523.9 free,    653.4 used,     93.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15393.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:45 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:57 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       01:57  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:45 up 17 min,  0 user,  load average: 0.04, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15516.6 free,    660.6 used,     93.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15386.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:48 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:01 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:01  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:48 up 17 min,  0 user,  load average: 0.04, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15494.7 free,    672.8 used,    112.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15374.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:51 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:04 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:04  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:51 up 17 min,  0 user,  load average: 0.03, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15515.9 free,    651.2 used,    113.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15396.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:55 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:07 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:07  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:55 up 17 min,  0 user,  load average: 0.03, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15505.8 free,    661.3 used,    113.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15386.0 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:29:58 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:11 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:10  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:29:58 up 17 min,  0 user,  load average: 0.03, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15502.1 free,    665.1 used,    113.6 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15382.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:30:01 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:14 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:14  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:30:01 up 17 min,  0 user,  load average: 0.03, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15508.2 free,    658.7 used,    114.1 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15388.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:30:04 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:17 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:17  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:30:05 up 18 min,  0 user,  load average: 0.02, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15521.5 free,    648.7 used,    107.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15398.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:30:08 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:20 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:20  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:30:08 up 18 min,  0 user,  load average: 0.02, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15514.0 free,    656.0 used,    107.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15391.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:30:11 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:24 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:24  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:30:11 up 18 min,  0 user,  load average: 0.02, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15514.9 free,    655.1 used,    107.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15392.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:30:14 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:27 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:27  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:30:14 up 18 min,  0 user,  load average: 0.02, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15522.7 free,    647.4 used,    107.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15399.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:30:17 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:30 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:30  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:30:18 up 18 min,  0 user,  load average: 0.02, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15518.0 free,    652.0 used,    107.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15395.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:30:21 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:33 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:33  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:30:21 up 18 min,  0 user,  load average: 0.02, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15511.9 free,    658.1 used,    107.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15389.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:30:24 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:37 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:37  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:30:24 up 18 min,  0 user,  load average: 0.02, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15511.0 free,    659.1 used,    107.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15388.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:30:27 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:40 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:40  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:30:27 up 18 min,  0 user,  load average: 0.02, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15520.4 free,    649.6 used,    107.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15397.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:30:31 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:43 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:43  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:30:31 up 18 min,  0 user,  load average: 0.02, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15512.9 free,    657.1 used,    107.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15390.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:30:34 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:47 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:46  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:30:34 up 18 min,  0 user,  load average: 0.01, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15517.0 free,    652.9 used,    108.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15394.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:30:37 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:50 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:50  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:30:37 up 18 min,  0 user,  load average: 0.01, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15518.4 free,    651.5 used,    108.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15395.8 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:30:40 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:53 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:53  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:30:41 up 18 min,  0 user,  load average: 0.01, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15513.6 free,    656.3 used,    108.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15391.0 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

===== 2026-11-15 06:30:44 PROCESS SNAPSHOT =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:56 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3750    3743 SNl+  0.0  0.1 18412 176152       02:56  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Thread state -----
    PID     TID STAT %CPU COMMAND
   3743    3743 S+    0.0 agent-leak-app-
   3750    3750 SNl+  0.0 agent-leak-app-
   3750    3940 SNl+  0.0 agent-leak-app-
   3750    3941 SNl+  0.0 agent-leak-app-
----- Thread-level top -----
top - 06:30:44 up 18 min,  0 user,  load average: 0.01, 0.01, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15509.2 free,    660.7 used,    108.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15386.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3743 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.06 agent-l+
   3750 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.04 agent-l+
   3940 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+
   3941 innuend+  30  10  176152  18412   9760 S   0.0   0.1   0:00.00 agent-l+

[2026-11-15 06:27:47] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:9.7% 상주메모리:18.1MB 실행시간:00:00 포트:15034/열림
[2026-11-15 06:27:51] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:1.0% 상주메모리:18.1MB 실행시간:00:03 포트:15034/열림
[2026-11-15 06:27:54] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.5% 상주메모리:18.1MB 실행시간:00:06 포트:15034/열림
[2026-11-15 06:27:57] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.3% 상주메모리:18.2MB 실행시간:00:10 포트:15034/열림
[2026-11-15 06:28:00] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.2% 상주메모리:18.2MB 실행시간:00:13 포트:15034/열림
[2026-11-15 06:28:04] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.2% 상주메모리:18.2MB 실행시간:00:16 포트:15034/열림
[2026-11-15 06:28:07] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.1% 상주메모리:18.2MB 실행시간:00:20 포트:15034/열림
[2026-11-15 06:28:10] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.1% 상주메모리:18.2MB 실행시간:00:23 포트:15034/열림
[2026-11-15 06:28:13] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.1% 상주메모리:18.2MB 실행시간:00:26 포트:15034/열림
[2026-11-15 06:28:17] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.1% 상주메모리:18.2MB 실행시간:00:29 포트:15034/열림
[2026-11-15 06:28:20] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.1% 상주메모리:18.2MB 실행시간:00:33 포트:15034/열림
[2026-11-15 06:28:23] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.1% 상주메모리:18.2MB 실행시간:00:36 포트:15034/열림
[2026-11-15 06:28:27] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.1% 상주메모리:18.2MB 실행시간:00:39 포트:15034/열림
[2026-11-15 06:28:30] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.2MB 실행시간:00:42 포트:15034/열림
[2026-11-15 06:28:33] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.2MB 실행시간:00:46 포트:15034/열림
[2026-11-15 06:28:36] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:00:49 포트:15034/열림
[2026-11-15 06:28:40] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:00:52 포트:15034/열림
[2026-11-15 06:28:43] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:00:56 포트:15034/열림
[2026-11-15 06:28:46] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:00:59 포트:15034/열림
[2026-11-15 06:28:49] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:02 포트:15034/열림
[2026-11-15 06:28:53] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:05 포트:15034/열림
[2026-11-15 06:28:56] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:09 포트:15034/열림
[2026-11-15 06:28:59] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:12 포트:15034/열림
[2026-11-15 06:29:02] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:15 포트:15034/열림
[2026-11-15 06:29:06] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:18 포트:15034/열림
[2026-11-15 06:29:09] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:22 포트:15034/열림
[2026-11-15 06:29:12] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:25 포트:15034/열림
[2026-11-15 06:29:16] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:28 포트:15034/열림
[2026-11-15 06:29:19] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:32 포트:15034/열림
[2026-11-15 06:29:22] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:35 포트:15034/열림
[2026-11-15 06:29:25] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:38 포트:15034/열림
[2026-11-15 06:29:29] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:41 포트:15034/열림
[2026-11-15 06:29:32] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:45 포트:15034/열림
[2026-11-15 06:29:35] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:48 포트:15034/열림
[2026-11-15 06:29:38] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:51 포트:15034/열림
[2026-11-15 06:29:42] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:54 포트:15034/열림
[2026-11-15 06:29:45] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:01:58 포트:15034/열림
[2026-11-15 06:29:48] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:01 포트:15034/열림
[2026-11-15 06:29:52] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:04 포트:15034/열림
[2026-11-15 06:29:55] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:07 포트:15034/열림
[2026-11-15 06:29:58] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:11 포트:15034/열림
[2026-11-15 06:30:01] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:14 포트:15034/열림
[2026-11-15 06:30:05] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:17 포트:15034/열림
[2026-11-15 06:30:08] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:21 포트:15034/열림
[2026-11-15 06:30:11] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:24 포트:15034/열림
[2026-11-15 06:30:14] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:27 포트:15034/열림
[2026-11-15 06:30:18] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:30 포트:15034/열림
[2026-11-15 06:30:21] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:34 포트:15034/열림
[2026-11-15 06:30:24] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:37 포트:15034/열림
[2026-11-15 06:30:27] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:40 포트:15034/열림
[2026-11-15 06:30:31] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:43 포트:15034/열림
[2026-11-15 06:30:34] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:47 포트:15034/열림
[2026-11-15 06:30:37] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:50 포트:15034/열림
[2026-11-15 06:30:41] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:53 포트:15034/열림
[2026-11-15 06:30:44] 프로세스:agent-leak-app PID:3750 부모PID:3743 CPU:0.0% 상주메모리:18.0MB 실행시간:02:56 포트:15034/열림
[2026-11-15 06:30:47] 프로세스:agent-leak-app 상태:종료 포트:15034/닫힘

========== OOM SNAPSHOT 2026-11-15 06:27:47 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+   13.0  0.0  2196   2908       00:00 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 676 kB
Pss_Anon:            264 kB
Pss_File:            408 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       648Mi        15Gi        26Mi       135Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15879628 kB
MemAvailable:   15768288 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18584  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
   3729  4356  0.0 bash
      1  4336  0.0 systemd
   3768  4244  0.0 bash
   3790  4168  0.0 ps
    238  2728  0.0 systemd-logind
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
   ... Port 15034 is available.
[5/6] Verifying Log Permission            [OK]
   ... Log directory is writable: /home/innuendo3712/agent-app/logs
[6/6] Verifying Mission Environment       [OK]
   ... MEMORY_LIMIT=512MB, CPU_MAX_OCCUPY=50%, MULTI_THREAD_ENABLE=True
------------------------------------------------------------
All Boot Checks Passed!
Agent READY
2026-11-15 06:27:47,388 [INFO] [SafetyGuard] Process priority lowered (nice=10).
2026-11-15 06:27:47,388 [INFO] Agent listening at port 15034
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:27:50 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    1.6  0.0  2196   2908       00:03 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 676 kB
Pss_Anon:            264 kB
Pss_File:            408 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       663Mi        15Gi        26Mi       113Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15875296 kB
MemAvailable:   15752560 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18584  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
   3729  4356  0.0 bash
      1  4312  0.0 systemd
   3829  4252  0.0 bash
   3851  4136  0.0 ps
    238  2664  0.0 systemd-logind
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
==================================================
 [ MEMORY ] Limit: 512MB 		[ OK ]
 [ CPU    ] Limit: 50%  		[ OK ]
 [ THREAD ] Concurrency: True 		[ WARNING ]
--------------------------------------------------
 >>> SYSTEM WARNING: POTENTIAL DEADLOCK IN CONCURRENT MODE.
==================================================

2026-11-15 06:27:49,401 [WARNING] [AgentWorker] Initializing concurrent transaction processors...
2026-11-15 06:27:49,401 [WARNING] [System] CAUTION: Strict resource locking is enabled.
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:27:54 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.8  0.0  2196   2908       00:07 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 650 kB
Pss_Anon:            264 kB
Pss_File:            382 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       686Mi        15Gi        26Mi       132Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15842624 kB
MemAvailable:   15729424 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18584  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6172  0.0 systemd-journal
   3729  4356  0.0 bash
   3892  4312  0.0 bash
   3914  4152  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
==================================================
 [ MEMORY ] Limit: 512MB 		[ OK ]
 [ CPU    ] Limit: 50%  		[ OK ]
 [ THREAD ] Concurrency: True 		[ WARNING ]
--------------------------------------------------
 >>> SYSTEM WARNING: POTENTIAL DEADLOCK IN CONCURRENT MODE.
==================================================

2026-11-15 06:27:49,401 [WARNING] [AgentWorker] Initializing concurrent transaction processors...
2026-11-15 06:27:49,401 [WARNING] [System] CAUTION: Strict resource locking is enabled.
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:27:57 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.5  0.0  2196   2908       00:10 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 650 kB
Pss_Anon:            264 kB
Pss_File:            382 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       677Mi        15Gi        26Mi       132Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15852328 kB
MemAvailable:   15739132 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18680  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6172  0.0 systemd-journal
   3729  4356  0.0 bash
   3955  4240  0.0 bash
   3977  4140  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:00 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.4  0.0  2196   2908       00:13 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 650 kB
Pss_Anon:            264 kB
Pss_File:            382 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       683Mi        15Gi        26Mi       132Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15845256 kB
MemAvailable:   15732060 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18680  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6172  0.0 systemd-journal
   3729  4356  0.0 bash
   4016  4264  0.0 bash
   4038  4172  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:04 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.3  0.0  2196   2908       00:16 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 650 kB
Pss_Anon:            264 kB
Pss_File:            382 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       690Mi        15Gi        26Mi       132Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15837836 kB
MemAvailable:   15724640 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18680  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6172  0.0 systemd-journal
   3729  4356  0.0 bash
   4077  4300  0.0 bash
   4099  4148  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:07 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.2  0.0  2196   2908       00:20 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 650 kB
Pss_Anon:            264 kB
Pss_File:            382 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       672Mi        15Gi        26Mi       132Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15857276 kB
MemAvailable:   15744084 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18680  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6172  0.0 systemd-journal
   3729  4356  0.0 bash
   4138  4284  0.0 bash
   4160  4148  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:10 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.2  0.0  2196   2908       00:23 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 650 kB
Pss_Anon:            264 kB
Pss_File:            382 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       677Mi        15Gi        26Mi       132Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15850916 kB
MemAvailable:   15737724 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18680  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6172  0.0 systemd-journal
   3729  4356  0.0 bash
   4199  4252  0.0 bash
   4221  4156  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:13 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.2  0.0  2196   2908       00:26 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 650 kB
Pss_Anon:            264 kB
Pss_File:            382 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       687Mi        15Gi        26Mi       132Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15841504 kB
MemAvailable:   15728312 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18680  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6172  0.0 systemd-journal
   3729  4356  0.0 bash
   4260  4260  0.0 bash
   4282  4152  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:17 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.2  0.0  2196   2908       00:29 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 650 kB
Pss_Anon:            264 kB
Pss_File:            382 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       691Mi        15Gi        26Mi       132Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15837368 kB
MemAvailable:   15724276 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18680  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6172  0.0 systemd-journal
   3729  4356  0.0 bash
   4321  4292  0.0 bash
   4343  4132  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:20 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2196   2908       00:33 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 650 kB
Pss_Anon:            264 kB
Pss_File:            382 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       689Mi        15Gi        26Mi       132Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15838872 kB
MemAvailable:   15725780 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18680  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6172  0.0 systemd-journal
   3729  4356  0.0 bash
   4382  4292  0.0 bash
   4404  4148  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:23 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2196   2908       00:36 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 650 kB
Pss_Anon:            264 kB
Pss_File:            382 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       698Mi        15Gi        26Mi       132Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15830052 kB
MemAvailable:   15717064 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18680  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6172  0.0 systemd-journal
   3729  4356  0.0 bash
   4443  4304  0.0 bash
   4465  4140  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:26 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2196   2908       00:39 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 650 kB
Pss_Anon:            264 kB
Pss_File:            382 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       698Mi        15Gi        26Mi       132Mi        14Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15829924 kB
MemAvailable:   15716940 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18680  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6172  0.0 systemd-journal
   3729  4356  0.0 bash
   4504  4308  0.0 bash
   4526  4168  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:30 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2196   2908       00:43 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 650 kB
Pss_Anon:            264 kB
Pss_File:            382 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       675Mi        15Gi        26Mi       132Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15853200 kB
MemAvailable:   15740216 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18680  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6172  0.0 systemd-journal
   3729  4356  0.0 bash
   4565  4256  0.0 bash
   4587  4140  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:33 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2196   2908       00:46 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2196 VmHWM_kB=2196
PROCESS_RSS_MB=2.14
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2196 kB
Pss:                 650 kB
Pss_Anon:            264 kB
Pss_File:            382 kB
Shared_Clean:       1824 kB
Shared_Dirty:          0 kB
Private_Clean:       104 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       684Mi        15Gi        26Mi       132Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15844380 kB
MemAvailable:   15731400 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18680  0.1 agent-leak-app-
      8 14892  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6172  0.0 systemd-journal
   3729  4356  0.0 bash
   4626  4248  0.0 bash
   4648  4164  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:36 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2092   2908       00:49 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2092 VmHWM_kB=2128
PROCESS_RSS_MB=2.04
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2092 kB
Pss:                 550 kB
Pss_Anon:            264 kB
Pss_File:            282 kB
Shared_Clean:       1816 kB
Shared_Dirty:          0 kB
Private_Clean:         8 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       677Mi        15Gi        26Mi       105Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15865240 kB
MemAvailable:   15738408 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18480  0.1 agent-leak-app-
      8 13316  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6164  0.0 systemd-journal
   3729  4356  0.0 bash
   4687  4288  0.0 bash
   4709  4148  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:40 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2092   2908       00:52 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2092 VmHWM_kB=2128
PROCESS_RSS_MB=2.04
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2092 kB
Pss:                 551 kB
Pss_Anon:            264 kB
Pss_File:            283 kB
Shared_Clean:       1816 kB
Shared_Dirty:          0 kB
Private_Clean:         8 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       685Mi        15Gi        26Mi       105Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15857600 kB
MemAvailable:   15730796 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18480  0.1 agent-leak-app-
      8 13316  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6164  0.0 systemd-journal
   3729  4356  0.0 bash
   4748  4300  0.0 bash
   4770  4124  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:43 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2092   2908       00:56 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2092 VmHWM_kB=2128
PROCESS_RSS_MB=2.04
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2092 kB
Pss:                 551 kB
Pss_Anon:            264 kB
Pss_File:            283 kB
Shared_Clean:       1816 kB
Shared_Dirty:          0 kB
Private_Clean:         8 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       665Mi        15Gi        26Mi       105Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15877304 kB
MemAvailable:   15750500 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18480  0.1 agent-leak-app-
      8 13316  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6164  0.0 systemd-journal
   3729  4356  0.0 bash
   4809  4256  0.0 bash
   4831  4160  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:46 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.1  0.0  2092   2908       00:59 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2092 VmHWM_kB=2128
PROCESS_RSS_MB=2.04
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2092 kB
Pss:                 550 kB
Pss_Anon:            264 kB
Pss_File:            282 kB
Shared_Clean:       1816 kB
Shared_Dirty:          0 kB
Private_Clean:         8 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       675Mi        15Gi        26Mi       105Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15866652 kB
MemAvailable:   15739852 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18480  0.1 agent-leak-app-
      8 13316  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6164  0.0 systemd-journal
   3729  4356  0.0 bash
   4870  4248  0.0 bash
   4892  4156  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:49 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:02 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2092 VmHWM_kB=2128
PROCESS_RSS_MB=2.04
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2092 kB
Pss:                 551 kB
Pss_Anon:            264 kB
Pss_File:            283 kB
Shared_Clean:       1816 kB
Shared_Dirty:          0 kB
Private_Clean:         8 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       675Mi        15Gi        26Mi       105Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15868772 kB
MemAvailable:   15741960 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18480  0.1 agent-leak-app-
      8 13316  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6164  0.0 systemd-journal
   3729  4356  0.0 bash
   4931  4304  0.0 bash
   4953  4152  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:53 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:05 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2092 VmHWM_kB=2128
PROCESS_RSS_MB=2.04
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2092 kB
Pss:                 551 kB
Pss_Anon:            264 kB
Pss_File:            283 kB
Shared_Clean:       1816 kB
Shared_Dirty:          0 kB
Private_Clean:         8 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       658Mi        15Gi        26Mi       107Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15884492 kB
MemAvailable:   15758472 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18480  0.1 agent-leak-app-
      8 13316  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6164  0.0 systemd-journal
   3729  4356  0.0 bash
   4992  4248  0.0 bash
   5014  4128  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:56 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:09 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2092 VmHWM_kB=2128
PROCESS_RSS_MB=2.04
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2092 kB
Pss:                 550 kB
Pss_Anon:            264 kB
Pss_File:            282 kB
Shared_Clean:       1816 kB
Shared_Dirty:          0 kB
Private_Clean:         8 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       664Mi        15Gi        26Mi       107Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15877864 kB
MemAvailable:   15751868 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18480  0.1 agent-leak-app-
      8 13316  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6164  0.0 systemd-journal
   3729  4356  0.0 bash
   5053  4192  0.0 bash
   5075  4140  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:28:59 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:12 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2092 VmHWM_kB=2128
PROCESS_RSS_MB=2.04
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2092 kB
Pss:                 550 kB
Pss_Anon:            264 kB
Pss_File:            282 kB
Shared_Clean:       1816 kB
Shared_Dirty:          0 kB
Private_Clean:         8 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       672Mi        15Gi        26Mi       107Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15870220 kB
MemAvailable:   15744224 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18480  0.1 agent-leak-app-
      8 13316  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6164  0.0 systemd-journal
   3729  4356  0.0 bash
   5114  4308  0.0 bash
   5136  4148  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:02 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:15 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2092 VmHWM_kB=2128
PROCESS_RSS_MB=2.04
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2092 kB
Pss:                 550 kB
Pss_Anon:            264 kB
Pss_File:            282 kB
Shared_Clean:       1816 kB
Shared_Dirty:          0 kB
Private_Clean:         8 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       678Mi        15Gi        26Mi       107Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15863968 kB
MemAvailable:   15737980 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18480  0.1 agent-leak-app-
      8 13316  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6164  0.0 systemd-journal
   3729  4356  0.0 bash
   5175  4256  0.0 bash
   5197  4136  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:06 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:18 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2092 VmHWM_kB=2128
PROCESS_RSS_MB=2.04
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2092 kB
Pss:                 550 kB
Pss_Anon:            264 kB
Pss_File:            282 kB
Shared_Clean:       1816 kB
Shared_Dirty:          0 kB
Private_Clean:         8 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       672Mi        15Gi        26Mi       107Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15869680 kB
MemAvailable:   15743692 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18480  0.1 agent-leak-app-
      8 13316  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6164  0.0 systemd-journal
   3729  4356  0.0 bash
   5236  4296  0.0 bash
   5258  4144  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:09 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:22 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2092 VmHWM_kB=2128
PROCESS_RSS_MB=2.04
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2092 kB
Pss:                 550 kB
Pss_Anon:            264 kB
Pss_File:            282 kB
Shared_Clean:       1816 kB
Shared_Dirty:          0 kB
Private_Clean:         8 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       678Mi        15Gi        26Mi       111Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15861472 kB
MemAvailable:   15737472 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18480  0.1 agent-leak-app-
      8 13316  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6164  0.0 systemd-journal
   3729  4356  0.0 bash
   5297  4288  0.0 bash
   5319  4148  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:12 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:25 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2092 VmHWM_kB=2128
PROCESS_RSS_MB=2.04
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2092 kB
Pss:                 550 kB
Pss_Anon:            264 kB
Pss_File:            282 kB
Shared_Clean:       1816 kB
Shared_Dirty:          0 kB
Private_Clean:         8 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       662Mi        15Gi        26Mi       111Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15878484 kB
MemAvailable:   15754488 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18480  0.1 agent-leak-app-
      8 13316  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6164  0.0 systemd-journal
   3729  4356  0.0 bash
   5358  4284  0.0 bash
   5380  4148  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:16 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:28 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2092 VmHWM_kB=2128
PROCESS_RSS_MB=2.04
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2092 kB
Pss:                 550 kB
Pss_Anon:            264 kB
Pss_File:            282 kB
Shared_Clean:       1816 kB
Shared_Dirty:          0 kB
Private_Clean:         8 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       654Mi        15Gi        26Mi       111Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15886144 kB
MemAvailable:   15762152 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18480  0.1 agent-leak-app-
      8 13316  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6164  0.0 systemd-journal
   3729  4356  0.0 bash
   5419  4184  0.0 bash
   5441  4140  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:19 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2092   2908       01:32 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2092 VmHWM_kB=2128
PROCESS_RSS_MB=2.04
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2092 kB
Pss:                 550 kB
Pss_Anon:            264 kB
Pss_File:            282 kB
Shared_Clean:       1816 kB
Shared_Dirty:          0 kB
Private_Clean:         8 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       661Mi        15Gi        26Mi       111Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15879208 kB
MemAvailable:   15755216 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18480  0.1 agent-leak-app-
      8 13316  0.0 orbstack-agent:
      1  7932  0.0 systemd
    122  6164  0.0 systemd-journal
   3729  4356  0.0 bash
   5480  4260  0.0 bash
   5502  4180  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:22 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:35 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 508 kB
Pss_Anon:            264 kB
Pss_File:            240 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       652Mi        15Gi        26Mi        92Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15898268 kB
MemAvailable:   15764596 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  7520  0.0 systemd
   3729  4356  0.0 bash
   5541  4188  0.0 bash
   5563  4160  0.0 ps
    122  3608  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:25 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:38 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 508 kB
Pss_Anon:            264 kB
Pss_File:            240 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       652Mi        15Gi        26Mi        92Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15897708 kB
MemAvailable:   15764100 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  7520  0.0 systemd
   3729  4356  0.0 bash
   5602  4280  0.0 bash
   5624  4128  0.0 ps
    122  3608  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:29 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:41 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 508 kB
Pss_Anon:            264 kB
Pss_File:            240 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       645Mi        15Gi        26Mi        93Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15904132 kB
MemAvailable:   15771052 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  7520  0.0 systemd
   3729  4356  0.0 bash
   5663  4240  0.0 bash
   5685  4140  0.0 ps
    122  3608  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:32 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:45 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 508 kB
Pss_Anon:            264 kB
Pss_File:            240 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       652Mi        15Gi        26Mi        93Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15897000 kB
MemAvailable:   15763924 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  7520  0.0 systemd
   3729  4356  0.0 bash
   5724  4248  0.0 bash
   5746  4172  0.0 ps
    122  3608  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:35 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:48 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 509 kB
Pss_Anon:            264 kB
Pss_File:            241 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       657Mi        15Gi        26Mi        93Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15892048 kB
MemAvailable:   15758972 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  7520  0.0 systemd
   3729  4356  0.0 bash
   5785  4248  0.0 bash
   5807  4136  0.0 ps
    122  3608  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:38 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:51 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 508 kB
Pss_Anon:            264 kB
Pss_File:            240 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       649Mi        15Gi        26Mi        93Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15900328 kB
MemAvailable:   15767252 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  7520  0.0 systemd
   3729  4356  0.0 bash
   5846  4232  0.0 bash
   5868  4152  0.0 ps
    122  3608  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:42 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:54 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 508 kB
Pss_Anon:            264 kB
Pss_File:            240 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       654Mi        15Gi        26Mi        93Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15894908 kB
MemAvailable:   15761836 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  7520  0.0 systemd
   3729  4356  0.0 bash
   5907  4284  0.0 bash
   5929  4132  0.0 ps
    122  3608  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:45 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       01:58 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 508 kB
Pss_Anon:            264 kB
Pss_File:            240 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       663Mi        15Gi        26Mi        93Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15886476 kB
MemAvailable:   15753408 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  7520  0.0 systemd
   3729  4356  0.0 bash
   5968  4312  0.0 bash
   5990  4168  0.0 ps
    122  3608  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:48 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:01 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 508 kB
Pss_Anon:            264 kB
Pss_File:            240 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       674Mi        15Gi        26Mi       112Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15864772 kB
MemAvailable:   15741664 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  7520  0.0 systemd
   3729  4356  0.0 bash
   6029  4300  0.0 bash
   6051  4152  0.0 ps
    122  3608  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:52 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:04 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 508 kB
Pss_Anon:            264 kB
Pss_File:            240 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       654Mi        15Gi        26Mi       113Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15884560 kB
MemAvailable:   15761828 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  7520  0.0 systemd
   3729  4356  0.0 bash
   6090  4256  0.0 bash
   6112  4148  0.0 ps
    122  3668  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:55 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:08 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 508 kB
Pss_Anon:            264 kB
Pss_File:            240 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       664Mi        15Gi        26Mi       113Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15874900 kB
MemAvailable:   15752196 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  7520  0.0 systemd
   3729  4356  0.0 bash
   6151  4212  0.0 bash
   6173  4148  0.0 ps
    122  3668  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:29:58 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:11 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 508 kB
Pss_Anon:            264 kB
Pss_File:            240 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       660Mi        15Gi        26Mi       113Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15878572 kB
MemAvailable:   15755916 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  7520  0.0 systemd
   3729  4356  0.0 bash
   6212  4196  0.0 bash
   6234  4148  0.0 ps
    122  3668  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:01 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:14 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       652Mi        15Gi        26Mi       114Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15886764 kB
MemAvailable:   15764356 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  7520  0.0 systemd
   3729  4356  0.0 bash
   6274  4236  0.0 bash
    122  4180  0.0 systemd-journal
   6296  4148  0.0 ps
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:05 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:17 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       651Mi        15Gi        26Mi       107Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15890540 kB
MemAvailable:   15764848 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  6940  0.0 systemd
   3729  4352  0.0 bash
   6335  4300  0.0 bash
   6357  4176  0.0 ps
    122  4004  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:08 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:21 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       658Mi        15Gi        26Mi       107Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15883368 kB
MemAvailable:   15757704 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  6940  0.0 systemd
   3729  4352  0.0 bash
   6396  4308  0.0 bash
   6418  4156  0.0 ps
    122  4004  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:11 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:24 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       656Mi        15Gi        26Mi       107Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15886240 kB
MemAvailable:   15760580 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  6940  0.0 systemd
   3729  4352  0.0 bash
   6457  4256  0.0 bash
   6479  4160  0.0 ps
    122  4004  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:14 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:27 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       648Mi        15Gi        26Mi       107Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15896404 kB
MemAvailable:   15770740 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  6940  0.0 systemd
   3729  4352  0.0 bash
   6518  4256  0.0 bash
   6540  4160  0.0 ps
    122  4004  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:18 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:30 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       654Mi        15Gi        26Mi       107Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15888220 kB
MemAvailable:   15762560 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  6940  0.0 systemd
   3729  4352  0.0 bash
   6579  4284  0.0 bash
   6601  4172  0.0 ps
    122  4004  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:21 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:34 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       661Mi        15Gi        26Mi       107Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15881216 kB
MemAvailable:   15755556 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  6940  0.0 systemd
   3729  4352  0.0 bash
   6640  4280  0.0 bash
   6662  4148  0.0 ps
    122  4004  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:24 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:37 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       660Mi        15Gi        26Mi       107Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15884228 kB
MemAvailable:   15758572 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  6940  0.0 systemd
   3729  4352  0.0 bash
   6701  4308  0.0 bash
   6723  4140  0.0 ps
    122  4004  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:27 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:40 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       650Mi        15Gi        26Mi       107Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15891836 kB
MemAvailable:   15766180 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  6940  0.0 systemd
   3729  4352  0.0 bash
   6762  4252  0.0 bash
   6784  4172  0.0 ps
    122  4004  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:31 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:43 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       657Mi        15Gi        26Mi       107Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15884768 kB
MemAvailable:   15759204 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  6940  0.0 systemd
   3729  4352  0.0 bash
   6823  4232  0.0 bash
   6845  4124  0.0 ps
    122  4004  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:34 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:47 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       655Mi        15Gi        26Mi       108Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15886888 kB
MemAvailable:   15761348 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  6940  0.0 systemd
   3729  4352  0.0 bash
   6884  4264  0.0 bash
   6906  4144  0.0 ps
    122  4004  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:37 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:50 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       651Mi        15Gi        26Mi       108Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15890804 kB
MemAvailable:   15765268 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  6940  0.0 systemd
   3729  4352  0.0 bash
   6945  4264  0.0 bash
   6967  4148  0.0 ps
    122  4004  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:41 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:53 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       656Mi        15Gi        26Mi       108Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15885384 kB
MemAvailable:   15759848 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  6940  0.0 systemd
   3729  4352  0.0 bash
   7006  4256  0.0 bash
   7028  4140  0.0 ps
    122  4004  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:44 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       02:57 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       656Mi        15Gi        26Mi       108Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15885504 kB
MemAvailable:   15759972 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  6940  0.0 systemd
   3729  4352  0.0 bash
   7067  4268  0.0 bash
   7089  4128  0.0 ps
    122  4004  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========

========== OOM SNAPSHOT 2026-11-15 06:30:47 ==========
CONFIGURED_MEMORY_LIMIT_MB=512
PROCESS_STATUS: PID 3743 is present
----- Process information (ps) -----
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED WCHAN                    COMMAND         COMMAND
   3743    3729 S+    0.0  0.0  2016   2908       03:00 do_wait                  agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- Process memory from /proc/3743/status -----
NAME=agent-leak-app- STATE=S VmPeak_kB=2908 VmSize_kB=2908 VmRSS_kB=2016 VmHWM_kB=2128
PROCESS_RSS_MB=1.97
RSS_VS_CONFIGURED_LIMIT_ESTIMATE=0.4%
----- Detailed memory from smaps_rollup -----
Rss:                2016 kB
Pss:                 502 kB
Pss_Anon:            264 kB
Pss_File:            234 kB
Shared_Clean:       1748 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:       268 kB
----- System memory (free -h) -----
               total        used        free      shared  buff/cache   available
Mem:            15Gi       660Mi        15Gi        26Mi       108Mi        15Gi
Swap:           16Gi          0B        16Gi
----- System memory (/proc/meminfo) -----
MemTotal:       16432436 kB
MemFree:        15881232 kB
MemAvailable:   15755712 kB
SwapTotal:      17481004 kB
SwapFree:       17481004 kB
----- Top RSS processes -----
    PID   RSS %MEM COMMAND
   3750 18412  0.1 agent-leak-app-
      8 10680  0.0 orbstack-agent:
      1  6940  0.0 systemd
   3729  4352  0.0 bash
   7119  4292  0.0 bash
   7141  4176  0.0 ps
    122  4004  0.0 systemd-journal
----- MemoryGuard / termination log evidence -----
----- Last application log lines -----
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-1] LOCK ACQUIRED: [Shared_Memory_A]. (Holding...)
2026-11-15 06:27:54,429 [INFO] [AgentWorker][Worker-Thread-2] Process Started. Attempting to lock [Socket_Pool_B]...
2026-11-15 06:27:54,429 [INFO] [AgentWorker] Waiting for worker threads to complete transactions...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-1] Processing critical data in Memory A...
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] LOCK ACQUIRED: [Socket_Pool_B]. (Holding...)
2026-11-15 06:27:54,430 [INFO] [AgentWorker][Worker-Thread-2] Establishing network connections in Pool B...
2026-11-15 06:27:56,443 [INFO] [AgentWorker][Worker-Thread-2] Need resource [Shared_Memory_A] to write logs.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] Need resource [Socket_Pool_B] to finish job.
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-1] WAITING for [Socket_Pool_B]... (Status: BLOCKED)
2026-11-15 06:27:56,444 [INFO] [AgentWorker][Worker-Thread-2] WAITING for [Shared_Memory_A]... (Status: BLOCKED)
========== END OOM SNAPSHOT ==========
