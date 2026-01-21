# Fabric 服务器管理类插件完整指南

## 📌 概述

Fabric 服务器相比传统 Bukkit/Spigot 服务器有其独特的优势：更高的性能、更好的模组兼容性以及更灵活的配置方式。本文档详细介绍 Fabric 服务器必备的管理类插件，帮助服主构建稳定、高效的 Minecraft 游戏环境。

本文档基于 GitHub 上维护的 [Awesome Fabric server-side mods](https://github.com/phomc/awesome-fabric-server-mods) 和 [supsm/fabric-serverside-mods](https://github.com/supsm/fabric-serverside-mods) 等资源整理而成。

## 🏢 权限管理

### 1. LuckPerms - 专业权限管理

**模组简介**：
LuckPerms 是 Minecraft 领域最强大、最灵活的权限管理插件，支持 Fabric、Forge、Bukkit 等多种平台。它提供了详细的权限控制、继承系统、临时权限和跨服同步等功能。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/luckperms)
- [Modrinth 页面](https://modrinth.com/mod/luckperms)
- [官方文档](https://luckperms.net/wiki)
- [GitHub 仓库](https://github.com/LuckPerms/LuckPerms)

**核心功能**：
- **细粒度权限控制**：精确到每个指令、每个操作
- **权限继承**：支持组继承和权限叠加
- **临时权限**：设置有时限的权限
- **元数据**：为玩家和组添加自定义属性
- **跨服同步**：支持多种存储后端（MySQL、SQLite、H2）
- **Web 编辑器**：在线编辑权限配置

**安装要求**：
- Minecraft 1.8 - 1.21.x
- Fabric API（必需）
- 建议配合 Fabric Permissions API 使用

**详细配置**：

**1.1 基础设置**

```yaml
# config/luckperms/luckperms.conf
storage-method: H2
data-source: h2
table-prefix: "lp_"

# 同步设置
sync-minutes: 10
watch-files: true

# 日志设置
log-notify: true
```

**1.2 常用权限指令**

```bash
# 玩家权限管理
/lp user <玩家名> permission set <权限节点> true
/lp user <玩家名> permission unset <权限节点>
/lp user <玩家名> parent add <组名>
/lp user <玩家名> parent remove <组名>

# 组管理
/lp creategroup <组名>
/lp deletegroup <组名>
/lp group <组名> permission set <权限节点> true

# 权限继承
/lp group <子组> parent add <父组>
```

**1.3 权限节点示例**

```yaml
# 管理员组配置示例
default:
  permissions:
    - modifyworld.*
    - Essentials.spawn
    - Essentials.help

builder:
  inherits: default
  permissions:
    - worldedit.*
    - litematica.use

moderator:
  inherits: builder
  permissions:
    - luckperms.user.*
    - Essentials.ban
    - Essentials.kick
    - Essentials.mute

admin:
  inherits: moderator
  permissions:
    - '*'
```

**1.4 高级功能配置**

```yaml
# 上下文配置
contexts:
  server:
    - default
  world:
    - survival
    - creative

# 权限追踪
track:
  - default
  - builder
  - moderator
  - admin

# Web 编辑器
web-editor:
  enabled: true
  port: 8080
```

### 2. FTB Ranks - 简单权限系统

**模组简介**：
FTB Ranks 是由 FTB Team 开发的轻量级权限管理模组，设计简洁，易于上手，适合中小型服务器使用。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/ftb-ranks)
- [Modrinth 页面](https://modrinth.com/mod/ftb-ranks)

**核心功能**：
- **简洁的权限层级**：直观的等级系统
- **条件权限**：基于条件的权限分配
- **与 FTB Chunks 集成**：支持领地权限

**配置示例**：

```json
{
  "ranks": {
    "default": {
      "priority": 0,
      "permissions": [
        "minecraft.command.help",
        "ftbchunks.minimap"
      ]
    },
    "vip": {
      "priority": 100,
      "parents": ["default"],
      "permissions": [
        "ftbchunks.claim",
        "litematica.use"
      ]
    },
    "mod": {
      "priority": 1000,
      "parents": ["vip"],
      "permissions": [
        "minecraft.command.ban",
        "minecraft.command.kick"
      ]
    }
  }
}
```

### 3. Player Roles - 玩家身份系统

**模组简介**：
Player Roles 提供了一套完整的玩家身份管理系统，支持自定义角色、权限分配和特殊能力。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/player-roles)

**核心功能**：
- **自定义角色**：创建任意数量的玩家角色
- **权限分配**：精细的权限控制
- **聊天前缀**：自定义玩家显示名称
- **与 Fabric Permissions API 集成**

## 📋 基础指令插件

### 1. Essential Commands - 基础指令集

**模组简介**：
Essential Commands 提供了一系列服务器管理所需的基础指令，包括传送、回家、设置家点等功能。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/essential-commands)

**核心指令**：

| 指令 | 功能 | 所需权限 |
|------|------|----------|
| `/home <名称>` | 传送到已保存的家 | ec.home.use |
| `/sethome <名称>` | 设置家的位置 | ec.sethome.use |
| `/delhome <名称>` | 删除家点 | ec.delhome.use |
| `/spawn` | 传送到出生点 | ec.spawn.use |
| `/back` | 返回上一个位置 | ec.back.use |
| `/tpa <玩家>` | 请求传送到玩家 | ec.tpa.use |
| `/warp <名称>` | 传送到地标点 | ec.warp.use |

**配置示例**：

```json
{
  "homes": {
    "maxPerPlayer": 3,
    "costPerHome": 0,
    "warmup": 3,
    "cooldown": 30
  },
  "warps": {
    "enabled": true,
    "costPerWarp": 0
  },
  "spawn": {
    "spawnOnJoin": true,
    "spawnSetOnFirstJoin": true
  }
}
```

### 2. QuickTeleports - 快速传送

**模组简介**：
QuickTeleports 提供便捷的传送请求系统，支持 TPA、TPHere 等功能，带有请求确认机制。

**核心功能**：
- **TPA 请求**：请求传送到其他玩家
- **TPHere 请求**：请求其他玩家传送到自己
- **请求确认**：对方确认后立即传送
- **请求拒绝**：礼貌拒绝传送请求

**使用示例**：

```bash
/tpa PlayerName    # 请求传送到 PlayerName
/tpahere PlayerName  # 请求 PlayerName 传送到自己
/tpaccept         # 接受传送请求
/tpdeny           # 拒绝传送请求
```

### 3. QuickHomes - 快速回家

**模组简介**：
QuickHomes 专注于提供快速、稳定的回家功能，支持多家园管理和快捷键操作。

**核心功能**：
- **多家园支持**：设置多个家点
- **家园列表**：查看和管理所有家点
- **快捷键绑定**：快速传送回家
- **家园邀请**：邀请其他玩家访问

### 4. FabricWarps - 地标系统

**模组简介**：
FabricWarps 提供服务器地标（warp）功能，管理员可以设置公共传送点。

**核心功能**：
- **创建地标**：管理员设置地标位置
- **地标列表**：列出所有可用地点
- **地标分类**：为地标添加标签
- **地标描述**：显示地标信息

**管理指令**：

```bash
/setwarp <名称>    # 创建地标
/delwarp <名称>    # 删除地标
/warp <名称>       # 使用地标传送
/warp list        # 列出所有地标
```

### 5. RandomTP - 随机传送

**模组简介**：
RandomTP 为玩家提供安全的随机传送功能，探索未知区域。

**核心功能**：
- **安全检测**：避免传送到危险区域
- **距离限制**：设置最大传送距离
- **冷却时间**：防止滥用
- **黑名单区域**：排除特定生物群系

**配置示例**：

```json
{
  "minDistance": 1000,
  "maxDistance": 5000,
  "cooldown": 30,
  "blacklistedBiomes": [
    "minecraft:ocean",
    "minecraft:deep_ocean"
  ],
  "checkForLiquid": true,
  "checkForStructure": true
}
```

## 🔐 身份验证插件

### EasyAuth - 离线模式安全验证

**模组简介**：
EasyAuth 为 Fabric 服务器提供玩家身份验证功能，保护离线模式服务器的玩家账户安全。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/easyauth)

