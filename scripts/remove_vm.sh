
#!/usr/bin/env bash
set -euo pipefail

VM_NAME=""

usage() {
    echo "사용법: $0 -n <VM_NAME>"
    echo "       $0 --name <VM_NAME>"
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -n|--name)
            if [[ -z "${2:-}" ]]; then
                echo "오류: VM 이름을 입력하세요." >&2
                usage
                exit 1
            fi
            VM_NAME="$2"
            shift 2
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            echo "오류: 알 수 없는 옵션입니다: $1" >&2
            usage
            exit 1
            ;;
    esac
done

if [[ -z "$VM_NAME" ]]; then
    echo "오류: VM 이름을 지정해야 합니다." >&2
    usage
    exit 1
fi

if ! command -v orb >/dev/null 2>&1; then
    echo "오류: OrbStack 명령어(orb)를 찾을 수 없습니다." >&2
    exit 1
fi

if ! orb list -q | grep -Fxq "$VM_NAME"; then
    echo "삭제할 가상머신이 없습니다: $VM_NAME"
    exit 0
fi

echo "삭제 대상: $VM_NAME"
read -r -p "정말 삭제하시겠습니까? [y/N] " answer

if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
    echo "삭제를 취소했습니다."
    exit 0
fi

orb stop "$VM_NAME" 2>/dev/null || true
orb delete "$VM_NAME"

echo "가상머신 삭제 완료: $VM_NAME"

