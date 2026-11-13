#!/usr/bin/env bash
# 一键下载优先清单里的开源模型（Hugging Face）
# 用法：
#   bash scripts/download.sh                    # 下载 models-priority.txt 里的全部模型
#   bash scripts/download.sh Qwen/Qwen3.8-27B   # 只下载指定模型（可传多个）
#   bash scripts/download.sh --dry-run          # 只打印将要下载的清单，不实际下载
#
# 前置：
#   pip install -U "huggingface_hub[cli]"
#   # 想下载更快：
#   pip install hf_transfer
#   export HF_HUB_ENABLE_HF_TRANSFER=1
#
# 注意：
# - 下载前确认磁盘空间够（4-bit 量化版约为原大小的 1/4 到 1/3）。
# - Gated 模型需先在 Hugging Face 网页上点接受许可，否则会报 401。
# - 默认下载到 ./downloads/<模型名>/，可用 OUT_DIR 环境变量改位置。
set -euo pipefail

OUT_DIR="${OUT_DIR:-./downloads}"
LIST_FILE="$(dirname "$0")/../models-priority.txt"
DRY_RUN=0
MODELS=()

for arg in "$@"; do
  if [ "$arg" = "--dry-run" ]; then
    DRY_RUN=1
  else
    MODELS+=("$arg")
  fi
done

if [ "${#MODELS[@]}" -eq 0 ]; then
  # 从清单文件读，跳过空行和 # 注释
  mapfile -t MODELS < <(grep -v '^\s*#' "$LIST_FILE" | grep -v '^\s*$' || true)
fi

if [ "${#MODELS[@]}" -eq 0 ]; then
  echo "没有要下载的模型。请检查 $LIST_FILE 或直接传模型 ID。"
  exit 1
fi

echo "目标目录：$OUT_DIR"
echo "将要下载 ${#MODELS[@]} 个模型："
printf '  - %s\n' "${MODELS[@]}"
echo "磁盘剩余空间："
df -h "$OUT_DIR" 2>/dev/null || df -h .
echo

if [ "$DRY_RUN" -eq 1 ]; then
  echo "[dry-run] 未实际下载。"
  exit 0
fi

command -v huggingface-cli >/dev/null 2>&1 || {
  echo "未找到 huggingface-cli，请先安装：pip install -U \"huggingface_hub[cli]\""
  exit 1
}

mkdir -p "$OUT_DIR"
FAILED=()
for repo in "${MODELS[@]}"; do
  echo "=== 下载 $repo ==="
  if huggingface-cli download "$repo" --local-dir "$OUT_DIR/$repo" 2>&1 | tail -n 5; then
    echo "完成：$repo"
  else
    echo "失败：$repo（可能是 gated 需先在网页接受许可，或网络问题）"
    FAILED+=("$repo")
  fi
  echo
done

if [ "${#FAILED[@]}" -gt 0 ]; then
  echo "以下模型下载失败："
  printf '  - %s\n' "${FAILED[@]}"
  exit 1
fi
echo "全部下载完成。"