**核心功能**：
- **密码验证**：设置和验证登录密码
- **注册系统**：新玩家需要注册
- **会话管理**：登录后保持验证状态
- **安全保护**：防止盗号

**配置示例**：

```json
{
  "requireRegistration": true,
  "sessionTimeout": 3600,
  "maxPasswordLength": 64,
  "minPasswordLength": 6,
  "passwordHashAlgorithm": "SHA-256",
  "loginMessages": {
    "registered": "§a你已经成功注册！请使用 /login <密码> 登录",
    "loggedIn": "§a欢迎回来！你已成功登录",
    "invalidPassword": "§c密码错误！请重试"
  }
}
```

**使用流程**：

```
1. 新玩家进入游戏
2. 系统提示设置密码：/register <密码>
3. 每次登录时：/login <密码>
4. 登录成功后自动解锁玩家
```

## 📊 信息查询插件

### 1. Ledger - 操作记录系统

**模组简介**：
Ledger 是一个全面的操作记录系统，记录所有方块破坏、放置、物品交互等操作，支持回滚和查询。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/ledger)

**核心功能**：
- **操作记录**：记录所有方块操作
- **破坏追踪**：追踪物品破坏和放置
- **玩家查询**：查看玩家的所有操作
- **区域查询**：查询特定区域的操作记录
- **回滚功能**：撤销恶意破坏

