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
   ... MEMORY_LIMIT=512MB, CPU_MAX_OCCUPY=50%, MULTI_THREAD_ENABLE=False
------------------------------------------------------------
All Boot Checks Passed!
Agent READY
2026-11-10 01:00:02,143 [INFO] [SafetyGuard] Process priority lowered (nice=10).
2026-11-10 01:00:02,144 [INFO] Agent listening at port 15034

==================================================
 [ Agent Initiate ] Resource Check 
==================================================
 [ MEMORY ] Limit: 512MB 		[ OK ]
 [ CPU    ] Limit: 50%  		[ OK ]
 [ THREAD ] Concurrency: False 		[ OK ]
--------------------------------------------------
 >>> SYSTEM STATUS: STABLE. STARTING WORKLOAD MONITORING...
==================================================

2026-11-10 01:00:04,156 [INFO] >>> Scenario Selected: [Healthy System Monitoring]

>>> [SYSTEM] ALL CONFIGURATIONS OPTIMAL. RUNNING STABILITY TEST... <<<

2026-11-10 01:00:04,157 [INFO] [Scheduler] Task Scheduler Initialized.
2026-11-10 01:00:04,157 [INFO] [Scheduler] Registered Tasks: ['Thread-A', 'Thread-B', 'Thread-C']
2026-11-10 01:00:04,157 [INFO] [Scheduler] Starting task execution...
2026-11-10 01:00:04,157 [INFO] [Thread-A] Task Started. Calculating... (20%)
2026-11-10 01:00:04,209 [INFO] [Thread-A] Calculating... (40%)
2026-11-10 01:00:04,261 [INFO] [Thread-A] Calculating... (60%)
2026-11-10 01:00:04,313 [INFO] [Thread-A] Calculating... (80%)
2026-11-10 01:00:04,364 [INFO] [Thread-A] Task Completed. (100%)
2026-11-10 01:00:04,416 [INFO] [Thread-B] Task Started. Calculating... (20%)
2026-11-10 01:00:04,468 [INFO] [Thread-B] Calculating... (40%)
2026-11-10 01:00:04,520 [INFO] [Thread-B] Calculating... (60%)
2026-11-10 01:00:04,571 [INFO] [Thread-B] Calculating... (80%)
2026-11-10 01:00:04,622 [INFO] [Thread-B] Task Completed. (100%)
2026-11-10 01:00:04,674 [INFO] [Thread-C] Task Started. Calculating... (20%)
2026-11-10 01:00:04,725 [INFO] [Thread-C] Calculating... (40%)
2026-11-10 01:00:04,777 [INFO] [Thread-C] Calculating... (60%)
2026-11-10 01:00:04,829 [INFO] [Thread-C] Calculating... (80%)
2026-11-10 01:00:04,880 [INFO] [Thread-C] Task Completed. (100%)
2026-11-10 01:00:04,932 [INFO] [Scheduler] All tasks completed.
2026-11-10 01:00:04,960 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-10 01:00:04,960 [INFO] [CpuWorker] Started. Maximum CPU Limit: 50%
2026-11-10 01:00:04,960 [INFO] [CpuWorker] Current Load: 5.00%
2026-11-10 01:00:08,006 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-10 01:00:08,080 [INFO] [CpuWorker] Current Load: 11.21%
2026-11-10 01:00:11,053 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-10 01:00:11,201 [INFO] [CpuWorker] Current Load: 18.42%
2026-11-10 01:00:14,099 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-10 01:00:14,320 [INFO] [CpuWorker] Current Load: 20.29%
2026-11-10 01:00:17,143 [INFO] [MemoryWorker] Current Heap: 125MB
2026-11-10 01:00:17,439 [INFO] [CpuWorker] Current Load: 26.52%
2026-11-10 01:00:20,188 [INFO] [MemoryWorker] Current Heap: 150MB
2026-11-10 01:00:20,560 [INFO] [CpuWorker] Current Load: 29.68%
2026-11-10 01:00:23,232 [INFO] [MemoryWorker] Current Heap: 175MB
2026-11-10 01:00:23,681 [INFO] [CpuWorker] Current Load: 37.78%
2026-11-10 01:00:26,276 [INFO] [MemoryWorker] Current Heap: 200MB
2026-11-10 01:00:26,802 [INFO] [CpuWorker] Current Load: 41.81%
2026-11-10 01:00:29,321 [INFO] [MemoryWorker] Current Heap: 225MB
2026-11-10 01:00:29,921 [INFO] [CpuWorker] Current Load: 44.23%
2026-11-10 01:00:32,035 [INFO] [CpuWorker] Peak reached (50.00%). Starting cooldown...
2026-11-10 01:00:32,366 [INFO] [MemoryWorker] Current Heap: 250MB
2026-11-10 01:00:33,041 [INFO] [CpuWorker] Current Load: 50.00%
2026-11-10 01:00:35,410 [INFO] [MemoryWorker] Current Heap: 275MB
2026-11-10 01:00:36,161 [INFO] [CpuWorker] Current Load: 46.45%
2026-11-10 01:00:38,453 [INFO] [MemoryWorker] Current Heap: 300MB
2026-11-10 01:00:39,281 [INFO] [CpuWorker] Current Load: 36.50%
2026-11-10 01:00:41,494 [INFO] [MemoryWorker] Current Heap: 325MB
2026-11-10 01:00:42,400 [INFO] [CpuWorker] Current Load: 34.43%
2026-11-10 01:00:44,538 [INFO] [MemoryWorker] Current Heap: 350MB
2026-11-10 01:00:45,546 [INFO] [CpuWorker] Current Load: 33.42%
2026-11-10 01:00:47,587 [INFO] [MemoryWorker] Current Heap: 375MB
2026-11-10 01:00:48,669 [INFO] [CpuWorker] Current Load: 26.36%
2026-11-10 01:00:50,631 [INFO] [MemoryWorker] Current Heap: 400MB
2026-11-10 01:00:51,791 [INFO] [CpuWorker] Current Load: 19.83%
2026-11-10 01:00:53,678 [INFO] [MemoryWorker] Current Heap: 425MB
2026-11-10 01:00:54,913 [INFO] [CpuWorker] Current Load: 12.92%
2026-11-10 01:00:56,725 [INFO] [MemoryWorker] Current Heap: 450MB
2026-11-10 01:00:58,034 [INFO] [CpuWorker] Current Load: 6.55%
2026-11-10 01:00:59,771 [INFO] [MemoryWorker] Current Heap: 475MB
2026-11-10 01:01:00,150 [INFO] [CpuWorker] Cooldown complete (5.00%). Resuming load increase...
2026-11-10 01:01:01,157 [INFO] [CpuWorker] Current Load: 5.00%
2026-11-10 01:01:02,811 [INFO] [MemoryWorker] Current Heap: 500MB
2026-11-10 01:01:04,277 [INFO] [CpuWorker] Current Load: 13.21%
2026-11-10 01:01:05,848 [INFO] [MemoryWorker] Current Heap: 525MB
2026-11-10 01:01:05,849 [WARNING] [MemoryWorker] Memory Usage Reached Limit (525MB). Starting cleanup...
2026-11-10 01:01:05,856 [INFO] [System] Memory Cache Flushed. Process Stabilized.

>>> [SYSTEM] MEMORY RECOVERED (Cache Cleared) <<<

2026-11-10 01:01:07,396 [INFO] [CpuWorker] Current Load: 16.32%
2026-11-10 01:01:10,519 [INFO] [CpuWorker] Current Load: 23.84%
2026-11-10 01:01:10,890 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-10 01:01:13,638 [INFO] [CpuWorker] Current Load: 25.80%
2026-11-10 01:01:13,910 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-10 01:01:16,760 [INFO] [CpuWorker] Current Load: 26.28%
2026-11-10 01:01:16,953 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-10 01:01:19,880 [INFO] [CpuWorker] Current Load: 29.41%
2026-11-10 01:01:19,999 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-10 01:01:23,019 [INFO] [CpuWorker] Current Load: 37.25%
2026-11-10 01:01:23,054 [INFO] [MemoryWorker] Current Heap: 125MB
2026-11-10 01:01:26,102 [INFO] [MemoryWorker] Current Heap: 150MB
2026-11-10 01:01:26,140 [INFO] [CpuWorker] Current Load: 47.10%
2026-11-10 01:01:29,148 [INFO] [MemoryWorker] Current Heap: 175MB
2026-11-10 01:01:29,259 [INFO] [CpuWorker] Current Load: 48.38%
2026-11-10 01:01:31,372 [INFO] [CpuWorker] Peak reached (50.00%). Starting cooldown...
2026-11-10 01:01:32,193 [INFO] [MemoryWorker] Current Heap: 200MB
2026-11-10 01:01:32,379 [INFO] [CpuWorker] Current Load: 50.00%
2026-11-10 01:01:35,237 [INFO] [MemoryWorker] Current Heap: 225MB
2026-11-10 01:01:35,498 [INFO] [CpuWorker] Current Load: 48.82%
2026-11-10 01:01:38,281 [INFO] [MemoryWorker] Current Heap: 250MB
2026-11-10 01:01:38,616 [INFO] [CpuWorker] Current Load: 47.07%
2026-11-10 01:01:41,326 [INFO] [MemoryWorker] Current Heap: 275MB
2026-11-10 01:01:41,737 [INFO] [CpuWorker] Current Load: 37.19%
2026-11-10 01:01:44,367 [INFO] [MemoryWorker] Current Heap: 300MB
2026-11-10 01:01:44,858 [INFO] [CpuWorker] Current Load: 27.35%
2026-11-10 01:01:47,411 [INFO] [MemoryWorker] Current Heap: 325MB
2026-11-10 01:01:47,979 [INFO] [CpuWorker] Current Load: 23.22%
2026-11-10 01:01:50,451 [INFO] [MemoryWorker] Current Heap: 350MB
2026-11-10 01:01:51,097 [INFO] [CpuWorker] Current Load: 21.95%
2026-11-10 01:01:53,495 [INFO] [MemoryWorker] Current Heap: 375MB
2026-11-10 01:01:54,216 [INFO] [CpuWorker] Current Load: 18.70%
2026-11-10 01:01:56,540 [INFO] [MemoryWorker] Current Heap: 400MB
2026-11-10 01:01:57,336 [INFO] [CpuWorker] Current Load: 18.45%
2026-11-10 01:01:59,585 [INFO] [MemoryWorker] Current Heap: 425MB
2026-11-10 01:02:00,456 [INFO] [CpuWorker] Current Load: 14.41%
2026-11-10 01:02:02,626 [INFO] [MemoryWorker] Current Heap: 450MB
2026-11-10 01:02:03,574 [INFO] [CpuWorker] Current Load: 5.40%
2026-11-10 01:02:05,670 [INFO] [MemoryWorker] Current Heap: 475MB
2026-11-10 01:02:05,687 [INFO] [CpuWorker] Cooldown complete (5.00%). Resuming load increase...
2026-11-10 01:02:06,693 [INFO] [CpuWorker] Current Load: 5.00%
2026-11-10 01:02:08,718 [INFO] [MemoryWorker] Current Heap: 500MB
2026-11-10 01:02:09,814 [INFO] [CpuWorker] Current Load: 9.23%
2026-11-10 01:02:11,766 [INFO] [MemoryWorker] Current Heap: 525MB
2026-11-10 01:02:11,766 [WARNING] [MemoryWorker] Memory Usage Reached Limit (525MB). Starting cleanup...
2026-11-10 01:02:11,773 [INFO] [System] Memory Cache Flushed. Process Stabilized.

