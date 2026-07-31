# Zheyuan LI — 个人学术主页

这是我的个人学术主页源码，使用 Jekyll 和 GitHub Pages 发布：

- 在线网站：<https://xiaom233.github.io>
- 主要内容：研究方向、论文、个人经历、新闻、报告、生活记录和简历
- 设计风格：学术报告式排版，深蓝、古金和暖灰配色

这份 README 以“少写代码、主要改文字”为目标。日常更新通常只需要修改 Markdown 或 YAML 文件，不需要接触 HTML、CSS 或 JavaScript。

## 最常用的维护入口

| 我想修改什么 | 修改哪个文件 |
|---|---|
| 首页大标题、简介、研究方向、个人经历、新闻 | `_data/home.yml` |
| 新增或修改论文 | `_publications/*.md` |
| 顶部导航 | `_data/navigation.yml` |
| 姓名、邮箱、GitHub、头像文件名等全站资料 | `_config.yml` |
| 头像 | `images/lizheyuan.jpg` |
| PDF 简历 | `files/ZheyuanLi.pdf` |
| Talks | `_talks/*.md` |
| Life 页面 | `_portfolio/*.md` |

一般不要修改 `_layouts`、`_includes` 和 `assets/css/report-theme.css`。这些文件控制页面结构和视觉样式。

## 1. 修改首页文字

打开：

```text
_data/home.yml
```

这个文件集中保存了首页可见文字，包括：

- `profile`：左侧个人资料
- `hero`：首屏姓名、简介、导师与合作关系、按钮文字
- `research`：三个研究方向
- `publications`：精选论文区域标题和显示数量
- `biography`：个人简介和经历时间线
- `news`：新闻与奖项

例如修改首页简介：

```yaml
hero:
  deck: "在这里填写新的英文简介。"
```

导师和合作关系也集中放在 `hero` 中。日常更新通常只需要修改姓名、显示文字或网址：

```yaml
affiliation:
  institution: "University of Macau"
  institution_url: "https://www.um.edu.mo/"
  supervisor: "Prof. Jiantao Zhou"
  supervisor_url: "https://www.fst.um.edu.mo/personal/jtzhou/"
collaboration:
  group: "XPixel Group"
  group_url: "https://xpixel.group/"
  people:
    - name: "Prof. Chao Dong"
      url: "https://xpixel.group/2010/01/20/chaodong.html"
    - name: "Dr. Xiangyu Chen"
      url: "https://chxy95.github.io/"
```

每位合作人的 `name` 与下一行 `url` 必须成对保留。需要增加一人时，复制其中两行并修改；需要删除时，将对应的两行一起删除。

新增一条新闻时，在 `news.items` 最上方加入：

```yaml
- date: "Jul 2026"
  datetime: "2026-07"
  text: "Your latest news goes here."
```

注意：

1. 保留每一行前面的空格缩进。
2. 英文冒号、井号或特殊符号较多时，用英文双引号包住整段文字。
3. 不要使用 Tab 键缩进，只使用空格。
4. 首页默认显示最新 6 篇论文，可修改 `visible_count`。

## 2. 新增一篇论文

在 `_publications` 文件夹中复制一份现有 `.md` 文件，文件名使用：

```text
YYYY-MM-DD-short-name.md
```

推荐模板：

```yaml
---
title: "Paper Title"
collection: publications
permalink: /publication/2026-07-31-short-name
excerpt: "One sentence explaining the main contribution."
date: 2026-07-31
venue: "Conference or Journal"
paperurl: "https://arxiv.org/abs/xxxx.xxxxx"
codeurl: "https://github.com/username/repository"
projecturl: "https://example.com/project"
topic: "Research Topic"
image: "/images/publications/short-name.jpg"
image_alt: "A short description of the paper image"
---

在这里填写论文摘要或介绍。

[[Project]](https://example.com/project)
[[Code]](https://github.com/username/repository)
[[Paper]](https://arxiv.org/abs/xxxx.xxxxx)
```

字段说明：

| 字段 | 是否必填 | 用途 |
|---|---|---|
| `title` | 是 | 论文标题 |
| `collection` | 是 | 固定为 `publications` |
| `permalink` | 是 | 论文详情页地址，应保持唯一 |
| `excerpt` | 推荐 | 首页和论文列表中的一句话简介 |
| `date` | 是 | 用于自动排序，格式为 `YYYY-MM-DD` |
| `venue` | 是 | 会议或期刊 |
| `paperurl` | 推荐 | 论文链接 |
| `codeurl` | 可选 | 代码链接；没有时整行删除 |
| `projecturl` | 可选 | 项目主页；没有时整行删除 |
| `topic` | 推荐 | 卡片上方的研究类别 |
| `image` | 可选 | 论文卡片图片；没有时显示自动生成的文字占位图 |
| `image_alt` | 推荐 | 图片内容的简短描述，供无障碍阅读使用 |

论文列表和首页精选论文会自动更新，不要再手工复制论文标题到首页。

### 添加或更换论文图片

1. 将图片放入：

```text
images/publications/
```

2. 建议文件名使用论文简称，例如：

```text
images/publications/unicon.jpg
images/publications/depictqa.webp
```

3. 在论文 Markdown 顶部加入：

```yaml
image: "/images/publications/unicon.jpg"
image_alt: "Overview of the UniCon architecture"
```

推荐使用 16:10 或 16:9 横图，建议尺寸约 1600 × 1000 或 1600 × 900 像素。优先使用 JPG、PNG 或 WebP，单张图片尽量小于 1 MB。

如果想删除图片，只需删除论文文件中的 `image` 和 `image_alt` 两行。页面会自动恢复为带研究类别文字的占位图，卡片布局不会塌陷。

也可以使用外部图片链接：

