# Minecraft 建筑增强模组完整指南

## 📌 概述

本文档详细介绍 Minecraft 中用于增强建筑体验的各类模组，涵盖方块雕刻、家具装饰、建筑辅助工具等多个方面。无论你是建筑新手还是专业建筑玩家，都能在这里找到适合的工具。

**涵盖内容**：
- 方块雕刻模组
- 建筑材料扩展
- 家具装饰模组
- 建筑辅助工具
- 地形生成模组

## 🔨 方块雕刻与变形

### 1. Chisels & Bits - 方块雕刻革命

**模组简介**：
Chisels & Bits（凿子与组件）是 Minecraft 建筑领域最具革命性的模组之一，它允许玩家将完整的方块分解为 16×16×16 个微小方块，从而实现真正的"雕刻"体验。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/chisels-and-bits)
- [Modrinth 页面](https://modrinth.com/mod/chisels-and-bits)

**核心功能**：

| 功能 | 说明 |
|------|------|
| 方块分解 | 将任何方块分解为 4096 个微小方块 |
| 雕刻工具 | 使用凿子雕刻复杂形状 |
| 模板系统 | 保存雕刻作品以便复制 |
| 灵活放置 | 逐个放置微小方块 |

**技术规格**：
- 每个方块分解为：4096 个微小方块（16×16×16）
- 微小方块尺寸：原方块的 1/16
- 材质保持：微小方块保持原方块纹理

**使用指南**：

**1.1 基础工具合成**

```yaml
凿子：
┌───┬───┬───┐
│ 棒 │ 铁 │ 棒 │  铁棒+铁锭+木棒
├───┼───┼───┤
│     │   │
├───┼───┼───┤
│     │   │
└───┴───┴───┘

模板存储：
┌───┬───┬───┐
│ 纸 │ 纸 │ 纸 │
├───┼───┼───┤
│ 纸 │ 纸 │ 纸 │  6张纸
├───┼───┼───┤
│ 纸 │ 纸 │ 纸 │
└───┴───┴───┘
```

**1.2 方块分解流程**

1. **获取完整方块**：收集你想要雕刻的方块
2. **放置在工作台**：将方块放入 Chisels & Bits 工作台
3. **分解为微小方块**：使用凿子工具分解
4. **开始雕刻**：使用凿子逐个移除或调整微小方块
5. **保存为模板**：完成的作品可以保存

**1.3 雕刻技巧**

**浮雕雕刻**：
```
步骤：
1. 放置基础方块
2. 分解为基础层
3. 凿出凹陷区域
4. 添加细节纹理
5. 保存模板
```

**复杂造型**：
```
高级技巧：
- 组合多个分解方块
- 使用不同颜色的方块层叠
- 利用模板快速复制
- 结合红石创建动态雕刻
```

**1.4 模板系统**

**保存模板**：
```bash
# 创建新模板
/cbitstemplate create <名称>

# 保存当前雕刻
/cbitstemplate save <模板名>

# 列出所有模板
/cbitstemplate list

# 加载模板
/cbitstemplate load <模板名>
```

**1.5 与 Sodium 配合**

Chisels & Bits 在安装 Sodium 后需要进行额外配置才能获得最佳性能：

```json
{
  "rendering": {
    "enabled": true,
    "useAnisotropicFiltering": true,
    "useCulling": true,
    "maxRenderDistance": 32,
    "compatibilityMode": false
  }
}
```

**1.6 性能影响与优化**

| 配置 | FPS 影响 | 视觉质量 |
|------|----------|----------|
| 兼容性模式关闭 | 高 FPS | 高质量 |
| 兼容性模式开启 | 稳定 FPS | 略低 |
| 渲染距离降低 | 提升 FPS | - |
| 禁用粒子效果 | 提升 FPS | - |

### 2. Carpenter's Blocks - 木匠方块

**模组简介**：
Carpenter's Blocks（木匠方块）为 Minecraft 带来斜面、楼梯和各种角度的方块变体，解决了原版建筑缺少斜线的问题。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/carpenters-blocks)

**核心功能**：

| 方块类型 | 变体数量 | 用途 |
|----------|----------|------|
| 斜角方块 | 4 种角度 | 墙角装饰 |
| 楼梯方块 | 4 种角度 | 弧形楼梯 |
| 坡道方块 | 多种坡度 | 坡道建筑 |
| 屋顶方块 | 多种角度 | 屋顶建造 |

**使用指南**：

**2.1 合成配方**

```yaml
斜角木匠方块：
在木匠工作台中使用凿子右键点击任意方块
即可将其转换为斜角变体

转换规则：
- 木头方块 → 木质斜角方块
- 石砖 → 石质斜角方块
- 混凝土 → 混凝土斜角方块
```

**2.2 建筑应用**

**弧形屋顶**：
```
建造步骤：
1. 从底部开始向上建造
2. 每层使用不同角度的楼梯
3. 逐渐收拢形成弧度
4. 使用斜角方块完成顶部
```

**圆形塔楼**：
```
建造技巧：
1. 使用八角形基础
2. 每层略微收缩
3. 使用斜角方块平滑过渡
4. 顶部使用尖顶收尾
```

### 3. Chisel 2 - 方块变体专家

**模组简介**：
Chisel 2（凿子2）提供数十种方块变体，让玩家可以快速改变方块的外观，创造丰富的建筑细节。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/chisel2)