>>> [SYSTEM] MEMORY RECOVERED (Cache Cleared) <<<

2026-11-10 01:02:12,936 [INFO] [CpuWorker] Current Load: 13.85%
2026-11-10 01:02:16,058 [INFO] [CpuWorker] Current Load: 14.39%
2026-11-10 01:02:16,804 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-10 01:02:19,180 [INFO] [CpuWorker] Current Load: 20.63%
2026-11-10 01:02:19,823 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-10 01:02:22,301 [INFO] [CpuWorker] Current Load: 23.59%
2026-11-10 01:02:22,846 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-10 01:02:25,423 [INFO] [CpuWorker] Current Load: 33.09%
2026-11-10 01:02:25,890 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-10 01:02:28,543 [INFO] [CpuWorker] Current Load: 38.34%
2026-11-10 01:02:28,935 [INFO] [MemoryWorker] Current Heap: 125MB
2026-11-10 01:02:31,665 [INFO] [CpuWorker] Current Load: 39.84%
2026-11-10 01:02:31,979 [INFO] [MemoryWorker] Current Heap: 150MB
2026-11-10 01:02:34,786 [INFO] [CpuWorker] Current Load: 43.40%
2026-11-10 01:02:35,021 [INFO] [MemoryWorker] Current Heap: 175MB
2026-11-10 01:02:37,909 [INFO] [CpuWorker] Current Load: 44.47%
2026-11-10 01:02:38,064 [INFO] [MemoryWorker] Current Heap: 200MB
2026-11-10 01:02:41,030 [INFO] [CpuWorker] Current Load: 49.87%
2026-11-10 01:02:41,114 [INFO] [MemoryWorker] Current Heap: 225MB
2026-11-10 01:02:43,145 [INFO] [CpuWorker] Peak reached (50.00%). Starting cooldown...
2026-11-10 01:02:44,167 [INFO] [MemoryWorker] Current Heap: 250MB
2026-11-10 01:02:44,167 [INFO] [CpuWorker] Current Load: 50.00%
2026-11-10 01:02:47,213 [INFO] [MemoryWorker] Current Heap: 275MB
2026-11-10 01:02:47,289 [INFO] [CpuWorker] Current Load: 47.18%
2026-11-10 01:02:50,260 [INFO] [MemoryWorker] Current Heap: 300MB
2026-11-10 01:02:50,410 [INFO] [CpuWorker] Current Load: 44.23%
2026-11-10 01:02:53,306 [INFO] [MemoryWorker] Current Heap: 325MB
2026-11-10 01:02:53,530 [INFO] [CpuWorker] Current Load: 40.14%
2026-11-10 01:02:56,352 [INFO] [MemoryWorker] Current Heap: 350MB
2026-11-10 01:02:56,650 [INFO] [CpuWorker] Current Load: 31.52%
2026-11-10 01:02:59,396 [INFO] [MemoryWorker] Current Heap: 375MB
2026-11-10 01:02:59,770 [INFO] [CpuWorker] Current Load: 23.71%
2026-11-10 01:03:02,440 [INFO] [MemoryWorker] Current Heap: 400MB
2026-11-10 01:03:02,888 [INFO] [CpuWorker] Current Load: 22.67%
2026-11-10 01:03:05,483 [INFO] [MemoryWorker] Current Heap: 425MB
2026-11-10 01:03:06,008 [INFO] [CpuWorker] Current Load: 17.57%
2026-11-10 01:03:08,526 [INFO] [MemoryWorker] Current Heap: 450MB
2026-11-10 01:03:09,129 [INFO] [CpuWorker] Current Load: 15.47%
2026-11-10 01:03:11,571 [INFO] [MemoryWorker] Current Heap: 475MB
2026-11-10 01:03:12,249 [INFO] [CpuWorker] Current Load: 10.19%
2026-11-10 01:03:14,363 [INFO] [CpuWorker] Cooldown complete (5.00%). Resuming load increase...
2026-11-10 01:03:14,615 [INFO] [MemoryWorker] Current Heap: 500MB
2026-11-10 01:03:15,369 [INFO] [CpuWorker] Current Load: 5.00%
2026-11-10 01:03:17,659 [INFO] [MemoryWorker] Current Heap: 525MB
2026-11-10 01:03:17,659 [WARNING] [MemoryWorker] Memory Usage Reached Limit (525MB). Starting cleanup...
2026-11-10 01:03:17,666 [INFO] [System] Memory Cache Flushed. Process Stabilized.

>>> [SYSTEM] MEMORY RECOVERED (Cache Cleared) <<<

2026-11-10 01:03:18,490 [INFO] [CpuWorker] Current Load: 13.48%
2026-11-10 01:03:21,609 [INFO] [CpuWorker] Current Load: 22.43%
2026-11-10 01:03:22,698 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-10 01:03:24,728 [INFO] [CpuWorker] Current Load: 24.14%
2026-11-10 01:03:25,718 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-10 01:03:27,847 [INFO] [CpuWorker] Current Load: 28.76%
2026-11-10 01:03:28,761 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-10 01:03:30,966 [INFO] [CpuWorker] Current Load: 30.97%
2026-11-10 01:03:31,805 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-10 01:03:34,089 [INFO] [CpuWorker] Current Load: 31.32%
2026-11-10 01:03:34,850 [INFO] [MemoryWorker] Current Heap: 125MB
2026-11-10 01:03:37,211 [INFO] [CpuWorker] Current Load: 36.45%
2026-11-10 01:03:37,894 [INFO] [MemoryWorker] Current Heap: 150MB
2026-11-10 01:03:40,331 [INFO] [CpuWorker] Current Load: 42.76%
2026-11-10 01:03:40,938 [INFO] [MemoryWorker] Current Heap: 175MB
2026-11-10 01:03:43,452 [INFO] [CpuWorker] Current Load: 44.12%
2026-11-10 01:03:43,983 [INFO] [MemoryWorker] Current Heap: 200MB
2026-11-10 01:03:46,573 [INFO] [CpuWorker] Current Load: 46.85%
2026-11-10 01:03:47,026 [INFO] [MemoryWorker] Current Heap: 225MB
2026-11-10 01:03:48,688 [INFO] [CpuWorker] Peak reached (50.00%). Starting cooldown...
2026-11-10 01:03:49,695 [INFO] [CpuWorker] Current Load: 50.00%
2026-11-10 01:03:50,069 [INFO] [MemoryWorker] Current Heap: 250MB
2026-11-10 01:03:52,817 [INFO] [CpuWorker] Current Load: 46.53%
2026-11-10 01:03:53,113 [INFO] [MemoryWorker] Current Heap: 275MB
2026-11-10 01:03:55,936 [INFO] [CpuWorker] Current Load: 42.13%
2026-11-10 01:03:56,157 [INFO] [MemoryWorker] Current Heap: 300MB
2026-11-10 01:03:59,056 [INFO] [CpuWorker] Current Load: 34.28%
2026-11-10 01:03:59,200 [INFO] [MemoryWorker] Current Heap: 325MB
2026-11-10 01:04:02,179 [INFO] [CpuWorker] Current Load: 30.21%
2026-11-10 01:04:02,244 [INFO] [MemoryWorker] Current Heap: 350MB
2026-11-10 01:04:05,282 [INFO] [MemoryWorker] Current Heap: 375MB
2026-11-10 01:04:05,299 [INFO] [CpuWorker] Current Load: 26.11%
2026-11-10 01:04:08,328 [INFO] [MemoryWorker] Current Heap: 400MB
2026-11-10 01:04:08,420 [INFO] [CpuWorker] Current Load: 20.93%
2026-11-10 01:04:11,373 [INFO] [MemoryWorker] Current Heap: 425MB
2026-11-10 01:04:11,540 [INFO] [CpuWorker] Current Load: 13.59%
2026-11-10 01:04:14,418 [INFO] [MemoryWorker] Current Heap: 450MB
2026-11-10 01:04:14,661 [INFO] [CpuWorker] Current Load: 12.50%
2026-11-10 01:04:17,459 [INFO] [MemoryWorker] Current Heap: 475MB
2026-11-10 01:04:17,782 [INFO] [CpuWorker] Current Load: 8.17%
2026-11-10 01:04:20,503 [INFO] [MemoryWorker] Current Heap: 500MB
2026-11-10 01:04:20,900 [INFO] [CpuWorker] Current Load: 5.16%
2026-11-10 01:04:23,014 [INFO] [CpuWorker] Cooldown complete (5.00%). Resuming load increase...
2026-11-10 01:04:23,547 [INFO] [MemoryWorker] Current Heap: 525MB
2026-11-10 01:04:23,547 [WARNING] [MemoryWorker] Memory Usage Reached Limit (525MB). Starting cleanup...
2026-11-10 01:04:23,554 [INFO] [System] Memory Cache Flushed. Process Stabilized.