**配置示例**：

```json
{
  "storage": {
    "type": "h2",
    "path": "./ledger"
  },
  "recording": {
    "blockBreak": true,
    "blockPlace": true,
    "itemUse": true,
    "containerAccess": true
  },
  "retention": {
    "days": 30,
    "autoClean": true
  }
}
```

**查询指令**：

```bash
/ledger check <玩家>        # 查看玩家操作
/ledger range <范围>        # 查看区域操作
/ledger rollback <玩家> <时间>  # 回滚操作
/ledger lookup <方块>       # 查找特定方块操作
```

### 2. Inv View - 玩家背包查看

**模组简介**：
Inv View 允许管理员和安全系统查看玩家的背包和末影箱内容，用于监管和查询。

**核心功能**：
- **背包查看**：查看玩家物品栏
- **末影箱查看**：查看末影箱内容
- **存档查询**：查询离线玩家背包
- **安全审计**：追踪物品来源

**管理指令**：

```bash
/invview <玩家>       # 查看玩家背包
/invview <玩家> ender  # 查看玩家末影箱
```

## 🛡️ 领地保护插件

### 1. FTB Chunks - 区块保护系统

**模组简介**：
FTB Chunks 是 FTB Team 开发的区块保护和领取系统，提供直观的区块管理和团队共享功能。

