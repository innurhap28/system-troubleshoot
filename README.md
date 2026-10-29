# 리눅스 프로세스 및 시스템 리소스 트러블슈팅

`agent-leak-app-x86`를 Linux VM에서 실행해 OOM, CPU 과점유, Deadlock 증거를 수집하고 결과를 이슈 형식의 보고서로 정리하는 과제

## 관제 스크립트

이전 시스템 자동화 과제의 `monitor.sh`를 바탕으로 이번 앱의 프로세스별 증거 수집에 맞게 조정했습니다. 실행 중인 `agent-leak-app`의 PID, CPU 사용률, RSS 메모리, 생존 시간, 15034 포트 상태를 한 줄씩 기록합니다. 앱이 종료된 상태도 기록하므로 OOM/Watchdog 종료 시점을 관측할 수 있습니다.

```bash
chmod +x monitor.sh
AGENT_LOG_DIR="$HOME/agent-app/logs" ./monitor.sh
```

VM에서 과제용 일반 사용자로 앱을 실행한 뒤 반복 호출하거나 cron에 등록해 사용합니다. `AGENT_LOG_DIR`를 지정하지 않으면 로그는 `$HOME/agent-app/logs/monitor.log`에 저장되며, 10 MiB 단위로 최대 10개 파일까지 순환 보관합니다.