>>> [SYSTEM] MEMORY RECOVERED (Cache Cleared) <<<

2026-11-10 01:04:24,021 [INFO] [CpuWorker] Current Load: 5.00%
2026-11-10 01:04:27,142 [INFO] [CpuWorker] Current Load: 9.55%
2026-11-10 01:04:28,583 [INFO] [MemoryWorker] Current Heap: 25MB
2026-11-10 01:04:30,263 [INFO] [CpuWorker] Current Load: 11.54%
2026-11-10 01:04:31,602 [INFO] [MemoryWorker] Current Heap: 50MB
2026-11-10 01:04:33,383 [INFO] [CpuWorker] Current Load: 12.21%
2026-11-10 01:04:34,627 [INFO] [MemoryWorker] Current Heap: 75MB
2026-11-10 01:04:36,503 [INFO] [CpuWorker] Current Load: 16.91%
2026-11-10 01:04:37,671 [INFO] [MemoryWorker] Current Heap: 100MB
2026-11-10 01:04:39,623 [INFO] [CpuWorker] Current Load: 22.79%
2026-11-10 01:04:40,712 [INFO] [MemoryWorker] Current Heap: 125MB
2026-11-10 01:04:42,743 [INFO] [CpuWorker] Current Load: 24.08%
2026-11-10 01:04:43,758 [INFO] [MemoryWorker] Current Heap: 150MB
2026-11-10 01:04:45,863 [INFO] [CpuWorker] Current Load: 26.62%
2026-11-10 01:04:46,804 [INFO] [MemoryWorker] Current Heap: 175MB
2026-11-10 01:04:48,982 [INFO] [CpuWorker] Current Load: 30.66%
2026-11-10 01:04:49,850 [INFO] [MemoryWorker] Current Heap: 200MB
2026-11-10 01:04:52,103 [INFO] [CpuWorker] Current Load: 39.88%
2026-11-10 01:04:52,894 [INFO] [MemoryWorker] Current Heap: 225MB
2026-11-10 01:04:55,222 [INFO] [CpuWorker] Current Load: 48.45%
2026-11-10 01:04:55,937 [INFO] [MemoryWorker] Current Heap: 250MB
2026-11-10 01:04:57,336 [INFO] [CpuWorker] Peak reached (50.00%). Starting cooldown...
2026-11-10 01:04:58,344 [INFO] [CpuWorker] Current Load: 50.00%
2026-11-10 01:04:58,979 [INFO] [MemoryWorker] Current Heap: 275MB
2026-11-10 01:05:01,467 [INFO] [CpuWorker] Current Load: 46.49%
2026-11-10 01:05:02,024 [INFO] [MemoryWorker] Current Heap: 300MB
===== 2026-11-10 01:00:02 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+   30.4  0.0  2196   2908       00:00 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SN+  26.6  0.1 18528  28688       00:00  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+   30.4 agent-leak-app-
   3301    3301 SN+  26.6 agent-leak-app-
----- 스레드별 top -----
top - 01:00:02 up 1 day, 10 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   2 total,   0 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15506.4 free,    651.1 used,    134.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15396.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10   28688  18528   9964 S   0.0   0.1   0:00.04 agent-l+

===== 2026-11-10 01:00:05 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    2.0  0.0  2196   2908       00:03 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  2.3  0.2 44428 202780       00:03  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    2.0 agent-leak-app-
   3301    3301 SNl+  1.4 agent-leak-app-
   3301    3338 SNl+  3.5 agent-leak-app-
   3301    3339 SNl+  0.0 agent-leak-app-
----- 스레드별 top -----
top - 01:00:05 up 1 day, 10 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15475.7 free,    680.7 used,    135.4 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15366.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  202780  44428  10028 S   0.0   0.3   0:00.05 agent-l+
   3338 innuend+  30  10  202780  44428  10028 S   0.0   0.3   0:00.02 agent-l+
   3339 innuend+  30  10  202780  44428  10028 S   0.0   0.3   0:00.00 agent-l+

===== 2026-11-10 01:00:08 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    1.0  0.0  2196   2908       00:06 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.8  0.4 70032 228384       00:06  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    1.0 agent-leak-app-
   3301    3301 SNl+  0.7 agent-leak-app-
   3301    3338 SNl+  1.3 agent-leak-app-
   3301    3339 SNl+  0.2 agent-leak-app-
----- 스레드별 top -----
top - 01:00:08 up 1 day, 10 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15446.3 free,    710.1 used,    135.4 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15337.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  228384  70032  10028 S   0.0   0.4   0:00.05 agent-l+
   3338 innuend+  30  10  228384  70032  10028 S   0.0   0.4   0:00.05 agent-l+
   3339 innuend+  30  10  228384  70032  10028 S   0.0   0.4   0:00.01 agent-l+

===== 2026-11-10 01:00:11 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.7  0.0  2196   2908       00:09 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  0.5 95636 253988       00:09  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.7 agent-leak-app-
   3301    3301 SNl+  0.5 agent-leak-app-
   3301    3338 SNl+  0.9 agent-leak-app-
   3301    3339 SNl+  0.4 agent-leak-app-
----- 스레드별 top -----
top - 01:00:12 up 1 day, 10 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15418.3 free,    738.1 used,    135.4 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15309.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  253988  95636  10028 S   0.0   0.6   0:00.05 agent-l+
   3338 innuend+  30  10  253988  95636  10028 S   0.0   0.6   0:00.07 agent-l+
   3339 innuend+  30  10  253988  95636  10028 S   0.0   0.6   0:00.03 agent-l+

===== 2026-11-10 01:00:15 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.5  0.0  2196   2908       00:13 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.5  0.7 121240 279592      00:13  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.5 agent-leak-app-
   3301    3301 SNl+  0.3 agent-leak-app-
   3301    3338 SNl+  0.9 agent-leak-app-
   3301    3339 SNl+  0.4 agent-leak-app-
----- 스레드별 top -----
top - 01:00:15 up 1 day, 10 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15397.6 free,    758.8 used,    135.4 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15288.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  279592 121240  10028 S   0.0   0.7   0:00.05 agent-l+
   3338 innuend+  30  10  279592 121240  10028 S   0.0   0.7   0:00.10 agent-l+
   3339 innuend+  30  10  279592 121240  10028 S   0.0   0.7   0:00.05 agent-l+

===== 2026-11-10 01:00:18 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.4  0.0  2196   2908       00:16 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.8 146844 305196      00:16  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.4 agent-leak-app-
   3301    3301 SNl+  0.3 agent-leak-app-
   3301    3338 SNl+  0.9 agent-leak-app-
   3301    3339 SNl+  0.5 agent-leak-app-
----- 스레드별 top -----
top - 01:00:18 up 1 day, 10 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15391.9 free,    773.0 used,    118.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15274.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  305196 146844  10028 S   0.0   0.9   0:00.05 agent-l+
   3338 innuend+  30  10  305196 146844  10028 S   0.0   0.9   0:00.13 agent-l+
   3339 innuend+  30  10  305196 146844  10028 S   0.0   0.9   0:00.08 agent-l+

===== 2026-11-10 01:00:21 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.3  0.0  2196   2908       00:19 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  1.0 172448 330800      00:19  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.3 agent-leak-app-
   3301    3301 SNl+  0.2 agent-leak-app-
   3301    3338 SNl+  0.9 agent-leak-app-
   3301    3339 SNl+  0.6 agent-leak-app-
----- 스레드별 top -----
top - 01:00:21 up 1 day, 10 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15361.5 free,    801.5 used,    122.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15245.8 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  330800 172448  10028 S   0.0   1.0   0:00.05 agent-l+
   3338 innuend+  30  10  330800 172448  10028 S   0.0   1.0   0:00.16 agent-l+
   3339 innuend+  30  10  330800 172448  10028 S   0.0   1.0   0:00.11 agent-l+

===== 2026-11-10 01:00:24 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.3  0.0  2196   2908       00:22 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.2 198052 356404      00:22  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.3 agent-leak-app-
   3301    3301 SNl+  0.2 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.7 agent-leak-app-
----- 스레드별 top -----
top - 01:00:25 up 1 day, 10 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15336.5 free,    826.4 used,    122.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15220.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  356404 198052  10028 S   0.0   1.2   0:00.05 agent-l+
   3338 innuend+  30  10  356404 198052  10028 S   0.0   1.2   0:00.18 agent-l+
   3339 innuend+  30  10  356404 198052  10028 S   0.0   1.2   0:00.15 agent-l+

===== 2026-11-10 01:00:28 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.2  0.0  2196   2908       00:26 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.3 223656 382008      00:26  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.2 agent-leak-app-
   3301    3301 SNl+  0.1 agent-leak-app-
   3301    3338 SNl+  0.9 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:00:28 up 1 day, 10 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15307.9 free,    855.1 used,    122.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15192.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  382008 223656  10028 S   0.0   1.4   0:00.05 agent-l+
   3338 innuend+  30  10  382008 223656  10028 S   0.0   1.4   0:00.21 agent-l+
   3339 innuend+  30  10  382008 223656  10028 S   0.0   1.4   0:00.19 agent-l+

===== 2026-11-10 01:00:31 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.2  0.0  2196   2908       00:29 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.8  1.5 249260 407612      00:29  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.2 agent-leak-app-
   3301    3301 SNl+  0.1 agent-leak-app-
   3301    3338 SNl+  0.9 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:00:31 up 1 day, 10 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15283.5 free,    879.5 used,    122.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15167.8 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  407612 249260  10028 S   0.0   1.5   0:00.05 agent-l+
   3338 innuend+  30  10  407612 249260  10028 S   0.0   1.5   0:00.24 agent-l+
   3339 innuend+  30  10  407612 249260  10028 S   0.0   1.5   0:00.24 agent-l+