**官方资源**：
- [CurseForge 页面](https://www.curseforge.com/minecraft/mc-mods/ftb-chunks)
- [Modrinth 页面](https://modrinth.com/mod/ftb-chunks)

**核心功能**：
- **区块领取**：玩家可以领取并保护区块
- **团队共享**：团队成员共享领取区块
- **权限控制**：为不同玩家设置不同权限
- **小地图集成**：集成详细小地图显示
- **与 FTB Ranks 集成**：使用权限组管理

**配置示例**：

```json
{
  "chunkClaiming": {
    "maxChunksPerPlayer": 100,
    "chunkClaimRadius": 5,
    "requireInfiniteBlocks": false
  },
  "protection": {
    "enableProtection": true,
    "blockBreaking": "owner_or_shared",
    "blockPlacement": "owner_or_shared",
    "interactWithBlocks": "owner_or_shared",
    "openContainers": "owner_or_shared"
  },
  "mapping": {
    "showChunkGrid": true,
    "showClaimedChunks": true,
    "showPlayerPosition": true
  }
}
```

**使用指南**：

```bash
# 基础操作
/ftbchunks claim           # 领取当前区块
/ftbchunks unclaim         # 取消领取当前区块
/ftbchunks chunks          # 查看已领取区块列表

# 共享设置
/ftbchunks addmember <玩家>   # 添加成员到区块
/ftbchunks removemember <玩家>  # 从区块移除成员

# 查看地图
/ftbchunks map             # 打开区块地图
```

### 2. Sewing Machine Utilities - 综合工具

**模组简介**：
Sewing Machine Utilities 是一个综合性的服务器工具模组，包含区块保护、权限管理等功能。

**核心功能**：
- **区块声明**：简单的区块保护系统
- **权限控制**：基于玩家的权限设置
- **工具加强**：增强游戏工具
- **自定义配方**：添加新合成配方

### 3. Hey That's Mine - 箱子锁

**模组简介**：
Hey That's Mine (HTM) 提供简单易用的箱子锁功能，保护玩家的储存容器。

**核心功能**：
- **自动上锁**：首次使用自动锁定
- **共享访问**：添加信任玩家
- **红石控制**：支持红石信号控制
- **访客日志**：记录谁访问过

**使用示例**：

```bash
# 基础操作
/htm lock                 # 锁定当前容器
/htm unlock               # 解锁容器
/htm trust <玩家>         # 添加信任玩家
/htm untrust <玩家>       # 移除信任玩家

# 高级操作
/htm access list          # 查看有权限的玩家
/htm access modify        # 修改访问权限
```

## 🔧 服务器配置优化

### JVM 参数优化

```bash
# 4GB 内存服务器推荐配置
java -Xmx4G -Xms2G -XX:+UseG1GC -XX:+ParallelRefProcEnabled \
    -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions \
    -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=50 \
    -jar fabric-server-launch.jar nogui

# 8GB 内存服务器推荐配置
java -Xmx8G -Xms4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled \
    -XX:MaxGCPauseMillis=100 -XX:+UnlockExperimentalVMOptions \
    -XX:G1NewSizePercent=40 -XX:G1MaxNewSizePercent=60 \
    -XX:G1HeapRegionSize=16M -jar fabric-server-launch.jar nogui
```

### server.properties 优化

```properties
# 视距设置（根据服务器负载调整）
view-distance=8
simulation-distance=4

# 玩家数量
max-players=50

# 游戏设置
difficulty=normal
allow-flight=true
spawn-protects=16

# 性能设置
max-tick-time=-1
network-compression-threshold=256
```

## 📈 服务器维护建议

### 1. 定期维护任务

```bash
# 每日任务
/forge tps                    # 检查服务器 TPS
/ledger clean 30             # 清理30天前的记录
/checklag                    # 检查并优化性能

# 每周任务
/restart                     # 重启服务器清理内存
/chunkgc run                 # 强制执行区块垃圾回收
```

### 2. 性能监控

推荐安装以下监控工具：

- **Spark**：详细的性能分析器
- **LagGoggles**：延迟来源分析
- **BrainStone's SPS**：服务器性能监控

### 3. 备份策略

```bash
# 自动备份脚本示例（crontab）
0 3 * * * tar -czf /backup/world_$(date +%Y%m%d).tar.gz /path/to/world
0 4 * * 0 mysqldump -u backup -p'password' luckperms > /backup/luckperms_$(date +%Y%m%d).sql
```

## ⚠️ 常见问题与解决方案

### 问题1：玩家无法使用指令

**原因**：权限配置问题

**解决方案**：
1. 检查 LuckPerms 配置
2. 确认玩家所属组有对应权限
3. 使用 `/lp user <玩家> check <权限>` 检查权限状态
4. 重载权限：`/lp sync`

### 问题2：区块领取失败

**原因**：超出限制或位置冲突

**解决方案**：
1. 检查是否达到最大领取数量限制
2. 确认位置未被其他玩家领取
3. 检查 FTB Chunks 配置文件
4. 尝试在更远的位置领取

### 问题3：Ledger 记录过多导致卡顿

**原因**：数据库记录过多

**解决方案**：
1. 调整记录保留天数
2. 定期执行清理命令
3. 考虑使用外部数据库
4. 禁用不必要的记录选项

### 问题4：EasyAuth 登录问题

**原因**：会话超时或密码错误

**解决方案**：
1. 检查会话超时设置
2. 确认密码输入正确
3. 验证密码哈希算法配置
4. 重置密码（需要管理员操作）

## 📚 参考资源

- **Awesome Fabric server-side mods**：
  https://github.com/phomc/awesome-fabric-server-mods

- **Fabric 服务器模组索引**：
  https://www.mcmod.cn/post/2318.html

- **LuckPerms 官方文档**：
  https://luckperms.net/wiki/

- **FTB Chunks 使用指南**：
  https://docs.feed-the-beast.com/chunks/

---

**最后更新**：2025年1月22日
**适用版本**：Minecraft 1.14 - 1.21.x