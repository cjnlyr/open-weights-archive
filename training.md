# 训练资源 Training

> 训练代码、框架与手册。以下均为开源项目，链接为其官方仓库或 Hugging Face 页面，使用前请以项目主页为准。

## A. 微调框架（SFT / LoRA / RL）

| 项目 | 链接 | 说明 |
|---|---|---|
| TRL | [huggingface/trl](https://github.com/huggingface/trl) | Hugging Face 官方微调库：SFT、DPO、GRPO、RLVR |
| Axolotl | [axolotl-ai-cloud/axolotl](https://github.com/axolotl-ai-cloud/axolotl) | 常用 LLM 微调框架，配 YAML 即可跑 |
| LLaMA-Factory | [hiyouga/LLaMA-Factory](https://github.com/hiyouga/LLaMA-Factory) | 全流程微调：SFT、LoRA、RLHF、推理部署 |
| Unsloth | [unslothai/unsloth](https://github.com/unslothai/unsloth) | 快速微调（省显存、提速），配 GGUF 导出 |
| torchtune | [pytorch/torchtune](https://github.com/pytorch/torchtune) | PyTorch 官方微调库 |
| OpenRLHF | [OpenRLHF/OpenRLHF](https://github.com/OpenRLHF/OpenRLHF) | RLHF / PPO / GRPO 训练框架 |

## B. 预训练与大规模训练

| 项目 | 链接 | 说明 |
|---|---|---|
| Megatron-LM | [NVIDIA/Megatron-LM](https://github.com/NVIDIA/Megatron-LM) | NVIDIA 大规模预训练框架（MoE、并行） |
| DeepSpeed | [microsoft/DeepSpeed](https://github.com/microsoft/DeepSpeed) | 微软大模型训练优化库（ZeRO、MoE） |
| torchtitan | [pytorch/torchtitan](https://github.com/pytorch/torchtitan) | PyTorch 原生大规模训练 |
| Nanotron | [huggingface/nanotron](https://github.com/huggingface/nanotron) | Hugging Face 轻量预训练框架 |
| MoE Training Handbook | [Hugging Face MoE 手册](https://huggingface.co/spaces/nanotron/MoE-training-handbook) | 约 80 万 GH200 GPU 小时的 MoE 训练经验，含 Megatron-LM 推荐参数 |

## C. 推理部署

| 项目 | 链接 | 说明 |
|---|---|---|
| vLLM | [vllm-project/vllm](https://github.com/vllm-project/vllm) | 高吞吐 LLM 推理引擎 |
| llama.cpp | [ggerganov/llama.cpp](https://github.com/ggerganov/llama.cpp) | 本地跑 GGUF 量化模型（CPU/GPU） |
| Ollama | [ollama/ollama](https://github.com/ollama/ollama) | 本地一键跑模型 |
| SGLang | [sgl-project/sglang](https://github.com/sgl-project/sglang) | 高性能推理与结构化生成 |
| TGI | [huggingface/text-generation-inference](https://github.com/huggingface/text-generation-inference) | Hugging Face 官方推理服务 |

## D. 数据处理与评估

| 项目 | 链接 | 说明 |
|---|---|---|
| lm-eval-harness | [EleutherAI/lm-evaluation-harness](https://github.com/EleutherAI/lm-evaluation-harness) | 常用评测基准一键跑（MMLU、ARC、HellaSwag 等） |
| datatrove | [huggingface/datatrove](https://github.com/huggingface/datatrove) | 大规模数据处理管线（清洗、去重、过滤） |
| FineWeb 处理脚本 | [HuggingFaceFW/fineweb](https://huggingface.co/datasets/HuggingFaceFW/fineweb) | FineWeb 数据处理流程参考 |

## E. 3D 生成与多模态训练（2026-11 新）

| 项目 | 链接 | 说明 |
|---|---|---|
| TRELLIS.2 LoRA 微调 | [Hugging Face TRELLIS.2 指南](https://huggingface.co/spaces/JeffreyXiang/TRELLIS.2) | LoRA 微调脚本与容器，可本地或 HF Jobs 运行 |

## 训练建议（给只有一台云服务器 + 本地 4 线程的情况）

1. **先从 LoRA 微调起步**：全参数微调大模型需要多卡；LoRA（TRL / Axolotl / LLaMA-Factory）用单卡就能跑小模型。
2. **先跑小模型**：LFM3-1.7B、Qwen3-0.6B/8B、Phi-4、Mistral-7B —— 这些在有限硬件上能实际跑通。
3. **推理先用 llama.cpp / Ollama**：GGUF 量化版 + llama.cpp，CPU 也能跑小模型，先验证流程。
4. **评测先用 lm-eval-harness**：跑 MMLU、ARC、GSM8K 等小基准，验证模型与流程。
