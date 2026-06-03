# 内容工作台 · 部署指南

## 文件说明
- `index.html` — 完整网页，一个文件搞定
- `schema.sql` — Supabase 数据库建表 SQL

---

## 第一步：建 Supabase 数据库

1. 登录 https://supabase.com，进入你的项目
2. 左侧点 **SQL Editor**
3. 把 `schema.sql` 里的内容全部复制粘贴进去，点 **Run**
4. 看到 "Success" 就建好了

---

## 第二步：拿到 API 信息

1. 左侧点 **Settings → API**
2. 复制两个值：
   - **Project URL**（形如 `https://xxxxx.supabase.co`）
   - **anon public key**（很长的 JWT 字符串）

---

## 第三步：部署网页（选一种）

### 方案 A：直接用本地文件（最简单）
- 把 `index.html` 下载到电脑，双击打开就能用
- 第一次打开会弹出配置界面，填入上面的 URL 和 Key
- 配置保存在浏览器本地，下次不用再填

### 方案 B：部署到 Vercel（可以分享链接给别人）
1. 去 https://vercel.com 注册（免费）
2. 新建项目，选 "Deploy from GitHub" 或直接拖拽 `index.html` 上传
3. 部署完成后得到一个 `xxx.vercel.app` 的链接
4. 把链接发给团队成员，大家第一次打开填入 Supabase 配置即可

### 方案 C：部署到 Netlify（同样免费）
1. 去 https://netlify.com 注册
2. 把 `index.html` 拖拽到 Netlify 的 Deploy 区域
3. 自动生成链接

---

## 个人模式 vs 团队模式

- **个人模式**：数据存在 Supabase，但标记为 `personal`，其他人看不到你的内容
- **团队模式**：数据标记为 `team`，所有打开这个网页的人都能看到

两种模式可以随时切换，数据独立。

---

## 使用方式

1. 把小红书帖子截图发给 Claude
2. 说「分析这张截图，输出选题库 JSON」
3. 复制 Claude 返回的 JSON
4. 打开网页，点「导入分析结果」，粘贴 JSON，点确认
5. 内容自动分发到灵感、Hooks、标题库、CTA、文案公式等模块
