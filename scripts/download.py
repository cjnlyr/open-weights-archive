#!/usr/bin/env python3
"""一键下载优先清单里的开源模型（Hugging Face）。

用法：
    python scripts/download.py                       # 下载 models-priority.txt 里的全部模型
    python scripts/download.py Qwen/Qwen3.8-27B      # 只下载指定模型（可传多个）
    python scripts/download.py --dry-run             # 只打印清单，不实际下载

前置：pip install -U huggingface_hub
可选加速：pip install hf_transfer，并设置环境变量 HF_HUB_ENABLE_HF_TRANSFER=1

注意：
- 下载前确认磁盘空间够（4-bit 量化版约为原大小的 1/4 到 1/3）。
- Gated 模型需先在 Hugging Face 网页上点接受许可，否则会报 401。
- 默认下载到 ./downloads/<模型名>/，可用 OUT_DIR 环境变量改位置。
"""
import os
import sys
from pathlib import Path

OUT_DIR = os.environ.get("OUT_DIR", "./downloads")
LIST_FILE = Path(__file__).resolve().parent.parent / "models-priority.txt"


def load_list() -> list[str]:
    models = []
    for line in LIST_FILE.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        models.append(line)
    return models


def main() -> int:
    args = [a for a in sys.argv[1:] if a != "--dry-run"]
    dry_run = "--dry-run" in sys.argv[1:]
    models = args or load_list()
    if not models:
        print(f"没有要下载的模型。请检查 {LIST_FILE} 或直接传模型 ID。")
        return 1

    print(f"目标目录：{OUT_DIR}")
    print(f"将要下载 {len(models)} 个模型：")
    for m in models:
        print(f"  - {m}")
    if dry_run:
        print("[dry-run] 未实际下载。")
        return 0

    try:
        from huggingface_hub import snapshot_download
    except ImportError:
        print("未安装 huggingface_hub，请先安装：pip install -U huggingface_hub")
        return 1

    failed = []
    for repo in models:
        print(f"=== 下载 {repo} ===")
        try:
            path = snapshot_download(repo_id=repo, local_dir=f"{OUT_DIR}/{repo}")
            print(f"完成：{repo} -> {path}")
        except Exception as e:  # noqa: BLE001
            print(f"失败：{repo}（{e}），可能是 gated 需先在网页接受许可，或网络问题")
            failed.append(repo)
        print()
    if failed:
        print("以下模型下载失败：")
        for m in failed:
            print(f"  - {m}")
        return 1
    print("全部下载完成。")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
