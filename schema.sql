-- ================================
-- 小红书内容工作台 · Supabase Schema
-- 在 Supabase Dashboard > SQL Editor 里运行这段 SQL
-- ================================

-- 标签表
create table if not exists tags (
  id uuid default gen_random_uuid() primary key,
  name text not null unique,
  created_at timestamptz default now()
);

-- 主内容表
create table if not exists items (
  id uuid default gen_random_uuid() primary key,
  module text not null check (module in ('inspire','hooks','titles','cta','breakdown','formulas','comments')),
  mode text not null default 'personal' check (mode in ('personal','team')),
  title text,
  note text,
  keywords text,
  hook text,
  emotion text,
  emotion_why text,
  title_pattern text,
  title_why text,
  formula text,
  formula_name text,
  formula_ex text,
  cta text,
  cta_goal text,
  cta_scene text,
  interaction text,
  question text,
  freq text,
  answer text,
  img_data text,        -- base64 图片（可选）
  tags text[] default '{}',
  source_title text,    -- 原帖标题备注
  created_at timestamptz default now()
);

-- 默认标签
insert into tags (name) values
  ('爆款'),('种草'),('干货'),('情感'),('穿搭'),('美食'),('测评'),('教程')
on conflict (name) do nothing;

-- 开启 Row Level Security（RLS）
alter table items enable row level security;
alter table tags enable row level security;

-- 允许匿名读写（适合团队共享；如需登录保护可修改）
create policy "allow all" on items for all using (true) with check (true);
create policy "allow all" on tags for all using (true) with check (true);
