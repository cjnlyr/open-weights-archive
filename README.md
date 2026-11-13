# Open Weights Archive / 开源模型档案库

> 备份的不是权重文件本身，而是“去哪里找、怎么下、用什么跑”的完整目录。
> 权重太大，放不进 git；这个仓库存的是链接、许可、大小和一键下载脚本。

## 为什么建这个仓库

2026 年 11 月，开源社区拉响警报，原因有三件：

1. **英伟达收购 Hugging Face**：2026 年 9 月，英伟达宣布以 129 亿美元收购 Hugging Face（全球最大的开源 AI 模型仓库，托管超 300 万个模型），交易预计 2027 年上半年完成，目前正接受美国司法部反垄断审查。
2. **黄仁勋辞职**：2026 年 11 月 12 日，英伟达 CEO 黄仁勋因婚外情丑闻辞职。主导这笔收购的人走了，交易的不确定性上升。Hugging Face CEO Clément Delangue 当天发推称“真是令人难过的一天”，并表示会“比以往任何时候都更加努力地捍卫开源人工智能”。
3. **已有模型悄悄消失**：社区发现个别去审查版模型在 Hugging Face 上返回 404（如下架），且 Hugging Face 现在是“单一故障点 + 待变更所有权”的组合。

社区的共识很简单：**趁还能下，把值得存的模型、数据集和训练资料的“地址 + 下载方法”先存下来**。权重文件本身请下载到你自己的硬盘或服务器上，不要指望任何一个平台永远都在。

## 这个仓库里有什么

| 文件 | 内容 |
|---|---|
| [models.md](models.md) | 开源模型目录：优先备份清单、旗舰大模型、最常被下载的模型、量化版（GGUF） |
| [datasets.md](datasets.md) | 开源数据集目录：预训练、指令微调、推理、多模态 |
| [training.md](training.md) | 训练资源：微调框架、训练手册、推理部署工具 |
| [scripts/download.sh](scripts/download.sh) | 一键下载脚本（bash，基于 `huggingface-cli`） |
| [scripts/download.py](scripts/download.py) | 一键下载脚本（Python，基于 `huggingface_hub`） |
| [models-priority.txt](models-priority.txt) | 优先备份的模型清单（给下载脚本用） |

## 这个仓库里没有的东西

- **没有模型权重文件。** 一个 7B 模型量化后也要几 GB，大模型几百 GB 到上 TB，GitHub 单个文件限 100 MB，仓库也装不下。权重请用脚本下载到你自己的存储上。
- **没有盗版或侵权内容。** 只收录公开、开源许可的模型与数据集，许可信息以模型/数据集页面为准。

## 怎么用

```bash
# 1. 克隆本仓库
git clone https://github.com/cjnlyr/open-weights-archive.git
cd open-weights-archive

# 2. 安装 Hugging Face 命令行工具（任选其一即可）
pip install -U "huggingface_hub[cli]"
# 想下载更快，再装 hf_transfer：
pip install hf_transfer
export HF_HUB_ENABLE_HF_TRANSFER=1

# 3. 下载优先清单里的模型（先看 models-priority.txt，确认磁盘空间够）
bash scripts/download.sh
# 或只下一个：
bash scripts/download.sh Qwen/Qwen3.8-27B
# Python 版：
python scripts/download.py
```

> **磁盘空间提醒**：下载前先确认空间。4-bit 量化版通常只有原大小的约 1/4 到 1/3，优先下量化版。 gated（需授权）的模型要先在 Hugging Face 网页上点接受许可，再下载。

## 核实说明

- 模型仓库 ID 与下载量为 **2026-11-14 通过 Hugging Face 公开 API 实测**，个别 gated 模型返回 401（需先在网页接受许可），表中已标注。
- 2026 年秋季旗舰模型的参数与大小引自 GPUwerk《New open-weight LLMs, autumn 2026》（2026-11-07 核查），部分仓库 ID 尚未逐一验证，表中已标注“待核实”。
- 许可信息以模型页面（model card）为准，转载时请以页面为准。

## 来源

- TechCrunch：Hugging Face CEO vows to keep fighting for open source AI after Jensen Huang's exit（2026-11-12）
- WiseVoter：Blogger Urges Users to Download AI Models Now（2026-11-12）
- GPUwerk：New open-weight LLMs, autumn 2026（2026-11-07）
- Hugging Face 公开 API（2026-11-14 实测）

## 许可

本仓库的目录文本与脚本采用 MIT License（见 [LICENSE](LICENSE)）。所列模型与数据集的许可各归其作者所有，使用前请阅读各自的许可。
