# 开源模型目录 Models

> 核实时间：2026-11-14（Hugging Face 公开 API 实测）。
> “已验证”= 当天通过 API 查到该仓库；“Gated”= 仓库存在但需先在 Hugging Face 网页接受许可才能访问/下载（API 返回 401）。
> 大小为约数，4-bit 量化版约为原大小的 1/4 到 1/3；下载前请以仓库页面为准。
> 下载量为 API 返回的累计下载数（2026-11-14）。

## A. 优先备份清单（社区报警点名 + 旗舰）

这些是 2026 年 11 月社区报警时点名要备份的模型，以及同期最重要的开源发布。

| 模型 | 仓库 ID | 机构 | 参数 | 许可 | 下载量 | 备注 |
|---|---|---|---|---|---|---|
| Qwen3.8-27B | [Qwen/Qwen3.8-27B](https://huggingface.co/Qwen/Qwen3.8-27B) | Qwen / 阿里 | 27B | Apache 2.0 | 6,960,395 | 报警点名；另有 FP8 版 `Qwen/Qwen3.8-27B-FP8` |
| Qwen3.8-27B-GGUF（量化） | [unsloth/Qwen3.8-27B-GGUF](https://huggingface.co/unsloth/Qwen3.8-27B-GGUF) | Unsloth | 27B | Apache 2.0 | 6,253,865 | 4-bit GGUF，优先下这个 |
| DeepSeek-V4.1-Flash | [deepseek-ai/DeepSeek-V4.1-Flash](https://huggingface.co/deepseek-ai/DeepSeek-V4.1-Flash) | DeepSeek | 552B + 196B / 8B prefill, 16B decode | MIT | 1,772,553 | 报警点名；约 429 GB（NVFP4） |
| GLM-5.3 | [zai-org/GLM-5.3](https://huggingface.co/zai-org/GLM-5.3) | 智谱 zai-org | — | 见模型页 | 1,853,368 | 报警点名；注意机构是 zai-org，不是 THUDM |
| GLM-5.3-Flash | [zai-org/GLM-5.3-Flash](https://huggingface.co/zai-org/GLM-5.3-Flash) | 智谱 zai-org | — | 见模型页 | 6,391,126 | 更常用的 Flash 版 |
| Ornith-1.5-9B-GGUF（量化） | [ornith-ai/Ornith-1.5-9B-GGUF](https://huggingface.co/ornith-ai/Ornith-1.5-9B-GGUF) | ornith-ai | 9B | 见模型页 | 5,813,219 | 报警点名；另有 `ornith-ai/Ornith-1.0-9B-GGUF` |
| Kimi K3.1 Pro | [moonshotai/Kimi-K3.1-Pro](https://huggingface.co/moonshotai/Kimi-K3.1-Pro) | Moonshot | 2.8T / 104B active | Kimi license | 40,953 | 约 1,561 GB（MXFP4）；需多节点 GPU 服务器 |
| Mistral Large 4 | [mistralai/Mistral-Large-4](https://huggingface.co/mistralai/Mistral-Large-4) | Mistral | ~1T MoE / 52B active | modified MIT | Gated | 约 1.06 TB；西方最大开源权重发布之一 |
| Nemotron 3.5 Bolt 74B | [nvidia/Nemotron-3.5-Bolt-74B](https://huggingface.co/nvidia/Nemotron-3.5-Bolt-74B) | NVIDIA | 74B / 9B active | OpenMDW-1.1 | Gated | 2-bit 版约 24.1 GB，可跑在 32GB 显卡上 |
| LFM3-1.7B | [LiquidAI/LFM3-1.7B](https://huggingface.co/LiquidAI/LFM3-1.7B) | Liquid AI | 1.7B | LFM Open License | 96,615 | 约 3.5 GB（BF16）；笔记本、手机都能跑 |
| Arete-27B | [NousResearch/Arete-27B](https://huggingface.co/NousResearch/Arete-27B) | Nous Research | 27B | Apache 2.0 | 5,545 | Qwen3.8-27B 微调版；Q4_K_M 约 16.5 GB |
| DeepSeek-V4 | [deepseek-ai/DeepSeek-V4](https://huggingface.co/deepseek-ai/DeepSeek-V4) | DeepSeek | — | MIT | Gated | 报警点名的 V4 系列 |

## B. 主力开源大模型（按机构，已验证）

| 模型 | 仓库 ID | 机构 | 参数 | 许可 | 下载量 |
|---|---|---|---|---|---|
| Qwen3-32B | [Qwen/Qwen3-32B](https://huggingface.co/Qwen/Qwen3-32B) | Qwen / 阿里 | 32B | Apache 2.0 | 3,145,695 |
| Qwen3-8B | [Qwen/Qwen3-8B](https://huggingface.co/Qwen/Qwen3-8B) | Qwen / 阿里 | 8B | Apache 2.0 | 6,165,334 |
| Qwen3-14B | [Qwen/Qwen3-14B](https://huggingface.co/Qwen/Qwen3-14B) | Qwen / 阿里 | 14B | Apache 2.0 | 13,011,347 |
| Qwen3-0.6B | [Qwen/Qwen3-0.6B](https://huggingface.co/Qwen/Qwen3-0.6B) | Qwen / 阿里 | 0.6B | Apache 2.0 | 19,141,315 |
| Qwen3-VL-8B-Instruct | [Qwen/Qwen3-VL-8B-Instruct](https://huggingface.co/Qwen/Qwen3-VL-8B-Instruct) | Qwen / 阿里 | 8B | Apache 2.0 | 7,130,209 |
| DeepSeek-V3 | [deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) | DeepSeek | 671B MoE | MIT | 1,413,463 |
| DeepSeek-V3.2 | [deepseek-ai/DeepSeek-V3.2](https://huggingface.co/deepseek-ai/DeepSeek-V3.2) | DeepSeek | — | MIT | 8,442,070 |
| DeepSeek-R1 | [deepseek-ai/DeepSeek-R1](https://huggingface.co/deepseek-ai/DeepSeek-R1) | DeepSeek | 671B MoE | MIT | 1,653,912 |
| Llama-3.1-8B-Instruct | [meta-llama/Llama-3.1-8B-Instruct](https://huggingface.co/meta-llama/Llama-3.1-8B-Instruct) | Meta | 8B | Llama 3.1 | 4,198,546 |
| Llama-4-Scout-17B-16E-Instruct | [meta-llama/Llama-4-Scout-17B-16E-Instruct](https://huggingface.co/meta-llama/Llama-4-Scout-17B-16E-Instruct) | Meta | 17B / 16E MoE | Llama 4 | 110,339 |
| Mistral-7B-Instruct-v0.3 | [mistralai/Mistral-7B-Instruct-v0.3](https://huggingface.co/mistralai/Mistral-7B-Instruct-v0.3) | Mistral | 7B | Apache 2.0 | 1,788,262 |
| Gemma-3-27B-it | [google/gemma-3-27b-it](https://huggingface.co/google/gemma-3-27b-it) | Google | 27B | Gemma | 339,404 |
| Gemma-2-9B-it | [google/gemma-2-9b-it](https://huggingface.co/google/gemma-2-9b-it) | Google | 9B | Gemma | 102,229 |
| Phi-4 | [microsoft/Phi-4](https://huggingface.co/microsoft/Phi-4) | Microsoft | 14B | MIT | 236,972 |
| Kimi-K2.5 | [moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) | Moonshot | — | 见模型页 | 392,940 |

## C. 2026 年秋季旗舰发布（GPUwerk 2026-11-07 核查，仓库 ID 待核实）

以下模型在 2026 年 9 月 1 日至 11 月 7 日之间发布，参数与大小引自 GPUwerk，仓库 ID 请在 Hugging Face 上核对后再下载。

| 模型 | 机构 | 参数 | 许可 | 大小（约） | 备注 |
|---|---|---|---|---|---|
| Ling-3.1-flash-1019 | 蚂蚁 Ant | 560B MoE / 25B active | MIT | 574 GB（FP8） | 另有 1.14 TB BF16 底座版 |
| Ripple-65B-Preview | Ricursive | 65B dense | Apache 2.0 | 57.2 GB（NVFP4） | 1 张 DGX Spark（NVFP4）可跑 |
| K2-Horizon-375B-A23B | IFM | 375B / 23B active | Apache 2.0 | 约 211 GB（4.5-bit） | 需 2 张 Spark（估算） |
| Inkling 2 Small | Thinking Machines | 594B total / 17B active | Apache 2.0 | — | vLLM 在 1 张 GB200 上约 630 tok/s |
| LongCat-2.5 | 美团 Meituan | 1.6T MoE / 48B active | MIT | — | GPUwerk 未在 HF 找到 2.5 的仓库，最新为 LongCat-2.0 |

## D. 最常被下载的模型（Hugging Face 全站，2026-11-14）

这些不是大语言模型，但下载量最大、用途最广，值得一起存：

| 模型 | 仓库 ID | 用途 | 下载量 |
|---|---|---|---|
| all-MiniLM-L6-v2 | [sentence-transformers/all-MiniLM-L6-v2](https://huggingface.co/sentence-transformers/all-MiniLM-L6-v2) | 句向量 /  embedding | 173,717,637 |
| bge-small-en-v1.5 | [BAAI/bge-small-en-v1.5](https://huggingface.co/BAAI/bge-small-en-v1.5) | embedding | 45,754,548 |
| bge-m3 | [BAAI/bge-m3](https://huggingface.co/BAAI/bge-m3) | 多语言 embedding / rerank | 29,561,345 |
| bert-base-uncased | [google-bert/bert-base-uncased](https://huggingface.co/google-bert/bert-base-uncased) | BERT 底座 | 31,634,105 |
| gpt2 | [openai-community/gpt2](https://huggingface.co/openai-community/gpt2) | GPT-2 | 33,264,897 |
| clip-vit-base-patch32 | [openai/clip-vit-base-patch32](https://huggingface.co/openai/clip-vit-base-patch32) | CLIP 视觉 | 17,805,063 |
| Kokoro-82M | [hexgrad/Kokoro-82M](https://huggingface.co/hexgrad/Kokoro-82M) | 语音合成 TTS | 12,644,430 |
| Florence-2-base | [microsoft/Florence-2-base](https://huggingface.co/microsoft/Florence-2-base) | 视觉基础模型 | 14,962,311 |
| all-mpnet-base-v2 | [sentence-transformers/all-mpnet-base-v2](https://huggingface.co/sentence-transformers/all-mpnet-base-v2) | 句向量 | 20,396,427 |

## E. 量化版（GGUF，优先下载）

量化版体积小、能在普通硬件上跑。常见发布方：

- **Unsloth**（`unsloth/<模型>-GGUF`）：Qwen、GLM、Llama 等的 GGUF 量化，质量稳定。
- **bartowski**（`bartowski/<模型>-GGUF`）：社区常用量化发布方。
- **mradermacher**（`mradermacher/<模型>-GGUF`）：含 uncensored（去审查）量化版。
- **ISTA-DASLab、huihui-ai**：Qwen3.8 系列的 GGUF 量化。

下载量化版示例：

```bash
huggingface-cli download unsloth/Qwen3.8-27B-GGUF --include "*Q4_K_M*"
```

## 下载建议

1. **先下小的**：LFM3-1.7B（3.5 GB）、Qwen3-0.6B/8B、Phi-4、Mistral-7B、Gemma-2-9B —— 这些在普通机器上能跑。
2. **再下 4-bit 量化版**：Qwen3.8-27B-GGUF、GLM-5.3-Flash-GGUF 等，体积约为原版的 1/4。
3. **大模型只存目录**：Kimi K3.1 Pro（1.5 TB）、Mistral Large 4（约 1 TB）、DeepSeek-V4.1-Flash（429 GB）—— 除非你有大容量存储和多卡服务器，否则先只存链接。
4. **Gated 模型**：先在 Hugging Face 网页上打开模型页、点接受许可，再用脚本下载，否则会报 401。
