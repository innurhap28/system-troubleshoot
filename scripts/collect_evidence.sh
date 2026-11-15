
#!/usr/bin/env bash
set -euo pipefail

# 사용법: ./collect_evidence.sh {oom|cpu|deadlock} {baseline|adjusted}

CASE="${1:-}"
PROFILE="${2:-}"

EVIDENCE_ROOT="${EVIDENCE_ROOT:-$HOME/agent-app/evidence}"
DOCS_DIR="${DOCS_DIR:-projects/system-troubleshooting-mission/docs}"

[[ "$CASE" =~ ^(oom|cpu|deadlock)$ ]] || {
    echo "Usage: $0 {oom|cpu|deadlock} {baseline|adjusted}"
    exit 1
}

[[ "$PROFILE" =~ ^(baseline|adjusted)$ ]] || {
    echo "Profile must be baseline or adjusted"
    exit 1
}

CASE_DIR="$EVIDENCE_ROOT/$CASE"

[[ -d "$CASE_DIR" ]] || {
    echo "Evidence directory not found: $CASE_DIR"
    exit 1
}

# 해당 케이스에서 가장 최근 실행된 증거 디렉터리 탐색
RUN_DIR="$(
    find "$CASE_DIR" -mindepth 1 -maxdepth 1 \
        -type d -name "*_${PROFILE}_*" |
    sort |
    tail -n 1
)"

[[ -n "$RUN_DIR" ]] || {
    echo "No evidence found for $CASE / $PROFILE"
    exit 1
}

mkdir -p "$DOCS_DIR"

# 케이스별 증거 파일 목록
case "$CASE" in
    oom)
        FILES=(
            "app-logs/agent_app.log"
            "application-stdout.log"
            "oom-diagnostics.log"
            "oom-diagnostics.csv"
            "monitor-snapshots.log"
            "process-snapshots.log"
            "run-summary.txt"
            "config.env"
        )
        ;;
    cpu)
        FILES=(
            "app-logs/agent_app.log"
            "application-stdout.log"
            "cpu-process.log"
            "cpu-process.csv"
            "monitor-snapshots.log"
            "process-snapshots.log"
            "run-summary.txt"
            "config.env"
        )
        ;;
    deadlock)
        FILES=(
            "app-logs/agent_app.log"
            "application-stdout.log"
            "deadlock-diagnostics.log"
            "deadlock-diagnostics.csv"
            "deadlock-diagnostics.state"
            "monitor-snapshots.log"
            "process-snapshots.log"
            "run-summary.txt"
            "config.env"
        )
        ;;
esac

echo "================================"
echo "Case: $CASE"
echo "Profile: $PROFILE"
echo "Source: $RUN_DIR"
echo "================================"

COPIED=0

for FILE in "${FILES[@]}"; do
    SRC="$RUN_DIR/$FILE"

    if [[ -f "$SRC" ]]; then
        NAME="$(basename "$FILE")"
        DEST="$DOCS_DIR/${CASE}_${PROFILE}_${NAME}"

        cp "$SRC" "$DEST"
        echo "[COPY] $NAME"
        ((COPIED+=1))
    else
        echo "[SKIP] $FILE (not found)"
    fi
done

echo "================================"
echo "Completed: $COPIED files copied."
echo "Destination: $DOCS_DIR"