```yaml
image: "https://example.com/paper-image.jpg"
image_alt: "Description of the image"
```

为了避免外部网站失效，长期维护更推荐把图片保存在 `images/publications/`。

如果使用本地 PDF：

1. 把 PDF 放入 `files` 文件夹。
2. 将 `paperurl` 写成 `/files/文件名.pdf`。
3. 文件名尽量只使用英文、数字、短横线和下划线，避免空格。

## 3. 更新个人资料

### 邮箱、GitHub 和地点

编辑 `_config.yml` 中的：

```yaml
author:
  name: "李哲远 Zheyuan LI"
  bio: "Computer Vision Researcher"
  location: "Macau"
  email: "your-email@example.com"
  github: "xiaom233"
```

`github` 只填写用户名，不要填写完整网址。

### 更新头像

最简单的方法是直接替换：

```text
images/lizheyuan.jpg
```

保持文件名不变即可。建议使用正方形照片，尺寸约 1000 × 1000 像素。

### 更新简历

直接替换：

```text
files/ZheyuanLi.pdf
```

保持文件名不变，首页和页脚的 CV 链接会自动使用新文件。

## 4. 修改顶部导航

编辑 `_data/navigation.yml`：

```yaml
main:
  - title: "Research"
    url: /#research

  - title: "Publications"
    url: /publications/
```

内部页面地址通常以 `/` 开头。外部地址应填写完整的 `https://...`。

## 5. 本地预览

### 首次安装

Windows 推荐安装 RubyInstaller 的 Ruby+Devkit，并在安装结束时完成 `ridk install`。

安装完成后，重新打开 PowerShell，在项目目录运行：

```powershell
gem install bundler
bundle install
```

第一次执行 `bundle install` 会下载项目依赖，可能需要几分钟。

### 一键启动

以后每次预览只需在项目目录运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\preview.ps1
```

看到下面的地址后，在浏览器打开：

```text
http://127.0.0.1:4000
```

修改文字并保存后，页面会自动重新生成。结束预览时在 PowerShell 按 `Ctrl + C`。

也可以直接运行标准命令：

```powershell
bundle exec jekyll serve --livereload --host 127.0.0.1 --port 4000
```

## 6. 发布更新

本项目已经按照 GitHub 用户主页仓库配置：

- 仓库名：`xiaom233.github.io`
- 站点地址：`https://xiaom233.github.io`
- `_config.yml` 中 `url` 为 `https://xiaom233.github.io`
- `baseurl` 保持为空字符串
- 依赖使用 GitHub Pages 支持的 Jekyll 插件，不需要上传生成后的 `_site` 文件夹

第一次部署时，在 GitHub 仓库中打开 **Settings → Pages**，将 **Source** 设为 **Deploy from a branch**，分支选择 `master`，目录选择 `/(root)`。以后每次推送到 `master` 后，GitHub Pages 会自动构建。

推荐使用 GitHub Desktop，基本流程是：

1. 在编辑器中修改并保存文件。
2. 在 GitHub Desktop 检查变更内容。
3. 填写简短说明，例如 `Update publications`。
4. 点击 **Commit to master**。
5. 点击 **Push origin**。
6. 等待 GitHub Pages 完成构建，然后访问 <https://xiaom233.github.io>。

如果网站没有立即更新，先等待几分钟，再强制刷新浏览器。

## 7. 安全检查清单

每次发布前建议确认：

- YAML 文件缩进没有被破坏。
- 每个 Markdown 文件顶部都有一对 `---`。
- 新论文的 `date` 和 `permalink` 正确。
- 本地 PDF、头像等文件路径真实存在。
- 外部链接以 `https://` 开头。
- 本地预览能够正常打开首页和 Publications 页面。
- 没有误删 `_layouts`、`_includes`、`assets` 或 `_sass`。

## 8. 项目结构

```text
.
├── _data/
│   ├── home.yml             # 首页主要文字
│   └── navigation.yml       # 顶部导航
├── _pages/
│   ├── about.md             # 首页内容模板，一般不修改
│   ├── publications.md      # 论文列表模板
│   └── cv.md
├── _publications/           # 每篇论文一个 Markdown 文件
├── _talks/                  # Talks
├── _portfolio/              # Life / Portfolio
├── _layouts/                # 页面结构，一般不修改
├── _includes/               # 可复用组件，一般不修改
├── assets/css/
│   └── report-theme.css     # 当前视觉主题
├── images/                  # 头像和图片
│   └── publications/        # 论文卡片图片
├── files/                   # 简历和论文 PDF
├── scripts/
│   └── preview.ps1          # Windows 本地预览
├── _config.yml              # 全站配置
└── Gemfile                  # Jekyll 依赖
```

## 9. 常见问题

### PowerShell 提示找不到 `ruby`

Ruby 没有安装，或安装后尚未重新打开 PowerShell。安装 Ruby+Devkit 后重新打开终端，再运行：

```powershell
ruby --version
```

### 提示找不到 `bundle`

运行：

```powershell
gem install bundler
```

### 提示缺少依赖

运行：

```powershell
bundle install
```

### 中文显示乱码

确保文件保存为 UTF-8，且不要使用 UTF-8 BOM。Windows 终端显示异常时可以先运行：

```powershell
chcp 65001
```

### 页面构建失败

重点检查最近修改的 `.yml` 或 Markdown 顶部字段。最常见问题是缩进错误、英文引号缺失或 `---` 被删除。

## 10. 设计文件

如果未来需要调整颜色、字体或布局，主要文件是：

- `assets/css/report-theme.css`
- `_layouts/home.html`
- `_includes/masthead.html`
- `_includes/footer.html`
- `_includes/publication-card.html`

日常内容维护不需要修改这些文件。