===== 2026-11-10 01:00:34 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.2  0.0  2196   2908       00:32 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.9  1.6 274864 433216      00:32  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.2 agent-leak-app-
   3301    3301 SNl+  0.1 agent-leak-app-
   3301    3338 SNl+  0.9 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:00:34 up 1 day, 10 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15255.2 free,    907.7 used,    122.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15139.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  433216 274864  10028 S   0.0   1.7   0:00.05 agent-l+
   3338 innuend+  30  10  433216 274864  10028 S   0.0   1.7   0:00.27 agent-l+
   3339 innuend+  30  10  433216 274864  10028 S   0.0   1.7   0:00.29 agent-l+

===== 2026-11-10 01:00:37 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.1  0.0  2196   2908       00:35 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.9  1.8 300468 458820      00:35  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.1 agent-leak-app-
   3301    3301 SNl+  0.1 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  1.0 agent-leak-app-
----- 스레드별 top -----
top - 01:00:38 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.6 us,  0.0 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15235.2 free,    927.1 used,    123.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15120.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  458820 300468  10028 S   0.0   1.8   0:00.05 agent-l+
   3338 innuend+  30  10  458820 300468  10028 S   0.0   1.8   0:00.29 agent-l+
   3339 innuend+  30  10  458820 300468  10028 S   0.0   1.8   0:00.33 agent-l+

===== 2026-11-10 01:00:41 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.1  0.0  2196   2908       00:39 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.9  1.9 326072 484424      00:39  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.1 agent-leak-app-
   3301    3301 SNl+  0.1 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  1.0 agent-leak-app-
----- 스레드별 top -----
top - 01:00:41 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15212.9 free,    949.4 used,    123.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15098.0 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  484424 326072  10028 S   0.0   2.0   0:00.05 agent-l+
   3338 innuend+  30  10  484424 326072  10028 S   0.0   2.0   0:00.32 agent-l+
   3339 innuend+  30  10  484424 326072  10028 S   0.0   2.0   0:00.37 agent-l+

===== 2026-11-10 01:00:44 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.1  0.0  2196   2908       00:42 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.9  2.1 351676 510028      00:42  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.1 agent-leak-app-
   3301    3301 SNl+  0.1 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  1.0 agent-leak-app-
----- 스레드별 top -----
top - 01:00:44 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  1.8 sy,  0.0 ni, 98.2 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15160.7 free,   1001.6 used,    123.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15045.8 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  535632 377280  10028 S   0.0   2.3   0:00.05 agent-l+
   3338 innuend+  30  10  535632 377280  10028 S   0.0   2.3   0:00.37 agent-l+
   3339 innuend+  30  10  535632 377280  10028 S   0.0   2.3   0:00.41 agent-l+

===== 2026-11-10 01:00:47 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.1  0.0  2196   2908       00:45 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.9  2.4 402884 561236      00:45  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.1 agent-leak-app-
   3301    3301 SNl+  0.1 agent-leak-app-
   3301    3338 SNl+  0.9 agent-leak-app-
   3301    3339 SNl+  1.0 agent-leak-app-
----- 스레드별 top -----
top - 01:00:47 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15131.3 free,   1031.0 used,    123.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15016.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  561236 402884  10028 S   0.0   2.5   0:00.05 agent-l+
   3338 innuend+  30  10  561236 402884  10028 S   0.0   2.5   0:00.41 agent-l+
   3339 innuend+  30  10  561236 402884  10028 S   0.0   2.5   0:00.44 agent-l+

===== 2026-11-10 01:00:50 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.1  0.0  2196   2908       00:48 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.9  2.6 428488 586840      00:48  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.1 agent-leak-app-
   3301    3301 SNl+  0.1 agent-leak-app-
   3301    3338 SNl+  0.9 agent-leak-app-
   3301    3339 SNl+  1.0 agent-leak-app-
----- 스레드별 top -----
top - 01:00:51 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15103.1 free,   1059.2 used,    123.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14988.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  586840 428488  10028 S   0.0   2.6   0:00.05 agent-l+
   3338 innuend+  30  10  586840 428488  10028 S   0.0   2.6   0:00.43 agent-l+
   3339 innuend+  30  10  586840 428488  10028 S   0.0   2.6   0:00.47 agent-l+

===== 2026-11-10 01:00:54 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.1  0.0  2196   2908       00:52 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.9  2.7 454092 612444      00:52  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.1 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.9 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:00:54 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15075.2 free,   1087.1 used,    123.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14960.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  612444 454092  10028 S   0.0   2.8   0:00.05 agent-l+
   3338 innuend+  30  10  612444 454092  10028 S   0.0   2.8   0:00.46 agent-l+
   3339 innuend+  30  10  612444 454092  10028 S   0.0   2.8   0:00.49 agent-l+

===== 2026-11-10 01:00:57 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.1  0.0  2196   2908       00:55 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.8  2.9 479696 638048      00:55  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.1 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.9 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:00:57 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.6 us,  0.0 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15048.1 free,   1114.2 used,    123.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14933.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  638048 479696  10028 S   0.0   2.9   0:00.05 agent-l+
   3338 innuend+  30  10  638048 479696  10028 S   0.0   2.9   0:00.49 agent-l+
   3339 innuend+  30  10  638048 479696  10028 S   0.0   2.9   0:00.50 agent-l+

===== 2026-11-10 01:01:00 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.1  0.0  2196   2908       00:58 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.8  3.0 505300 663652      00:58  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.1 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.9 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:01:00 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15027.0 free,   1135.2 used,    123.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14912.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2196   1932 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  663652 505300  10028 S   0.0   3.1   0:00.05 agent-l+
   3338 innuend+  30  10  663652 505300  10028 S   0.0   3.1   0:00.51 agent-l+
   3339 innuend+  30  10  663652 505300  10028 S   0.0   3.1   0:00.51 agent-l+

===== 2026-11-10 01:01:03 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.1  0.0  2092   2908       01:01 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  3.2 530640 689256      01:01  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.1 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.9 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:01:04 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15016.2 free,   1152.7 used,    110.7 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14894.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  689256 530640   9764 S   0.0   3.2   0:00.05 agent-l+
   3338 innuend+  30  10  689256 530640   9764 S   0.0   3.2   0:00.54 agent-l+
   3339 innuend+  30  10  689256 530640   9764 S   0.0   3.2   0:00.51 agent-l+

===== 2026-11-10 01:01:07 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.1  0.0  2092   2908       01:05 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  0.1 18560 177176       01:05  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.1 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.9 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:01:07 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15511.5 free,    656.7 used,    111.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15390.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  177176  18560   9764 S   0.0   0.1   0:00.05 agent-l+
   3338 innuend+  30  10  177176  18560   9764 S   0.0   0.1   0:00.56 agent-l+
   3339 innuend+  30  10  177176  18560   9764 S   0.0   0.1   0:00.53 agent-l+

===== 2026-11-10 01:01:10 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.1  0.0  2092   2908       01:08 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  0.1 18560 177176       01:08  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.1 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:01:10 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15508.7 free,    659.5 used,    111.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15387.8 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3339 innuend+  30  10  177176  18560   9764 S  30.0   0.1   0:00.57 agent-l+
   3297 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  177176  18560   9764 S   0.0   0.1   0:00.05 agent-l+
   3338 innuend+  30  10  177176  18560   9764 S   0.0   0.1   0:00.56 agent-l+

===== 2026-11-10 01:01:13 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2092   2908       01:11 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.2 44152 177176       01:11  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 RNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:01:13 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  1.8 ni, 98.2 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15485.8 free,    682.4 used,    111.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15364.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  177176  44152   9764 S   0.0   0.3   0:00.05 agent-l+
   3338 innuend+  30  10  177176  44152   9764 S   0.0   0.3   0:00.57 agent-l+
   3339 innuend+  30  10  177176  44152   9764 S   0.0   0.3   0:00.60 agent-l+

===== 2026-11-10 01:01:16 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2092   2908       01:14 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.4 69752 177176       01:14  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:01:17 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  1.8 sy,  0.6 ni, 97.6 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15434.5 free,    733.7 used,    111.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15313.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  242712  95368   9764 S   0.0   0.6   0:00.05 agent-l+
   3338 innuend+  30  10  242712  95368   9764 S   0.0   0.6   0:00.60 agent-l+
   3339 innuend+  30  10  242712  95368   9764 S   0.0   0.6   0:00.62 agent-l+

===== 2026-11-10 01:01:20 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2092   2908       01:18 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  0.7 120956 242712      01:18  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:01:20 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15406.3 free,    761.9 used,    111.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15285.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  242712 120956   9764 S   0.0   0.7   0:00.05 agent-l+
   3338 innuend+  30  10  242712 120956   9764 S   0.0   0.7   0:00.63 agent-l+
   3339 innuend+  30  10  242712 120956   9764 S   0.0   0.7   0:00.65 agent-l+

===== 2026-11-10 01:01:23 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2092   2908       01:21 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.8 146572 308248      01:21  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:01:23 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15380.5 free,    787.7 used,    111.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15259.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  308248 146572   9764 S   0.0   0.9   0:00.05 agent-l+
   3338 innuend+  30  10  308248 146572   9764 S   0.0   0.9   0:00.66 agent-l+
   3339 innuend+  30  10  308248 146572   9764 S   0.0   0.9   0:00.67 agent-l+

===== 2026-11-10 01:01:26 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2092   2908       01:24 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.0 172160 308248      01:24  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:01:26 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15353.7 free,    814.5 used,    111.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15232.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  308248 172160   9764 S   0.0   1.0   0:00.05 agent-l+
   3338 innuend+  30  10  308248 172160   9764 S   0.0   1.0   0:00.68 agent-l+
   3339 innuend+  30  10  308248 172160   9764 S   0.0   1.0   0:00.71 agent-l+

===== 2026-11-10 01:01:29 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2092   2908       01:27 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.2 197776 373784      01:27  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:01:30 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15327.9 free,    840.3 used,    111.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15207.0 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  373784 197776   9764 S   0.0   1.2   0:00.05 agent-l+
   3338 innuend+  30  10  373784 197776   9764 S   0.0   1.2   0:00.71 agent-l+
   3339 innuend+  30  10  373784 197776   9764 S   0.0   1.2   0:00.76 agent-l+