**核心功能**：

| 类别 | 变体数量 | 包含内容 |
|------|----------|----------|
| 石头类 | 12+ | 平滑、砖块、裂纹等 |
| 金属类 | 8+ | 镀锌、锈蚀等 |
| 玻璃类 | 6+ | 染色、模糊等 |
| 木材类 | 8+ | 各种纹理 |

**使用说明**：

```bash
# 右键点击方块切换变体
# 左键点击切换类别
```

**建筑应用场景**：

| 场景 | 推荐变体 | 效果 |
|------|----------|------|
| 古典墙壁 | 砖块+裂纹 | 复古质感 |
| 现代建筑 | 平滑金属+玻璃 | 简约风格 |
| 地下室 | 粗糙石头+苔藓 | 阴暗氛围 |
| 装饰细节 | 浮雕+图案 | 艺术效果 |

## 🪑 家具与装饰

### 1. Bibliocraft - 专业家具模组

**模组简介**：
Bibliocraft 是最受欢迎的家具模组之一，提供大量既美观又实用的家具物品。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/bibliocraft)
- [Modrinth 页面](https://modrinth.com/mod/bibliocraft)

**家具分类**：

| 类型 | 物品数量 | 主要功能 |
|------|----------|----------|
| 座椅类 | 8+ | 可坐家具 |
| 桌子类 | 5+ | 装饰与功能 |
| 书架类 | 6+ | 书籍存储 |
| 展示类 | 10+ | 物品展示 |
| 灯具类 | 5+ | 光源装饰 |
| 工具类 | 8+ | 实用工具 |

**详细介绍**：

**1.1 物品展示架**
```
功能：
- 展示单个物品
- 多种放置方式
- 支持旋转和倾斜
- 可在创造模式直接获取

应用场景：
- 博物馆展览
- 商店展示
- 家中装饰
```

**1.2 书架系统**
```
功能：
- 存储书籍
- 自动整理
- 标签分类
- 搜索功能

类型：
- 普通书架
- 高级书架（带标签）
- 大型书架（多格）
```

**1.3 桌子系统**
```
功能：
- 可放置物品
- 多人围坐
- 多种材质

类型：
- 木质桌子
- 玻璃桌子
- 金属桌子
```

**1.4 灯具系统**
```
功能：
- 美观光源
- 可调亮度
- 多种风格

类型：
- 壁灯
- 台灯
- 吊灯
- 落地灯
```

### 2. Little Tiles - 精密建筑系统

**模组简介**：
Little Tiles 提供更精细的建筑控制，允许玩家创建可动的机械结构和精密建筑。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/little-tiles)

**核心功能**：

| 功能 | 说明 |
|------|------|
| 子方块系统 | 将方块分割为更小单位 |
| 动画制作 | 创建动态机械结构 |
| 碰撞检测 | 完整的物理碰撞 |
| 工具增强 | 专用建造工具 |

**使用教程**：

**2.1 子方块创建**
```
1. 使用 Little 锤子右键方块
2. 选择分割方向
3. 调整分割大小
4. 获取子方块
```

**2.2 动画制作**
```
步骤：
1. 创建子方块组件
2. 设置动画关键帧
3. 配置运动轨迹
4. 添加触发条件
```

### 3. Decorative Blocks - 装饰方块

**模组简介**：
Decorative Blocks 提供一系列简洁美观的装饰方块，适合现代简约风格建筑。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/decorative-blocks)

**方块列表**：

