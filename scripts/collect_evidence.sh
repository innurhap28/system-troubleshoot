
#!/bin/bash
set -euo pipefail

CASE="${1:-}"
PROFILE="${2:-}"

EVIDENCE_ROOT="${EVIDENCE_ROOT:-$HOME/agent-app/evidence}"
DOCS_DIR="${DOCS_DIR:-projects/system-troubleshooting-mission/docs}"

if [[ ! "$CASE" =~ ^(oom|cpu|deadlock)$ ]]; then
    echo "Usage: $0 {oom|cpu|deadlock} {baseline|adjusted}"
    exit 1
fi

if [[ ! "$PROFILE" =~ ^(baseline|adjusted)$ ]]; then
    echo "Profile must be baseline or adjusted"
    exit 1
fi

CASE_DIR="$EVIDENCE_ROOT/$CASE"

if [[ "$PROFILE" == "baseline" ]]; then
    TARGET_DIR="$DOCS_DIR/$CASE-before"
else
    TARGET_DIR="$DOCS_DIR/$CASE-after"
fi

# 가장 최근 실행 디렉터리 탐색
RUN_DIR=$(find "$CASE_DIR" -mindepth 1 -maxdepth 1 -type d \
    -name "*_${PROFILE}_*" | sort | tail -n 1)

if [[ -z "$RUN_DIR" ]]; then
    echo "No evidence directory found for $CASE / $PROFILE"
    exit 1
fi

mkdir -p "$TARGET_DIR"

copy_file() {
    local source="$1"

    if [[ -f "$RUN_DIR/$source" ]]; then
        cp "$RUN_DIR/$source" "$TARGET_DIR/"
        echo "Copied: $source"
    else
        echo "Skipped (not found): $source"
    fi
}

copy_file "app-logs/agent_app.log"
copy_file "application-stdout.log"
copy_file "monitor-snapshots.log"
copy_file "process-snapshots.log"
copy_file "run-summary.txt"
copy_file "config.env"

case "$CASE" in
    oom)
        copy_file "oom-diagnostics.log"
        copy_file "oom-diagnostics.csv"
        ;;
    cpu)
        copy_file "cpu-process.log"
        copy_file "cpu-process.csv"
        ;;
    deadlock)
        copy_file "deadlock-diagnostics.log"
        copy_file "deadlock-diagnostics.csv"
        ;;
esac

echo ""
echo "Evidence collection complete!"
echo "Source: $RUN_DIR"
echo "Target: $TARGET_DIR"