===== 2026-11-10 01:01:33 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2092   2908       01:31 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.3 223364 373784      01:31  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:01:33 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15298.8 free,    869.4 used,    111.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15177.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  373784 223364   9764 S   0.0   1.4   0:00.05 agent-l+
   3338 innuend+  30  10  373784 223364   9764 S   0.0   1.4   0:00.73 agent-l+
   3339 innuend+  30  10  373784 223364   9764 S   0.0   1.4   0:00.81 agent-l+

===== 2026-11-10 01:01:36 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2092   2908       01:34 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.5 248980 439320      01:34  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:01:36 up 1 day, 11 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15277.6 free,    890.5 used,    112.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15156.8 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  439320 248980   9764 S   0.0   1.5   0:00.05 agent-l+
   3338 innuend+  30  10  439320 248980   9764 S   0.0   1.5   0:00.76 agent-l+
   3339 innuend+  30  10  439320 248980   9764 S   0.0   1.5   0:00.86 agent-l+

===== 2026-11-10 01:01:39 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2092   2908       01:37 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.8  1.6 274568 439320      01:37  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:01:39 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15259.3 free,    908.8 used,    112.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15138.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  439320 274568   9764 S   0.0   1.7   0:00.05 agent-l+
   3338 innuend+  30  10  439320 274568   9764 S   0.0   1.7   0:00.78 agent-l+
   3339 innuend+  30  10  439320 274568   9764 S   0.0   1.7   0:00.91 agent-l+

===== 2026-11-10 01:01:42 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2092   2908       01:40 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.8  1.8 300184 504856      01:40  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:01:43 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15237.3 free,    930.8 used,    112.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15116.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  504856 300184   9764 S   0.0   1.8   0:00.05 agent-l+
   3338 innuend+  30  10  504856 300184   9764 S   0.0   1.8   0:00.81 agent-l+
   3339 innuend+  30  10  504856 300184   9764 S   0.0   1.8   0:00.95 agent-l+

===== 2026-11-10 01:01:46 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2092   2908       01:44 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.8  1.9 325772 504856      01:43  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:01:46 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15210.0 free,    958.1 used,    112.0 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15089.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2092   1828 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  504856 325772   9764 S   0.0   2.0   0:00.05 agent-l+
   3338 innuend+  30  10  504856 325772   9764 S   0.0   2.0   0:00.84 agent-l+
   3339 innuend+  30  10  504856 325772   9764 S   0.0   2.0   0:00.98 agent-l+

===== 2026-11-10 01:01:49 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       01:47 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.1 351320 570392      01:47  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:01:49 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15217.7 free,    962.8 used,     87.1 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15084.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  570392 351320   9696 S   0.0   2.1   0:00.05 agent-l+
   3338 innuend+  30  10  570392 351320   9696 S   0.0   2.1   0:00.87 agent-l+
   3339 innuend+  30  10  570392 351320   9696 S   0.0   2.1   0:01.00 agent-l+

===== 2026-11-10 01:01:52 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       01:50 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.2 376908 570392      01:50  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:01:52 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15193.5 free,    987.0 used,     87.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15060.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  570392 376908   9696 S   0.0   2.3   0:00.05 agent-l+
   3338 innuend+  30  10  570392 376908   9696 S   0.0   2.3   0:00.89 agent-l+
   3339 innuend+  30  10  570392 376908   9696 S   0.0   2.3   0:01.02 agent-l+

===== 2026-11-10 01:01:55 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       01:53 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.4 402524 635928      01:53  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:01:56 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15166.3 free,   1014.0 used,     87.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15033.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  635928 402524   9696 S   0.0   2.4   0:00.05 agent-l+
   3338 innuend+  30  10  635928 402524   9696 S   0.0   2.4   0:00.92 agent-l+
   3339 innuend+  30  10  635928 402524   9696 S   0.0   2.4   0:01.04 agent-l+

===== 2026-11-10 01:01:59 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       01:57 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.6 428112 635928      01:56  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:01:59 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15145.7 free,   1034.7 used,     87.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15012.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  635928 428112   9696 S   0.0   2.6   0:00.05 agent-l+
   3338 innuend+  30  10  635928 428112   9696 S   0.0   2.6   0:00.94 agent-l+
   3339 innuend+  30  10  635928 428112   9696 S   0.0   2.6   0:01.06 agent-l+

===== 2026-11-10 01:02:02 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:00 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.7 453728 701464      02:00  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:02:02 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15117.4 free,   1063.0 used,     87.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14984.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  701464 453728   9696 S   0.0   2.8   0:00.05 agent-l+
   3338 innuend+  30  10  701464 453728   9696 S   0.0   2.8   0:00.98 agent-l+
   3339 innuend+  30  10  701464 453728   9696 S   0.0   2.8   0:01.08 agent-l+

===== 2026-11-10 01:02:05 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:03 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.9 479316 701464      02:03  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:02:05 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.6 ni, 98.8 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15084.8 free,   1095.5 used,     87.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14951.8 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3338 innuend+  30  10  767000 504932   9696 S  10.0   3.1   0:01.02 agent-l+
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  767000 504932   9696 S   0.0   3.1   0:00.05 agent-l+
   3339 innuend+  30  10  767000 504932   9696 S   0.0   3.1   0:01.08 agent-l+

===== 2026-11-10 01:02:08 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:06 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  3.2 530520 767000      02:06  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:02:08 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15039.9 free,   1140.4 used,     87.6 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14906.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  767000 530520   9696 S   0.0   3.2   0:00.05 agent-l+
   3338 innuend+  30  10  767000 530520   9696 S   0.0   3.2   0:01.05 agent-l+
   3339 innuend+  30  10  767000 530520   9696 S   0.0   3.2   0:01.09 agent-l+

===== 2026-11-10 01:02:12 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:10 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  0.4 69684 177176       02:09  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:02:12 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15501.6 free,    678.7 used,     87.6 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15368.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  177176  69684   9696 S   0.0   0.4   0:00.05 agent-l+
   3338 innuend+  30  10  177176  69684   9696 S   0.0   0.4   0:01.08 agent-l+
   3339 innuend+  30  10  177176  69684   9696 S   0.0   0.4   0:01.10 agent-l+

===== 2026-11-10 01:02:15 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:13 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.4 69684 177176       02:13  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:02:15 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15464.6 free,    704.1 used,    111.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15343.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  177176  69684   9696 S   0.0   0.4   0:00.05 agent-l+
   3338 innuend+  30  10  177176  69684   9696 S   0.0   0.4   0:01.08 agent-l+
   3339 innuend+  30  10  177176  69684   9696 S   0.0   0.4   0:01.11 agent-l+

===== 2026-11-10 01:02:18 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:16 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.4 69684 177176       02:16  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:02:18 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15463.5 free,    704.9 used,    111.6 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15342.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  177176  69684   9696 S   0.0   0.4   0:00.05 agent-l+
   3338 innuend+  30  10  177176  69684   9696 S   0.0   0.4   0:01.09 agent-l+
   3339 innuend+  30  10  177176  69684   9696 S   0.0   0.4   0:01.13 agent-l+

===== 2026-11-10 01:02:21 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:19 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.4 69684 177176       02:19  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:02:21 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15459.2 free,    709.2 used,    111.6 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15338.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  177176  69684   9696 S   0.0   0.4   0:00.05 agent-l+
   3338 innuend+  30  10  177176  69684   9696 S   0.0   0.4   0:01.09 agent-l+
   3339 innuend+  30  10  177176  69684   9696 S   0.0   0.4   0:01.15 agent-l+

===== 2026-11-10 01:02:25 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:22 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.5 95300 242712       02:22  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:02:25 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15434.2 free,    734.1 used,    111.6 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15313.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  242712  95300   9696 S   0.0   0.6   0:00.05 agent-l+
   3338 innuend+  30  10  242712  95300   9696 S   0.0   0.6   0:01.10 agent-l+
   3339 innuend+  30  10  242712  95300   9696 S   0.0   0.6   0:01.17 agent-l+

===== 2026-11-10 01:02:28 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:26 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.7 120888 242712      02:26  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:02:28 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15402.1 free,    764.3 used,    115.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15283.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  242712 120888   9696 S   0.0   0.7   0:00.05 agent-l+
   3338 innuend+  30  10  242712 120888   9696 S   0.0   0.7   0:01.12 agent-l+
   3339 innuend+  30  10  242712 120888   9696 S   0.0   0.7   0:01.21 agent-l+

===== 2026-11-10 01:02:31 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:29 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.8 146504 308248      02:29  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:02:31 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   1 running,   3 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15373.2 free,    793.2 used,    115.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15254.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3339 innuend+  30  10  308248 146504   9696 R  40.0   0.9   0:01.28 agent-l+
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  308248 146504   9696 S   0.0   0.9   0:00.05 agent-l+
   3338 innuend+  30  10  308248 146504   9696 S   0.0   0.9   0:01.15 agent-l+

===== 2026-11-10 01:02:34 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:32 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  1.0 172084 308248      02:32  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:02:34 up 1 day, 12 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  3.0 ni, 97.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15357.1 free,    810.6 used,    112.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15236.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  308248 172084   9688 S   0.0   1.0   0:00.05 agent-l+
   3338 innuend+  30  10  308248 172084   9688 S   0.0   1.0   0:01.18 agent-l+
   3339 innuend+  30  10  308248 172084   9688 S   0.0   1.0   0:01.33 agent-l+

===== 2026-11-10 01:02:37 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:35 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.2 197700 373784      02:35  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:02:38 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  1.8 sy,  0.0 ni, 98.2 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15299.4 free,    867.0 used,    115.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15180.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  373784 223288   9688 S   0.0   1.4   0:00.05 agent-l+
   3338 innuend+  30  10  373784 223288   9688 S   0.0   1.4   0:01.24 agent-l+
   3339 innuend+  30  10  373784 223288   9688 S   0.0   1.4   0:01.37 agent-l+