| 方块 | 材质 | 用途 |
|------|------|------|
| 链锁 | 铁/金 | 悬挂装饰 |
| 栏杆 | 多种材质 | 安全装饰 |
| 壁灯 | 多种风格 | 光源 |
| 旗帜 | 可定制 | 装饰标识 |

### 4. Wallpaper - 墙纸系统

**模组简介**：
Wallpaper 允许玩家为墙壁添加各种图案和纹理，快速改变房间氛围。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/wallpaper)

**功能特点**：
- 多种图案可选
- 支持自定义纹理
- 易于安装和移除
- 与大多数模组兼容

## 🏗️ 建筑辅助工具

### 1. Tweakeroo - 多功能辅助工具

**模组简介**：
Tweakeroo 是一个多功能辅助模组，提供了大量便捷的建筑和生活功能。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/tweakeroo)
- [Modrinth 页面](https://modrinth.com/mod/tweakeroo)

**核心功能**：

| 功能 | 说明 | 使用方式 |
|------|------|----------|
| 灵活放置 | 自由放置方块 | Alt + 右键 |
| 方块预览 | 查看内部结构 | Shift + 右键 |
| 精确移动 | 像素级移动 | Ctrl + 移动 |
| 模式切换 | 快速切换模式 | 快捷键 |

**详细功能**：

**1.1 灵活放置模式**
```
启用：按 P 打开模组菜单
使用方法：
- Alt + 右键：放置方块
- 可穿透半透明方块放置
- 适合复杂空间建造
```

**1.2 方块预览**
```
功能：
- 查看方块内部
- 识别隐藏物品
- 预览管道连接

使用方法：
- Shift + 右键点击方块
- 显示内部物品和结构
```

**1.3 精确模式**
```
功能：
- 像素级移动
- 对齐到网格
- 精确放置

使用方法：
- Ctrl + WASD：像素移动
- 适合精密建筑
```

### 2. Mouse Wheelie - 鼠标滚轮增强

**模组简介**：
Mouse Wheelie 通过鼠标滚轮增强物品交互，提供更便捷的建筑体验。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/mouse-wheelie)
- [Modrinth 页面](https://modrinth.com/mod/mouse-wheelie)

**核心功能**：

| 功能 | 说明 |
|------|------|
| 快速堆叠 | 滚轮快速堆叠物品 |
| 批量放置 | 快速放置多个方块 |
| 快捷操作 | 快速切换工具 |
| 方向控制 | 滚轮控制放置方向 |

### 3. Carpet Mod - 技术辅助工具

**模组简介**：
Carpet Mod 提供大量技术性功能，是专业建筑和红石玩家的必备工具。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/carpet)
- [GitHub 仓库](https://github.com/gnembon/fabric-carpet)

**建筑相关功能**：

| 功能 | 代码 | 说明 |
|------|------|------|
| fillCommand | /fill | 批量填充方块 |
| setBlockCommand | /setblock | 精确放置方块 |
| cloneCommand | /clone | 复制区域 |
| 精确放置 | accurateBlockPlacement | 精确放置控制 |

**常用指令**：

```bash
# 批量填充
/fill ~-10 ~-10 ~-10 ~10 ~10 ~10 stone

# 精确放置
/setblock ~ ~ ~ stone

# 复制区域
/clone ~-5 ~-5 ~-5 ~5 ~5 ~5 ~10 ~ ~10

# 替换方块
/replaceitem block ~ ~ ~ slot.container.0 diamond 64
```

### 4. MiniHUD - 信息显示增强

**模组简介**：
MiniHUD 提供丰富的信息叠加层，帮助玩家在建筑时获取实时数据。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/minihud)

**显示选项**：

| 显示类型 | 说明 |
|----------|------|
| 区块边界 | 显示区块网格 |
| 实体数量 | 显示区域实体数 |
| 红石状态 | 显示红石信号 |
| 光照等级 | 显示光照分布 |
| 生物群系 | 显示生物群系边界 |

## 🌍 地形与环境

### 1. Terralith - 超世界生成

