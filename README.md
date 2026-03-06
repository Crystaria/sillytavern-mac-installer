# 🦞 SillyTavern Mac 一键安装脚本

> **一行命令，全自动安装 SillyTavern，装完即用！**

[![Version](https://img.shields.io/badge/version-0.1.0--alpha-blue)](https://github.com/Crystaria/sillytavern-mac-installer)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey)](https://www.apple.com/macos)
[![License](https://img.shields.io/badge/license-AGPL--3.0-green)](https://github.com/Crystaria/sillytavern-mac-installer/blob/main/LICENSE)

---

## ✨ 特性

- 🚀 **真正一键安装** - 一行命令，全自动完成
- 🎯 **零技术门槛** - 不需要懂 Git、Node.js、命令行
- 🔧 **智能环境检测** - 自动安装缺失的依赖（Homebrew、Git、Node.js）
- 🌐 **国内网络优化** - 自动切换 npm 镜像源，加速安装
- 📦 **完整功能** - 安装后包含管理脚本，支持启动/停止
- 🛡️ **错误处理** - 自动重试 + 清晰的中文错误提示

---

## 📥 安装方式

### 终端命令安装

打开终端（`Cmd + Space`，输入「终端」），粘贴以下命令：

```bash
curl -fsSL https://raw.githubusercontent.com/Crystaria/sillytavern-mac-installer/main/install.sh | bash
```

**提示：** 如果提示无法确认来源，输入 `y` 继续。

---

## 🎬 安装过程

脚本会自动完成以下步骤：

```
[1/6] 检测 macOS 系统 ✓
[2/6] 安装 Xcode Command Line Tools
[3/6] 安装 Homebrew
[4/6] 安装 Git
[5/6] 安装 Node.js (v20 LTS)
[6/6] 下载 SillyTavern 并安装依赖
```

**预计时间：** 5-10 分钟（取决于网络速度）

---

## 🚀 使用指南

### 启动 SillyTavern

```bash
~/sillytavern-helper.sh start
```

### 访问界面

打开浏览器，访问：

```
http://localhost:8000
```

---

## 🔑 安装后配置指南（新手必读）

> **重要：** 安装完成后，你需要配置 API 才能开始聊天。按照以下步骤操作，5 分钟内搞定！

### 步骤 1：找到 API 连接图标

打开 SillyTavern 界面后，在**左侧边栏**找到「插头」图标 🔌

```
┌─────────────────────────────────┐
│  SillyTavern                    │
├─────────────────────────────────┤
│ ┌─────┐                         │
│ │ 👤  │  角色列表               │
│ ├─────┤                         │
│ │ 💬  │  聊天记录               │
│ ├─────┤                         │
│ │ 🔌  │  ← 点这个！(API Connections) │
│ ├─────┤                         │
│ │ 🌐  │  世界观                 │
│ ├─────┤                         │
│ │ ⚙️  │  设置                   │
│ └─────┘                         │
└─────────────────────────────────┘
```

**图标特征：**
- 形状：🔌（类似电源插头）
- 位置：左侧边栏，从上往下数第 3 个
- 提示：鼠标悬停会显示「API Connections」

---

### 步骤 2：选择 API 后端类型

点击 🔌 图标后，**向下滚动**，你会看到一个下拉菜单，显示多个 API 后端类型选项：

```
┌─────────────────────────────────────┐
│ API Backend (API 后端类型)          │
├─────────────────────────────────────┤
│ ▼ 文本补全                          │ ← 点击这里展开
│   聊天补全                          │
│   NovelAI                           │
│   ✓ AI Horde                        │ ← 默认选中（免费）
│   KoboldAI                          │
│   [更多选项...]                     │
└─────────────────────────────────────┘
```

**⚠️ 重要：先选择后端类型，再选择具体的 API 提供商！**

---

#### 各后端类型说明

**1. 文本补全 (Text Completion)**
- **用途：** 续写文本，没有"对话"概念
- **适合：** 写小说、写文章、生成单段回复
- **不适合：** 角色扮演聊天

**示例：**
```
输入："在一个风雨交加的夜晚，侦探推开了..."
输出："...那扇吱呀作响的木门。房间里弥漫着一股陈旧的血腥味..."
```

---

**2. 聊天补全 (Chat Completion) ✅ 推荐新手**
- **用途：** 对话式聊天，有角色设定
- **适合：** 角色扮演、与虚拟角色互动、AI 助手
- **特点：** 
  - 有"用户"和"角色"的对话区分
  - 支持角色设定（性格、背景、语气）
  - 支持多轮对话，有上下文记忆
- **推荐搭配：** DeepSeek、通义千问、OpenAI

**示例：**
```
你：你好呀！
角色：哼，才不是特意来理你的呢！喵～

你：今天天气不错
角色：关我什么事...不过你要是想出门的话，
      本喵可以勉强陪你一下！喵！
```

---

**3. AI Horde ✅ 免费体验**
- **用途：** 免费的分布式 AI 网络
- **适合：** 
  - 🆓 不想花钱，先试试
  - 🧪 测试 SillyTavern 功能
  - 🎮 随便玩玩，不追求质量
- **优点：** 完全免费，无需注册
- **缺点：** 
  - 速度慢（30 秒 -5 分钟）
  - 质量不稳定
  - 模型选择有限

**使用建议：** 第一次体验可以用，认真使用建议付费 API

---

**4. NovelAI**
- **用途：** NovelAI 平台专有格式
- **适合：** 写小说、创意写作
- **需要：** NovelAI 付费订阅（$10-25/月）

---

**5. KoboldAI**
- **用途：** KoboldAI 平台专有格式
- **适合：** 写小说、跑团（TRPG）
- **需要：** KoboldAI 订阅

---

#### 🎯 新手推荐选择

| 你的需求 | 推荐后端 | 推荐 API | 理由 |
|----------|----------|----------|------|
| **免费体验** | AI Horde | - | 不花钱，能跑起来 |
| **角色扮演聊天** | 聊天补全 | DeepSeek | 性价比高，中文好 |
| **写小说** | 聊天补全 | Claude | 创意强，上下文长 |
| **跑团/TRPG** | KoboldAI | KoboldAI | 专为跑团优化 |
| **AI 助手** | 聊天补全 | GPT-4o | 逻辑清晰，知识广 |

---

### 步骤 3：选择 API 提供商

选择后端类型后，继续向下滚动，你会看到具体的 API 提供商选项：

```
┌─────────────────────────────────────┐
│ Chat Completion Source              │
│ (聊天补全来源)                      │
├─────────────────────────────────────┤
│ ▼ OpenAI                            │
│   自定义（兼容 OpenAI）✅ 推荐       │
│   AI21                              │
│   Claude                            │
│   DeepSeek ✅ 推荐                  │
│   Google AI Studio                  │
│   Groq                              │
│   Moonshot AI                       │
│   OpenRouter                        │
│   [更多选项...]                     │
└─────────────────────────────────────┘
```

**⚠️ 重要：** 这里的选择决定了你要用哪家的 AI 模型！

---

#### 🎯 新手推荐选择（国内用户）

| 选项 | 适合人群 | 费用 | 难度 | 推荐度 |
|------|----------|------|------|--------|
| **自定义（兼容 OpenAI）** | 使用国内 API | 便宜 | ⭐⭐ | ⭐⭐⭐⭐ |
| **DeepSeek** | 性价比首选 | ¥2/百万 tokens | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Moonshot AI** | 长文本需求 | ¥6/百万 tokens | ⭐⭐ | ⭐⭐⭐⭐ |
| **通义千问** | 有阿里云账号 | ¥3/百万 tokens | ⭐⭐ | ⭐⭐⭐⭐ |
| **智谱 AI (Z.AI)** | 学术/企业用户 | 按量付费 | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **OpenAI** | 有外币信用卡 | $0.5 起 | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Claude** | 追求最佳效果 | $3 起 | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Google AI** | 有谷歌账号 | 免费额度 | ⭐⭐⭐ | ⭐⭐⭐ |

---

#### 📋 各选项详细说明

**✅ 强烈推荐（国内用户首选）**

**1. 自定义（兼容 OpenAI）**
- **说明：** 这是一个通用接口，可以连接任何兼容 OpenAI 格式的 API
- **适合：** 使用 DeepSeek、通义千问、智谱 AI 等国内 API
- **优点：** 灵活，可以自由选择多家服务商
- **配置：** 需要手动填写 API Key 和端点 URL
- **推荐指数：** ⭐⭐⭐⭐⭐

**2. DeepSeek（深度求索）**
- **说明：** 国产大模型，性价比之王
- **适合：** 日常聊天、角色扮演、写作辅助
- **优点：** 
  - 价格便宜（¥2/百万 tokens）
  - 中文理解好
  - 新用户送 ¥5 额度
- **缺点：** 需要手机号注册
- **推荐指数：** ⭐⭐⭐⭐⭐
- **注册链接：** https://platform.deepseek.com

---

**✅ 推荐（有特定需求）**

**3. Moonshot AI（月之暗面）**
- **说明：** Kimi 聊天机器人的 API 版本
- **适合：** 长文本处理（支持 128K 上下文）
- **优点：** 
  - 超长上下文
  - 中文友好
  - 新用户有免费额度
- **缺点：** 价格稍高
- **推荐指数：** ⭐⭐⭐⭐
- **注册链接：** https://platform.moonshot.cn

**4. 通义千问（阿里云）**
- **说明：** 阿里的大模型
- **适合：** 已有阿里云账号的用户
- **优点：** 
  - 阿里云生态整合好
  - 模型选择多
  - 有免费额度
- **缺点：** 需要阿里云账号
- **推荐指数：** ⭐⭐⭐⭐
- **注册链接：** https://dashscope.console.aliyun.com

**5. 智谱 AI (Z.AI / GLM)**
- **说明：** 清华系的大模型
- **适合：** 学术、企业用户
- **优点：** 
  - 学术能力强
  - 有免费额度
  - 支持多种模型
- **缺点：** 注册流程稍复杂
- **推荐指数：** ⭐⭐⭐⭐
- **注册链接：** https://open.bigmodel.cn

---

**⭕ 可选（有门槛）**

**6. OpenAI**
- **说明：** GPT-4、GPT-3.5 的官方 API
- **适合：** 有外币信用卡、追求最佳效果
- **优点：** 
  - 模型最强（GPT-4o）
  - 生态完善
  - 文档齐全
- **缺点：** 
  - 需要外币信用卡
  - 需要国外手机号
  - 可能被封号
- **推荐指数：** ⭐⭐⭐
- **注册链接：** https://platform.openai.com

**7. Claude（Anthropic）**
- **说明：** 前 OpenAI 团队创建，主打安全
- **适合：** 写作、创意、长文本
- **优点：** 
  - 创意写作最强
  - 上下文超长（200K）
  - 安全性高
- **缺点：** 
  - 需要外币信用卡
  - 价格较贵
  - 需要代理
- **推荐指数：** ⭐⭐⭐
- **注册链接：** https://console.anthropic.com

**8. Google AI Studio**
- **说明：** 谷歌的 Gemini 模型 API
- **适合：** 有谷歌账号的用户
- **优点：** 
  - 有免费额度
  - 多模态能力强
  - 谷歌生态
- **缺点：** 
  - 需要谷歌账号
  - 需要代理
- **推荐指数：** ⭐⭐⭐
- **注册链接：** https://makersuite.google.com

---

** 不推荐（新手慎用）**

| 选项 | 原因 |
|------|------|
| AI21 | 国内访问慢，文档少 |
| Azure OpenAI | 需要企业账号，配置复杂 |
| Cohere | 主要面向企业，个人用不划算 |
| Groq | 主要是推理加速，不适合聊天 |
| OpenRouter | 聚合平台，配置复杂 |
| 其他未列出的 | 文档少，问题难解决 |

---

#### 🏆 最终推荐（抄作业）

**方案 A：性价比首选（推荐 90% 用户）**
```
聊天补全来源：自定义（兼容 OpenAI）
API Key 获取：https://platform.deepseek.com
端点：https://api.deepseek.com/v1
模型：deepseek-chat
费用：¥2/百万 tokens（约 ¥0.02/千字）
```

**方案 B：长文本需求**
```
聊天补全来源：Moonshot AI
API Key 获取：https://platform.moonshot.cn
端点：https://api.moonshot.cn/v1
模型：moonshot-v1-128k
费用：¥6/百万 tokens（约 ¥0.06/千字）
```

**方案 C：免费体验**
```
聊天补全来源：Google AI Studio
API Key 获取：https://makersuite.google.com
端点：使用默认
模型：gemini-1.5-flash
费用：每月免费 60 次请求
```

**方案 D：不差钱，追求最佳**
```
聊天补全来源：OpenAI
API Key 获取：https://platform.openai.com
端点：使用默认
模型：gpt-4o-mini
费用：$0.15/百万 tokens（约 ¥1/千字）
```

---

#### ❓ 常见问题

**Q: "自定义（兼容 OpenAI）"是什么意思？**

A: 这是一个通用接口格式，很多 API 提供商都兼容这个格式。选择后需要手动填写：
- API Key（从服务商获取）
- 端点 URL（服务商提供的地址）
- 模型名称（如 deepseek-chat）

**Q: 我应该选哪个？**

A: 
- **第一次用，不想花钱** → AI Horde（之前选的）
- **想认真用，追求性价比** → 自定义 + DeepSeek
- **需要处理长文档** → Moonshot AI
- **有阿里云账号** → 通义千问
- **有外币信用卡** → OpenAI 或 Claude

**Q: 可以同时配置多个吗？**

A: 可以！SillyTavern 支持：
- 同时配置多个 API 提供商
- 在聊天时快速切换
- 不同角色使用不同 API

---

**推荐选择（新手）：**

| API 类型 | 适合人群 | 费用 | 难度 |
|----------|----------|------|------|
| **Horde** | 完全免费，想先试试 | 免费 | ⭐ 最简单 |
| **DeepSeek** | 性价比高，中文好 | ¥2/百万 tokens | ⭐⭐ 简单 |
| **OpenAI** | 追求最佳效果 | $0.5 起 | ⭐⭐⭐ 需信用卡 |
| **通义千问** | 国内用户，有阿里云 | 按量付费 | ⭐⭐ 简单 |

---

### 步骤 3：填入 API Key 和端点

#### 选项 A：使用 Horde（免费，推荐新手）

1. 勾选 **「Horde」**
2. 不需要 API Key（可选填）
3. 直接跳到步骤 4 测试连接

**Horde 说明：**
- ✅ 完全免费，无需注册
- ⚠️ 速度较慢，需要排队
- ⚠️ 模型质量参差不齐
- 💡 适合：第一次体验，不想花钱

---

#### 选项 B：使用 OpenAI 兼容 API（推荐）

大多数国内 API 提供商都支持 OpenAI 兼容格式：

1. 勾选 **「OpenAI」** 或 **「OpenAI Compatible」**
2. 填写以下信息：

```
┌─────────────────────────────────────┐
│ API Key:                            │
│ sk-xxxxxxxxxxxxxxxxxxxxxxxx...      │
├─────────────────────────────────────┤
│ Custom Endpoint (自定义端点):       │
│ https://api.deepseek.com/v1         │
├─────────────────────────────────────┤
│ Model (模型):                       │
│ deepseek-chat                       │
└─────────────────────────────────────┘
```

**常见 API 配置：**

| 提供商 | API Key 获取 | 端点 (Endpoint) | 模型名称 |
|--------|--------------|-----------------|----------|
| **DeepSeek** | https://platform.deepseek.com | `https://api.deepseek.com/v1` | `deepseek-chat` |
| **通义千问** | https://dashscope.console.aliyun.com | `https://dashscope.aliyuncs.com/compatible-mode/v1` | `qwen-turbo` |
| **智谱 AI** | https://open.bigmodel.cn | `https://open.bigmodel.cn/api/paas/v4` | `glm-4` |
| **Moonshot** | https://platform.moonshot.cn | `https://api.moonshot.cn/v1` | `moonshot-v1-8k` |
| **OpenAI** | https://platform.openai.com | `https://api.openai.com/v1` | `gpt-4o-mini` |

---

#### 选项 C：使用 Claude

1. 勾选 **「Claude」**
2. 获取 API Key：https://console.anthropic.com
3. 填入 API Key
4. 选择模型：`claude-sonnet-4-20250514`（推荐）

---

### 步骤 4：测试连接

配置完成后：

1. 向下滚动，找到 **「Connect」** 按钮
2. 点击测试连接
3. 观察状态：

```
✅ 成功：显示绿色「Connected」和模型信息
❌ 失败：显示红色错误信息（见下方常见问题）
```

**成功示例：**
```
┌─────────────────────────────────────┐
│ ✅ Connected                        │
│ Model: deepseek-chat               │
│ Balance: ¥50.00                    │
└─────────────────────────────────────┘
```

---

### 步骤 5：开始聊天！

连接成功后：

1. 点击左侧边栏的 **💬 图标**（聊天界面）
2. 选择一个角色（或创建自己的）
3. 在底部输入框打字，开始聊天！

```
┌─────────────────────────────────┐
│  角色名称                        │
├─────────────────────────────────┤
│                                 │
│  角色：你好！我是小爪 🦞        │
│        有什么可以帮你的吗？     │
│                                 │
│  你：[在此输入...]              │
│                                 │
└─────────────────────────────────┘
```

---

## ❓ API 配置常见问题

### Q1: API Key 在哪里获取？

**A:** 不同提供商的获取方式：

| 提供商 | 获取链接 | 需要 |
|--------|----------|------|
| DeepSeek | https://platform.deepseek.com | 手机号注册 |
| 通义千问 | https://dashscope.console.aliyun.com | 阿里云账号 |
| 智谱 AI | https://open.bigmodel.cn | 手机号注册 |
| Moonshot | https://platform.moonshot.cn | 手机号注册 |
| OpenAI | https://platform.openai.com | 信用卡 + 国外手机号 |
| Claude | https://console.anthropic.com | 信用卡 |

**一般流程：**
1. 注册账号（通常需要手机号）
2. 完成实名认证（国内平台需要）
3. 充值（部分平台有免费额度）
4. 在「API 管理」或「密钥管理」页面创建 API Key
5. 复制 Key，粘贴到 SillyTavern

---

### Q2: 有没有免费的 API 可以用？

**A:** 有！以下几种选择：

**1. Horde（完全免费）**
- 优点：无需注册，开箱即用
- 缺点：速度慢，需要排队，模型质量不稳定
- 适合：第一次体验

**2. 各平台免费额度**
- DeepSeek：新用户送 ¥5 额度
- 通义千问：新用户有免费试用
- 智谱 AI：新用户送免费 tokens
- Moonshot：新用户有体验金

**3. Hugging Face Inference API**
- 网址：https://huggingface.co
- 免费额度：每月约 1000 次请求
- 需要在 SillyTavern 中选择「Text Completion」→「Hugging Face」

---

### Q3: 连接失败，提示「Invalid API Key」

**A:** 可能原因：

1. **Key 复制错误**
   - 检查是否多复制了空格
   - 检查是否少复制了字符
   - 重新复制一次试试

2. **Key 未激活**
   - 部分平台需要手动激活 API 服务
   - 检查账户是否完成实名认证
   - 检查是否有余额

3. **端点错误**
   - 确认端点 URL 正确
   - 确认是否使用 HTTPS（不是 HTTP）
   - 确认端点是否支持 OpenAI 兼容格式

---

### Q4: 连接失败，提示「Network Error」

**A:** 网络问题，解决方案：

1. **检查网络连接**
   ```bash
   ping api.deepseek.com
   ```

2. **使用代理**
   - 部分 API 需要科学上网才能访问
   - 配置系统代理后重试

3. **切换 API 提供商**
   - 国内 API（DeepSeek、通义千问等）通常不需要代理
   - 国外 API（OpenAI、Claude）需要代理

---

### Q5: 如何选择适合的模型？

**A:** 根据需求选择：

| 需求 | 推荐模型 | 价格 | 特点 |
|------|----------|------|------|
| 日常聊天 | `deepseek-chat` | 便宜 | 速度快，中文好 |
| 角色扮演 | `qwen-turbo` | 便宜 | 创意好，上下文长 |
| 写作辅助 | `gpt-4o-mini` | 中等 | 逻辑清晰 |
| 复杂任务 | `claude-sonnet-4` | 较贵 | 最强，但需要代理 |
| 免费体验 | Horde 任意模型 | 免费 | 慢，但免费 |

---

### Q6: 如何查看 API 用量和余额？

**A:** 在对应平台的控制台查看：

- DeepSeek：https://platform.deepseek.com → 账户余额
- 通义千问：https://dashscope.console.aliyun.com → 资源管理
- 智谱 AI：https://open.bigmodel.cn → 账户中心
- OpenAI：https://platform.openai.com → Usage

---

### Q7: 能同时配置多个 API 吗？

**A:** 可以！SillyTavern 支持：

- 同时配置多个 API 提供商
- 在聊天时快速切换
- 不同角色使用不同 API

**切换方法：**
1. 点击 🔌 图标
2. 勾选不同的 API
3. 返回聊天界面即可使用

---

## 🎯 快速配置检查清单

第一次配置，按这个清单核对：

- [ ] 已启动 SillyTavern（`~/sillytavern-helper.sh start`）
- [ ] 已打开浏览器访问 `http://localhost:8000`
- [ ] 已点击左侧边栏的 🔌 图标
- [ ] 已选择 API 提供商（推荐 Horde 或 DeepSeek）
- [ ] 已填入 API Key（如需要）
- [ ] 已填入自定义端点（如需要）
- [ ] 已选择模型
- [ ] 已点击「Connect」测试连接
- [ ] 显示绿色「Connected」
- [ ] 已点击 💬 图标进入聊天界面
- [ ] 已选择角色
- [ ] 成功发送第一条消息

**全部勾选？恭喜你，配置完成！🎉**

---

### 常用命令

```bash
# 启动 SillyTavern
~/sillytavern-helper.sh start

# 停止 SillyTavern
~/sillytavern-helper.sh stop

# 查看所有可用命令
~/sillytavern-helper.sh
```

---

## ❓ 常见问题

### Q: 安装过程中需要输入密码，正常吗？

**A:** 正常。安装 Homebrew 需要管理员权限，输入密码时不会显示字符，输完按回车即可。

### Q: 卡在某个步骤不动怎么办？

**A:** 可能是网络问题。建议：
1. 使用代理或加速器
2. 等待 5 分钟，脚本会自动重试
3. 如果仍然失败，查看错误信息，手动执行失败的命令

### Q: 提示「xcrun: error: invalid active developer path」

**A:** 需要安装 Xcode Command Line Tools。运行：

```bash
xcode-select --install
```

### Q: 端口 8000 被占用怎么办？

**A:** 修改启动端口：

```bash
cd ~/SillyTavern
nano config.yaml
# 修改 port: 8000 为其他端口（如 8001）
```

### Q: 如何卸载？

**A:** 删除安装目录和管理脚本：

```bash
rm -rf ~/SillyTavern
rm ~/sillytavern-helper.sh
```

---

## 🔧 技术细节

### 系统要求

- macOS 10.15 (Catalina) 或更高版本
- 至少 4GB 可用内存
- 至少 2GB 可用磁盘空间

### 安装的组件

| 组件 | 版本 | 用途 |
|------|------|------|
| Homebrew | 最新 | macOS 包管理器 |
| Git | 最新 | 版本控制 |
| Node.js | v20 LTS | 运行环境 |
| SillyTavern | release 分支 | 主程序 |

### 镜像源

- **npm:** https://registry.npmmirror.com（淘宝镜像）
- **Homebrew:** 自动检测国内网络，使用清华镜像

---

## 📝 更新日志

### v0.1.0-alpha (2026-03-06)

- ✨ 初始版本发布
- ✅ 全自动安装流程
- ✅ 智能环境检测
- ✅ 国内网络优化
- ✅ 管理脚本生成

---

## 🙏 致谢

- [SillyTavern](https://github.com/SillyTavern/SillyTavern) - 优秀的 LLM 前端
- [SillyTavern-Launcher](https://github.com/SillyTavern/SillyTavern-Launcher) - 官方启动器（灵感来源）

---

## 📄 许可证

本项目采用 AGPL-3.0 许可证。

---

## 💬 反馈与支持

遇到问题？欢迎反馈！

- 📝 [GitHub Issues](https://github.com/Crystaria/sillytavern-mac-installer/issues) - 报告问题或建议
- 💬 [SillyTavern Discord](https://discord.gg/sillytavern) - 官方社区

**项目仓库：** https://github.com/Crystaria/sillytavern-mac-installer

> **注意：** Discussions 功能需要在 GitHub 仓库设置中手动开启（Settings → Features → Discussions）

---

**祝你使用愉快！🦞**