===== 2026-11-10 01:02:41 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:39 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.5 248904 439320      02:39  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:02:41 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15275.2 free,    891.2 used,    115.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15156.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  439320 248904   9688 S   0.0   1.5   0:00.05 agent-l+
   3338 innuend+  30  10  439320 248904   9688 S   0.0   1.5   0:01.27 agent-l+
   3339 innuend+  30  10  439320 248904   9688 S   0.0   1.5   0:01.42 agent-l+

===== 2026-11-10 01:02:44 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:42 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.6 274492 439320      02:42  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:02:44 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15257.3 free,    908.5 used,    116.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15138.8 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  439320 274492   9688 S   0.0   1.7   0:00.05 agent-l+
   3338 innuend+  30  10  439320 274492   9688 S   0.0   1.7   0:01.29 agent-l+
   3339 innuend+  30  10  439320 274492   9688 S   0.0   1.7   0:01.47 agent-l+

===== 2026-11-10 01:02:47 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:45 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.8 300108 504856      02:45  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:02:47 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15229.8 free,    935.9 used,    116.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15111.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  504856 300108   9688 S   0.0   1.8   0:00.05 agent-l+
   3338 innuend+  30  10  504856 300108   9688 S   0.0   1.8   0:01.32 agent-l+
   3339 innuend+  30  10  504856 300108   9688 S   0.0   1.8   0:01.52 agent-l+

===== 2026-11-10 01:02:50 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:48 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.9 325696 504856      02:48  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:02:51 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15204.0 free,    961.8 used,    116.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15085.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  504856 325696   9688 S   0.0   2.0   0:00.05 agent-l+
   3338 innuend+  30  10  504856 325696   9688 S   0.0   2.0   0:01.35 agent-l+
   3339 innuend+  30  10  504856 325696   9688 S   0.0   2.0   0:01.57 agent-l+

===== 2026-11-10 01:02:54 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:52 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.1 351312 570392      02:52  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:02:54 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15177.5 free,    988.2 used,    116.7 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15059.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  570392 351312   9688 S   0.0   2.1   0:00.05 agent-l+
   3338 innuend+  30  10  570392 351312   9688 S   0.0   2.1   0:01.37 agent-l+
   3339 innuend+  30  10  570392 351312   9688 S   0.0   2.1   0:01.61 agent-l+

===== 2026-11-10 01:02:57 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:55 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.2 376900 570392      02:55  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:02:57 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15153.8 free,   1011.9 used,    116.7 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15035.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  570392 376900   9688 S   0.0   2.3   0:00.05 agent-l+
   3338 innuend+  30  10  570392 376900   9688 S   0.0   2.3   0:01.40 agent-l+
   3339 innuend+  30  10  570392 376900   9688 S   0.0   2.3   0:01.64 agent-l+

===== 2026-11-10 01:03:00 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       02:58 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.4 402516 635928      02:58  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:03:00 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15125.7 free,   1040.1 used,    116.7 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15007.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  635928 402516   9688 S   0.0   2.4   0:00.05 agent-l+
   3338 innuend+  30  10  635928 402516   9688 S   0.0   2.4   0:01.43 agent-l+
   3339 innuend+  30  10  635928 402516   9688 S   0.0   2.4   0:01.66 agent-l+

===== 2026-11-10 01:03:03 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:01 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.6 428104 635928      03:01  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:03:04 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15100.0 free,   1065.8 used,    116.7 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14981.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  635928 428104   9688 S   0.0   2.6   0:00.05 agent-l+
   3338 innuend+  30  10  635928 428104   9688 S   0.0   2.6   0:01.45 agent-l+
   3339 innuend+  30  10  635928 428104   9688 S   0.0   2.6   0:01.69 agent-l+

===== 2026-11-10 01:03:07 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:05 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.7 453720 701464      03:05  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:03:07 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15074.4 free,   1091.3 used,    116.7 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14956.0 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  701464 453720   9688 S   0.0   2.8   0:00.05 agent-l+
   3338 innuend+  30  10  701464 453720   9688 S   0.0   2.8   0:01.48 agent-l+
   3339 innuend+  30  10  701464 453720   9688 S   0.0   2.8   0:01.71 agent-l+

===== 2026-11-10 01:03:10 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:08 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.9 479308 701464      03:08  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:03:10 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15056.7 free,   1109.1 used,    116.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14938.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  701464 479308   9688 S   0.0   2.9   0:00.05 agent-l+
   3338 innuend+  30  10  701464 479308   9688 S   0.0   2.9   0:01.50 agent-l+
   3339 innuend+  30  10  701464 479308   9688 S   0.0   2.9   0:01.72 agent-l+

===== 2026-11-10 01:03:13 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:11 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  3.0 504924 767000      03:11  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:03:13 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15024.8 free,   1140.9 used,    116.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14906.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  767000 504924   9688 S   0.0   3.1   0:00.05 agent-l+
   3338 innuend+  30  10  767000 504924   9688 S   0.0   3.1   0:01.53 agent-l+
   3339 innuend+  30  10  767000 504924   9688 S   0.0   3.1   0:01.73 agent-l+

===== 2026-11-10 01:03:16 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:14 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  3.2 530512 767000      03:14  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:03:17 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  14992.5 free,   1167.8 used,    127.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14879.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  767000 530512   9688 S   0.0   3.2   0:00.05 agent-l+
   3338 innuend+  30  10  767000 530512   9688 S   0.0   3.2   0:01.56 agent-l+
   3339 innuend+  30  10  767000 530512   9688 S   0.0   3.2   0:01.74 agent-l+

===== 2026-11-10 01:03:20 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:18 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  0.4 69676 177176       03:18  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:03:20 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15467.7 free,    705.9 used,    101.1 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15341.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:00.05 agent-l+
   3338 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:01.60 agent-l+
   3339 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:01.75 agent-l+

===== 2026-11-10 01:03:23 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:21 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  0.4 69676 177176       03:21  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:03:23 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15463.4 free,    710.1 used,    101.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15337.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:00.05 agent-l+
   3338 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:01.60 agent-l+
   3339 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:01.78 agent-l+

===== 2026-11-10 01:03:26 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:24 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.4 69676 177176       03:24  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:03:26 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15466.5 free,    707.0 used,    101.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15340.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:00.05 agent-l+
   3338 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:01.60 agent-l+
   3339 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:01.80 agent-l+

===== 2026-11-10 01:03:29 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:27 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.5 95292 242712       03:27  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:03:30 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15440.3 free,    733.2 used,    101.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15314.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  242712  95292   9688 S   0.0   0.6   0:00.05 agent-l+
   3338 innuend+  30  10  242712  95292   9688 S   0.0   0.6   0:01.62 agent-l+
   3339 innuend+  30  10  242712  95292   9688 S   0.0   0.6   0:01.83 agent-l+

===== 2026-11-10 01:03:33 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:31 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.7 120880 242712      03:31  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:03:33 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15410.8 free,    762.8 used,    101.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15284.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  242712 120880   9688 S   0.0   0.7   0:00.05 agent-l+
   3338 innuend+  30  10  242712 120880   9688 S   0.0   0.7   0:01.65 agent-l+
   3339 innuend+  30  10  242712 120880   9688 S   0.0   0.7   0:01.86 agent-l+

===== 2026-11-10 01:03:36 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:34 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.8 146496 308248      03:34  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:03:36 up 1 day, 13 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15382.8 free,    790.5 used,    101.7 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15256.8 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  308248 146496   9688 S   0.0   0.9   0:00.05 agent-l+
   3338 innuend+  30  10  308248 146496   9688 S   0.0   0.9   0:01.68 agent-l+
   3339 innuend+  30  10  308248 146496   9688 S   0.0   0.9   0:01.89 agent-l+

===== 2026-11-10 01:03:39 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:37 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.0 172084 308248      03:37  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:03:39 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15354.7 free,    818.6 used,    101.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15228.8 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  308248 172084   9688 S   0.0   1.0   0:00.05 agent-l+
   3338 innuend+  30  10  308248 172084   9688 S   0.0   1.0   0:01.70 agent-l+
   3339 innuend+  30  10  308248 172084   9688 S   0.0   1.0   0:01.93 agent-l+

===== 2026-11-10 01:03:42 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:40 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.2 197700 373784      03:40  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:03:43 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15326.9 free,    846.3 used,    101.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15201.0 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  373784 197700   9688 S   0.0   1.2   0:00.05 agent-l+
   3338 innuend+  30  10  373784 197700   9688 S   0.0   1.2   0:01.73 agent-l+
   3339 innuend+  30  10  373784 197700   9688 S   0.0   1.2   0:01.97 agent-l+

===== 2026-11-10 01:03:46 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:44 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.3 223288 373784      03:44  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:03:46 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15300.1 free,    873.1 used,    101.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15174.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  373784 223288   9688 S   0.0   1.4   0:00.05 agent-l+
   3338 innuend+  30  10  373784 223288   9688 S   0.0   1.4   0:01.77 agent-l+
   3339 innuend+  30  10  373784 223288   9688 S   0.0   1.4   0:02.02 agent-l+

===== 2026-11-10 01:03:49 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:47 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.5 248904 439320      03:47  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:03:49 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15277.6 free,    895.6 used,    101.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15151.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  439320 248904   9688 S   0.0   1.5   0:00.05 agent-l+
   3338 innuend+  30  10  439320 248904   9688 S   0.0   1.5   0:01.79 agent-l+
   3339 innuend+  30  10  439320 248904   9688 S   0.0   1.5   0:02.07 agent-l+

===== 2026-11-10 01:03:52 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:50 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.6 274492 439320      03:50  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:03:52 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   1 running,   3 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15262.4 free,    910.8 used,    101.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15136.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  439320 274492   9688 S   0.0   1.7   0:00.05 agent-l+
   3338 innuend+  30  10  439320 274492   9688 S   0.0   1.7   0:01.82 agent-l+
   3339 innuend+  30  10  439320 274492   9688 R   0.0   1.7   0:02.12 agent-l+

===== 2026-11-10 01:03:55 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:53 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.8 300108 504856      03:53  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:03:56 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  1.8 ni, 98.2 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15235.5 free,    937.7 used,    101.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15109.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3339 innuend+  30  10  504856 300108   9688 S  20.0   1.8   0:02.21 agent-l+
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  504856 300108   9688 S   0.0   1.8   0:00.05 agent-l+
   3338 innuend+  30  10  504856 300108   9688 S   0.0   1.8   0:01.85 agent-l+

