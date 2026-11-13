# 开源数据集目录 Datasets

> 核实时间：2026-11-14（Hugging Face 公开 API 实测，部分条目）。
> 数据集体积同样很大（FineWeb 全量上 TB），请按需下载子集或处理后的版本，不要全量拉取。
> 许可与使用限制以数据集页面为准。

## A. 预训练语料（大底座）

| 数据集 | 仓库 ID | 说明 | 下载量 |
|---|---|---|---|
| FineWeb | [HuggingFaceFW/fineweb](https://huggingface.co/datasets/HuggingFaceFW/fineweb) | 高质量英文网页预训练语料（FineWeb-HQ 为精选版） | — |
| FineWeb-HQ | [epfml/FineWeb-HQ](https://huggingface.co/datasets/epfml/FineWeb-HQ) | FineWeb 高质量子集 | 1,091,726 |
| FineFineWeb | [m-a-p/FineFineWeb](https://huggingface.co/datasets/m-a-p/FineFineWeb) | FineWeb 的进一步清洗版 | 1,619,749 |
| wikitext | [Salesforce/wikitext](https://huggingface.co/datasets/Salesforce/wikitext) | 维基百科文本，语言模型经典基准 | 2,206,204 |
| The Pile | [EleutherAI/pile](https://huggingface.co/datasets/EleutherAI/pile) | 825 GB 多源英文预训练语料 | — |
| RedPajama-Data | [togethercomputer/RedPajama-Data-1T](https://huggingface.co/datasets/togethercomputer/RedPajama-Data-1T) | 1.2T token 开源预训练语料 | — |
| SlimPajama | [cerebras/SlimPajama-627B](https://huggingface.co/datasets/cerebras/SlimPajama-627B) | RedPajama 去重版，627B token | — |

## B. 指令微调 / 推理

| 数据集 | 仓库 ID | 说明 | 下载量 |
|---|---|---|---|
| GSM8K | [openai/gsm8k](https://huggingface.co/datasets/openai/gsm8k) | 小学数学应用题，推理基准 | 1,107,878 |
| OpenThoughts | [open-thoughts/OpenThoughts3-1.2M](https://huggingface.co/datasets/open-thoughts/OpenThoughts3-1.2M) | 开源推理轨迹数据 | — |
| Tulu 3 SFT | [allenai/tulu-3-sft-personas-instruction-following](https://huggingface.co/datasets/allenai/tulu-3-sft-personas-instruction-following) | AllenAI 指令微调数据 | — |
| UltraChat | [HuggingFaceH4/ultrachat_200k](https://huggingface.co/datasets/HuggingFaceH4/ultrachat_200k) | 多轮对话指令数据（200k） | — |
| OpenHermes | [teknium/OpenHermes-2.5](https://huggingface.co/datasets/teknium/OpenHermes-2.5) | 指令微调常用数据 | — |

## C. 多模态 / 3D / 机器人

| 数据集 | 仓库 ID | 说明 | 下载量 |
|---|---|---|---|
| Objaverse | [allenai/objaverse](https://huggingface.co/datasets/allenai/objaverse) | 80 万+ 3D 物体模型 | 2,295,676 |
| LAION-5B（子集） | [laion/laion5b](https://huggingface.co/datasets/laion/laion5b) | 58 亿图文对（请按需下子集） | — |
| AgiBotWorld2026 | [agibot-world/AgiBotWorld2026](https://huggingface.co/datasets/agibot-world/AgiBotWorld2026) | 机器人操作数据 | 2,046,420 |
| FineART | [lerobot/FineART](https://huggingface.co/datasets/lerobot/FineART) | LeRobot 机器人动作数据 | 1,124,879 |

## D. 评测基准

| 数据集 | 仓库 ID | 说明 |
|---|---|---|
| MMLU | [cais/mmlu](https://huggingface.co/datasets/cais/mmlu) | 多任务语言理解基准 |
| HellaSwag | [Rowan/hellaswag](https://huggingface.co/datasets/Rowan/hellaswag) | 常识推理基准 |
| ARC | [allenai/ai2_arc](https://huggingface.co/datasets/allenai/ai2_arc) | 科学问答推理基准 |
| HumanEval | [openai/openai_humaneval](https://huggingface.co/datasets/openai/openai_humaneval) | 代码生成基准 |

## 下载建议

1. **先下小的基准和指令数据**：GSM8K、MMLU、UltraChat 子集等，几 MB 到几 GB。
2. **预训练语料按需取子集**：FineWeb、The Pile、RedPajama 全量都是 TB 级，不要全拉；先下 sample 或单个 shard 验证流程。
3. **用 `huggingface-cli` 按文件下载**：`huggingface-cli download <数据集ID> --repo-type dataset --include "data/train-00000-of-*.parquet"`，只拿需要的分片。
4. **注意许可**：LAION 等数据集含网络爬取内容，使用前请阅读数据集页面的许可与说明。