**模组简介**：
Terralith 是一个世界生成模组，添加了超过 85 种新的生物群系和结构。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/terralith)
- [Modrinth 页面](https://modrinth.com/mod/terralith)

**新增内容**：

| 类别 | 数量 | 示例 |
|------|------|------|
| 生物群系 | 85+ | 天空岛屿、地下洞穴 |
| 结构 | 30+ | 废弃城堡、神庙 |
| 矿物 | 10+ | 水晶、红宝石 |

**建筑灵感**：

| 生物群系 | 建筑风格 | 推荐材料 |
|----------|----------|----------|
| 樱花林 | 东方风格 | 樱花木、竹子 |
| 沙漠神殿 | 古埃及风格 | 砂岩、石柱 |
| 雪山峰 | 探险风格 | 雪石、冰块 |
| 蘑菇林 | 童话风格 | 蘑菇、红木 |

### 2. Incendium - 地狱增强

**模组简介**：
Incendium 大幅增强了下界体验，添加了新的生物群系、结构和敌人。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/incendium)

**建筑材料**：

| 材料 | 来源 | 用途 |
|------|------|------|
| 烈焰木 | 烈焰森林 | 建筑骨架 |
| 下界砖 | 下界堡垒 | 装饰砖块 |
| 灵魂石 | 灵魂沙峡谷 | 灵魂火焰效果 |

### 3. Nullscape - 末地增强

**模组简介**：
Nullscape 为末地增添了新的维度和建筑可能性。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/nullscape)

**建筑材料**：

| 材料 | 特性 | 用途 |
|------|------|------|
| 紫颂木 | 漂浮效果 | 高空建筑 |
| 末地石变体 | 多种纹理 | 地面铺设 |
| 潜影壳 | 防护效果 | 装饰 |

## 📦 推荐建筑模组组合

### 新手建筑组合

**目标**：简单易用，快速上手

```
必备：
├── fabric-api
├── malilib
└── litematica

推荐：
├── tweakeroo
├── mouse-wheelie
├── bibliocraft
└── decorative-blocks
```

### 进阶建筑组合

**目标**：完整建筑体验

```
必备：
├── fabric-api
├── malilib
├── litematica
├── sodium
├── tweakeroo
├── mouse-wheelie
└── carpet

装饰：
├── bibliocraft
├── decorative-blocks
└── wallpapers

扩展：
├── chisels-and-bits
├── carpenters-blocks
└── little-tiles

地形：
├── terralith
├── incendium
└── nullscape
```

### 专业建筑组合

**目标**：最高自由度

```
全部组合加上：
├── chisel-2
├── little-tiles
├── malilib-extensions
├── carpet-extra
├── minihud
└── xaeros-world-map
```

## 💡 建筑技巧与教程

### 基础技巧

**1. 方块选择原则**
```
颜色协调：
- 主色：60%
- 辅色：30%
- 点缀色：10%

材质搭配：
- 木材：温暖感
- 石头：厚重感
- 玻璃：通透感
- 金属：现代感
```

**2. 建筑比例**
```
黄金比例：
- 高度：宽度 = 1：1.618
- 楼层高度：2-3 方块
- 房间大小：5-10 方块

常见比例：
- 门：2×3 方块
- 窗：1×2 或 2×2 方块
- 楼梯：3×3（半砖）
```

### 进阶技巧

**1. 视觉欺骗**
```
技巧：
- 使用半透明方块模拟
- 利用光影创造深度
- 斜面减少方块感
- 错层增加层次
```

**2. 动态建筑**
```
方法：
- 使用活塞实现开关效果
- 添加水流或岩浆
- 使用红石灯光系统
- 引入移动元素
```

### 专业技巧

**1. 大型项目管理**
```
步骤：
1. 创建总规划图
2. 分区域保存原理图
3. 分批建造
4. 统一细节处理
5. 整体协调优化
```

**2. 团队协作**
```
工具：
- Litematica 共享原理图
- 明确分工区域
- 统一建筑风格
- 定期进度同步
```

## 🔗 相关资源链接

### 官方资源
- **Chisels & Bits Wiki**：
  https://github.com/ChiselsAndBits/ChiselsAndBits/wiki
- **Bibliocraft 文档**：
  https://bibliocraft-mod.github.io/
- **Litematica Wiki**：
  https://github.com/Defenastrator/litematica/wiki

### 社区资源
- **建筑灵感图库**：https://www.reddit.com/r/Minecraft/
- **教程视频**：YouTube/Bilibili 搜索 Minecraft building
- **原理图分享**：https://www.planetminecraft.com/

### 资源下载
- **CurseForge 建筑模组**：
  https://www.curseforge.com/minecraft/mc-mods?filter-sort=popularity&filter-game-version=2020709689%3A7499
- **Modrinth**：
  https://modrinth.com/mods?categories=utility

---

**最后更新**：2025年1月22日
**适用版本**：Minecraft 1.14 - 1.21.x
**维护者**：EF-Cosmos