===== 2026-11-10 01:03:59 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       03:57 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  1.9 325696 504856      03:57  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:03:59 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  1.8 sy,  0.0 ni, 98.2 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15182.0 free,    991.2 used,    101.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15056.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  570392 351312   9688 S   0.0   2.1   0:00.05 agent-l+
   3338 innuend+  30  10  570392 351312   9688 S   0.0   2.1   0:01.90 agent-l+
   3339 innuend+  30  10  570392 351312   9688 S   0.0   2.1   0:02.24 agent-l+

===== 2026-11-10 01:04:02 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:00 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.2 376900 570392      04:00  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:04:02 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15162.3 free,   1010.9 used,    101.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15036.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  570392 376900   9688 S   0.0   2.3   0:00.05 agent-l+
   3338 innuend+  30  10  570392 376900   9688 S   0.0   2.3   0:01.92 agent-l+
   3339 innuend+  30  10  570392 376900   9688 S   0.0   2.3   0:02.27 agent-l+

===== 2026-11-10 01:04:05 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:03 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.4 402516 635928      04:03  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:04:05 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15149.3 free,   1031.1 used,     87.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15016.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  635928 402516   9688 S   0.0   2.4   0:00.05 agent-l+
   3338 innuend+  30  10  635928 402516   9688 S   0.0   2.4   0:01.94 agent-l+
   3339 innuend+  30  10  635928 402516   9688 S   0.0   2.4   0:02.30 agent-l+

===== 2026-11-10 01:04:08 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:06 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.6 428104 635928      04:06  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:04:09 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15120.1 free,   1059.9 used,     88.2 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14987.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  635928 428104   9688 S   0.0   2.6   0:00.05 agent-l+
   3338 innuend+  30  10  635928 428104   9688 S   0.0   2.6   0:01.97 agent-l+
   3339 innuend+  30  10  635928 428104   9688 S   0.0   2.6   0:02.32 agent-l+

===== 2026-11-10 01:04:12 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:10 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.7 453720 701464      04:09  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:04:12 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15096.7 free,   1083.3 used,     88.3 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14964.0 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  701464 453720   9688 S   0.0   2.8   0:00.05 agent-l+
   3338 innuend+  30  10  701464 453720   9688 S   0.0   2.8   0:01.99 agent-l+
   3339 innuend+  30  10  701464 453720   9688 S   0.0   2.8   0:02.33 agent-l+

===== 2026-11-10 01:04:15 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:13 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  2.9 479308 701464      04:13  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:04:15 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15070.3 free,   1105.7 used,     96.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14941.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  701464 479308   9688 S   0.0   2.9   0:00.05 agent-l+
   3338 innuend+  30  10  701464 479308   9688 S   0.0   2.9   0:02.02 agent-l+
   3339 innuend+  30  10  701464 479308   9688 S   0.0   2.9   0:02.35 agent-l+

===== 2026-11-10 01:04:18 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:16 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  3.0 504924 767000      04:16  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:04:18 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15043.2 free,   1132.7 used,     96.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14914.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  767000 504924   9688 S   0.0   3.1   0:00.05 agent-l+
   3338 innuend+  30  10  767000 504924   9688 S   0.0   3.1   0:02.05 agent-l+
   3339 innuend+  30  10  767000 504924   9688 S   0.0   3.1   0:02.35 agent-l+

===== 2026-11-10 01:04:21 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:19 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  3.2 530512 767000      04:19  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:04:22 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15012.1 free,   1163.7 used,     96.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  14883.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  767000 530512   9688 S   0.0   3.2   0:00.05 agent-l+
   3338 innuend+  30  10  767000 530512   9688 S   0.0   3.2   0:02.07 agent-l+
   3339 innuend+  30  10  767000 530512   9688 S   0.0   3.2   0:02.36 agent-l+

===== 2026-11-10 01:04:25 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:23 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  0.4 69676 177176       04:22  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:04:25 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15465.0 free,    710.9 used,     96.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15336.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:00.05 agent-l+
   3338 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:02.11 agent-l+
   3339 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:02.37 agent-l+

===== 2026-11-10 01:04:28 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:26 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.7  0.4 69676 177176       04:26  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.8 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:04:28 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15474.9 free,    701.0 used,     96.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15346.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:00.05 agent-l+
   3338 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:02.11 agent-l+
   3339 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:02.38 agent-l+

===== 2026-11-10 01:04:31 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:29 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.4 69676 177176       04:29  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:04:31 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15468.2 free,    707.6 used,     96.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15339.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:00.05 agent-l+
   3338 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:02.11 agent-l+
   3339 innuend+  30  10  177176  69676   9688 S   0.0   0.4   0:02.39 agent-l+

===== 2026-11-10 01:04:34 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:32 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.5 95292 242712       04:32  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:04:35 up 1 day, 14 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15454.8 free,    721.1 used,     96.5 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15326.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  242712  95292   9688 S   0.0   0.6   0:00.05 agent-l+
   3338 innuend+  30  10  242712  95292   9688 S   0.0   0.6   0:02.12 agent-l+
   3339 innuend+  30  10  242712  95292   9688 S   0.0   0.6   0:02.40 agent-l+

===== 2026-11-10 01:04:38 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:36 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.7 120880 242712      04:35  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:04:38 up 1 day, 15 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.6 sy,  0.0 ni, 99.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15426.9 free,    746.3 used,    101.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15301.0 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  242712 120880   9688 S   0.0   0.7   0:00.05 agent-l+
   3338 innuend+  30  10  242712 120880   9688 S   0.0   0.7   0:02.15 agent-l+
   3339 innuend+  30  10  242712 120880   9688 S   0.0   0.7   0:02.42 agent-l+

===== 2026-11-10 01:04:41 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:39 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  0.8 146496 308248      04:39  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:04:41 up 1 day, 15 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15400.3 free,    772.9 used,    101.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15274.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  308248 146496   9688 S   0.0   0.9   0:00.05 agent-l+
   3338 innuend+  30  10  308248 146496   9688 S   0.0   0.9   0:02.17 agent-l+
   3339 innuend+  30  10  308248 146496   9688 S   0.0   0.9   0:02.44 agent-l+

===== 2026-11-10 01:04:44 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:42 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  1.0 172084 308248      04:42  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:04:44 up 1 day, 15 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15377.2 free,    796.0 used,    101.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15251.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  308248 172084   9688 S   0.0   1.0   0:00.05 agent-l+
   3338 innuend+  30  10  308248 172084   9688 S   0.0   1.0   0:02.20 agent-l+
   3339 innuend+  30  10  308248 172084   9688 S   0.0   1.0   0:02.47 agent-l+

===== 2026-11-10 01:04:47 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:45 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  1.2 197700 373784      04:45  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:04:47 up 1 day, 15 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15347.8 free,    825.4 used,    101.9 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15222.0 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  373784 197700   9688 S   0.0   1.2   0:00.05 agent-l+
   3338 innuend+  30  10  373784 197700   9688 S   0.0   1.2   0:02.23 agent-l+
   3339 innuend+  30  10  373784 197700   9688 S   0.0   1.2   0:02.49 agent-l+

===== 2026-11-10 01:04:51 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:49 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  1.3 223288 373784      04:48  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:04:51 up 1 day, 15 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15319.3 free,    855.0 used,     99.6 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15192.3 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  373784 223288   9688 S   0.0   1.4   0:00.05 agent-l+
   3338 innuend+  30  10  373784 223288   9688 S   0.0   1.4   0:02.26 agent-l+
   3339 innuend+  30  10  373784 223288   9688 S   0.0   1.4   0:02.53 agent-l+

===== 2026-11-10 01:04:54 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:52 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  1.5 248904 439320      04:52  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:04:54 up 1 day, 15 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15293.0 free,    881.2 used,     99.7 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15166.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  439320 248904   9688 S   0.0   1.5   0:00.05 agent-l+
   3338 innuend+  30  10  439320 248904   9688 S   0.0   1.5   0:02.29 agent-l+
   3339 innuend+  30  10  439320 248904   9688 S   0.0   1.5   0:02.57 agent-l+

===== 2026-11-10 01:04:57 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:55 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  1.6 274492 439320      04:55  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.8 agent-leak-app-
----- 스레드별 top -----
top - 01:04:57 up 1 day, 15 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15265.3 free,    908.9 used,     99.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15138.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  439320 274492   9688 S   0.0   1.7   0:00.05 agent-l+
   3338 innuend+  30  10  439320 274492   9688 S   0.0   1.7   0:02.31 agent-l+
   3339 innuend+  30  10  439320 274492   9688 S   0.0   1.7   0:02.62 agent-l+

===== 2026-11-10 01:05:00 프로세스 상태 =====
    PID    PPID STAT %CPU %MEM   RSS    VSZ     ELAPSED COMMAND         COMMAND
   3297    3295 S+    0.0  0.0  2016   2908       04:58 agent-leak-app- /home/innuendo3712/agent-app/bin/agent-leak-app-x86
   3301    3297 SNl+  1.6  1.8 300108 504856      04:58  \_ agent-leak-  \_ /home/innuendo3712/agent-app/bin/agent-leak-app-x86
----- 스레드 상태 -----
    PID     TID STAT %CPU COMMAND
   3297    3297 S+    0.0 agent-leak-app-
   3301    3301 SNl+  0.0 agent-leak-app-
   3301    3338 SNl+  0.7 agent-leak-app-
   3301    3339 SNl+  0.9 agent-leak-app-
----- 스레드별 top -----
top - 01:05:00 up 1 day, 15 min,  0 user,  load average: 0.00, 0.00, 0.00
Threads:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  16047.3 total,  15237.4 free,    936.8 used,     99.8 buff/cache     
MiB Swap:  17071.3 total,  17071.3 free,      0.0 used.  15110.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   3297 innuend+  20   0    2908   2016   1752 S   0.0   0.0   0:00.07 agent-l+
   3301 innuend+  30  10  504856 300108   9688 S   0.0   1.8   0:00.05 agent-l+
   3338 innuend+  30  10  504856 300108   9688 S   0.0   1.8   0:02.34 agent-l+
   3339 innuend+  30  10  504856 300108   9688 S   0.0   1.8   0:02.67 agent-l+

[2026-11-10 01:00:02] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:10.5% 상주메모리:18.1MB 실행시간:00:00 포트:15034/열림
[2026-11-10 01:00:05] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:2.2% 상주메모리:43.4MB 실행시간:00:03 포트:15034/열림
[2026-11-10 01:00:08] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:68.4MB 실행시간:00:06 포트:15034/열림
[2026-11-10 01:00:12] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:93.4MB 실행시간:00:10 포트:15034/열림
[2026-11-10 01:00:15] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.5% 상주메모리:118.4MB 실행시간:00:13 포트:15034/열림
[2026-11-10 01:00:18] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:143.4MB 실행시간:00:16 포트:15034/열림
[2026-11-10 01:00:21] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:168.4MB 실행시간:00:19 포트:15034/열림
[2026-11-10 01:00:25] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:193.4MB 실행시간:00:23 포트:15034/열림
[2026-11-10 01:00:28] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:218.4MB 실행시간:00:26 포트:15034/열림
[2026-11-10 01:00:31] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.8% 상주메모리:243.4MB 실행시간:00:29 포트:15034/열림
[2026-11-10 01:00:34] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.8% 상주메모리:268.4MB 실행시간:00:32 포트:15034/열림
[2026-11-10 01:00:38] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.9% 상주메모리:293.4MB 실행시간:00:36 포트:15034/열림
[2026-11-10 01:00:41] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.9% 상주메모리:318.4MB 실행시간:00:39 포트:15034/열림
[2026-11-10 01:00:44] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.9% 상주메모리:368.4MB 실행시간:00:42 포트:15034/열림
[2026-11-10 01:00:47] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.9% 상주메모리:393.4MB 실행시간:00:45 포트:15034/열림
[2026-11-10 01:00:51] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.9% 상주메모리:418.4MB 실행시간:00:49 포트:15034/열림
[2026-11-10 01:00:54] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.9% 상주메모리:443.4MB 실행시간:00:52 포트:15034/열림
[2026-11-10 01:00:57] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.8% 상주메모리:468.5MB 실행시간:00:55 포트:15034/열림
[2026-11-10 01:01:00] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.8% 상주메모리:493.5MB 실행시간:00:58 포트:15034/열림
[2026-11-10 01:01:04] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:518.2MB 실행시간:01:02 포트:15034/열림
[2026-11-10 01:01:07] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:18.1MB 실행시간:01:05 포트:15034/열림
[2026-11-10 01:01:10] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:18.1MB 실행시간:01:08 포트:15034/열림
[2026-11-10 01:01:13] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:43.1MB 실행시간:01:11 포트:15034/열림
[2026-11-10 01:01:17] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:93.1MB 실행시간:01:15 포트:15034/열림
[2026-11-10 01:01:20] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:118.1MB 실행시간:01:18 포트:15034/열림
[2026-11-10 01:01:23] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:143.1MB 실행시간:01:21 포트:15034/열림
[2026-11-10 01:01:26] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:168.1MB 실행시간:01:24 포트:15034/열림
[2026-11-10 01:01:30] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:193.1MB 실행시간:01:27 포트:15034/열림
[2026-11-10 01:01:33] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:218.1MB 실행시간:01:31 포트:15034/열림
[2026-11-10 01:01:36] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:243.1MB 실행시간:01:34 포트:15034/열림
[2026-11-10 01:01:39] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.8% 상주메모리:268.1MB 실행시간:01:37 포트:15034/열림
[2026-11-10 01:01:43] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.8% 상주메모리:293.1MB 실행시간:01:40 포트:15034/열림
[2026-11-10 01:01:46] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.8% 상주메모리:318.1MB 실행시간:01:44 포트:15034/열림
[2026-11-10 01:01:49] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:343.1MB 실행시간:01:47 포트:15034/열림
[2026-11-10 01:01:52] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:368.1MB 실행시간:01:50 포트:15034/열림
[2026-11-10 01:01:56] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:393.1MB 실행시간:01:53 포트:15034/열림
[2026-11-10 01:01:59] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:418.1MB 실행시간:01:57 포트:15034/열림
[2026-11-10 01:02:02] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:443.1MB 실행시간:02:00 포트:15034/열림
[2026-11-10 01:02:05] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:493.1MB 실행시간:02:03 포트:15034/열림
[2026-11-10 01:02:09] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:518.1MB 실행시간:02:06 포트:15034/열림
[2026-11-10 01:02:12] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:68.1MB 실행시간:02:10 포트:15034/열림
[2026-11-10 01:02:15] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:68.1MB 실행시간:02:13 포트:15034/열림
[2026-11-10 01:02:18] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:68.1MB 실행시간:02:16 포트:15034/열림
[2026-11-10 01:02:21] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:68.1MB 실행시간:02:19 포트:15034/열림
[2026-11-10 01:02:25] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:93.1MB 실행시간:02:23 포트:15034/열림
[2026-11-10 01:02:28] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:118.1MB 실행시간:02:26 포트:15034/열림
[2026-11-10 01:02:31] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:143.1MB 실행시간:02:29 포트:15034/열림
[2026-11-10 01:02:34] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:168.1MB 실행시간:02:32 포트:15034/열림
[2026-11-10 01:02:38] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:218.1MB 실행시간:02:36 포트:15034/열림
[2026-11-10 01:02:41] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:243.1MB 실행시간:02:39 포트:15034/열림
[2026-11-10 01:02:44] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:268.1MB 실행시간:02:42 포트:15034/열림
[2026-11-10 01:02:47] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:293.1MB 실행시간:02:45 포트:15034/열림
[2026-11-10 01:02:51] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:318.1MB 실행시간:02:49 포트:15034/열림
[2026-11-10 01:02:54] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:343.1MB 실행시간:02:52 포트:15034/열림
[2026-11-10 01:02:57] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:368.1MB 실행시간:02:55 포트:15034/열림
[2026-11-10 01:03:00] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:393.1MB 실행시간:02:58 포트:15034/열림
[2026-11-10 01:03:04] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:418.1MB 실행시간:03:02 포트:15034/열림
[2026-11-10 01:03:07] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:443.1MB 실행시간:03:05 포트:15034/열림
[2026-11-10 01:03:10] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:468.1MB 실행시간:03:08 포트:15034/열림
[2026-11-10 01:03:13] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:493.1MB 실행시간:03:11 포트:15034/열림
[2026-11-10 01:03:17] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:518.1MB 실행시간:03:15 포트:15034/열림
[2026-11-10 01:03:20] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:68.0MB 실행시간:03:18 포트:15034/열림
[2026-11-10 01:03:23] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:68.0MB 실행시간:03:21 포트:15034/열림
[2026-11-10 01:03:26] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:68.0MB 실행시간:03:24 포트:15034/열림
[2026-11-10 01:03:30] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:93.1MB 실행시간:03:28 포트:15034/열림
[2026-11-10 01:03:33] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:118.0MB 실행시간:03:31 포트:15034/열림
[2026-11-10 01:03:36] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:143.1MB 실행시간:03:34 포트:15034/열림
[2026-11-10 01:03:39] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:168.1MB 실행시간:03:37 포트:15034/열림
[2026-11-10 01:03:43] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:193.1MB 실행시간:03:41 포트:15034/열림
[2026-11-10 01:03:46] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:218.1MB 실행시간:03:44 포트:15034/열림
[2026-11-10 01:03:49] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:243.1MB 실행시간:03:47 포트:15034/열림
[2026-11-10 01:03:52] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:268.1MB 실행시간:03:50 포트:15034/열림
[2026-11-10 01:03:56] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:293.1MB 실행시간:03:53 포트:15034/열림
[2026-11-10 01:03:59] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:343.1MB 실행시간:03:57 포트:15034/열림
[2026-11-10 01:04:02] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:368.1MB 실행시간:04:00 포트:15034/열림
[2026-11-10 01:04:05] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:393.1MB 실행시간:04:03 포트:15034/열림
[2026-11-10 01:04:09] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:418.1MB 실행시간:04:06 포트:15034/열림
[2026-11-10 01:04:12] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:443.1MB 실행시간:04:10 포트:15034/열림
[2026-11-10 01:04:15] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:468.1MB 실행시간:04:13 포트:15034/열림
[2026-11-10 01:04:18] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:493.1MB 실행시간:04:16 포트:15034/열림
[2026-11-10 01:04:22] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:518.1MB 실행시간:04:19 포트:15034/열림
[2026-11-10 01:04:25] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:68.0MB 실행시간:04:23 포트:15034/열림
[2026-11-10 01:04:28] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.7% 상주메모리:68.0MB 실행시간:04:26 포트:15034/열림
[2026-11-10 01:04:31] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:68.0MB 실행시간:04:29 포트:15034/열림
[2026-11-10 01:04:35] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:93.1MB 실행시간:04:32 포트:15034/열림
[2026-11-10 01:04:38] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:118.0MB 실행시간:04:36 포트:15034/열림
[2026-11-10 01:04:41] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:143.1MB 실행시간:04:39 포트:15034/열림
[2026-11-10 01:04:44] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:168.1MB 실행시간:04:42 포트:15034/열림
[2026-11-10 01:04:47] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:193.1MB 실행시간:04:45 포트:15034/열림
[2026-11-10 01:04:51] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:218.1MB 실행시간:04:49 포트:15034/열림
[2026-11-10 01:04:54] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:243.1MB 실행시간:04:52 포트:15034/열림
[2026-11-10 01:04:57] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:268.1MB 실행시간:04:55 포트:15034/열림
[2026-11-10 01:05:00] 프로세스:agent-leak-app PID:3301 부모PID:3297 CPU:1.6% 상주메모리:293.1MB 실행시간:04:58 포트:15034/열림
[2026-11-10 01:05:06] 프로세스:agent-leak-app 상태:종료 포트:15034/닫힘
3297
