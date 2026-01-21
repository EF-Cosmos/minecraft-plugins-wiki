#!/bin/bash

# Minecraft 插件文档 GitHub 上传脚本
# 使用方法: bash upload-to-github.sh <你的GitHub用户名>

# 检查参数
if [ -z "$1" ]; then
    echo "用法: bash upload-to-github.sh <你的GitHub用户名>"
    echo "示例: bash upload-to-github.sh EF-Cosmos"
    exit 1
fi

GITHUB_USERNAME=$1
REPO_NAME="minecraft-plugins-wiki"
COMMIT_MESSAGE="添加 Minecraft 建筑工具、服务器插件和优化插件详细文档"

echo "================================================"
echo "Minecraft 插件文档 GitHub 上传工具"
echo "================================================"
echo ""
echo "配置信息："
echo "- GitHub 用户名: $GITHUB_USERNAME"
echo "- 仓库名称: $REPO_NAME"
echo ""
echo "请选择操作："
echo "1. 创建新仓库并上传"
echo "2. 上传到现有仓库"
echo "3. 初始化 Git 并显示上传命令（手动执行）"
echo ""
read -p "请输入选项 (1/2/3): " choice

case $choice in
    1)
        echo ""
        echo "步骤 1: 创建 GitHub 仓库..."
        echo "请访问以下链接创建仓库:"
        echo "https://github.com/new?name=$REPO_NAME&description=Minecraft+Plugins+Wiki"
        echo ""
        echo "创建仓库后，请运行选项 2 或手动执行以下命令:"
        echo ""
        echo "git init"
        echo "git add -A"
        echo "git commit -m \"$COMMIT_MESSAGE\""
        echo "git branch -M main"
        echo "git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
        echo "git push -u origin main"
        ;;
        
    2)
        echo ""
        echo "步骤 1: 检查远程仓库..."
        git remote get-url origin > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "未配置远程仓库，正在配置..."
            read -p "请输入仓库完整路径 (例如: https://github.com/$GITHUB_USERNAME/$REPO_NAME.git): " repo_url
            git remote add origin "$repo_url"
        fi
        
        echo "步骤 2: 初始化 Git（如果尚未初始化）..."
        if [ ! -d .git ]; then
            git init
            git branch -M main
        fi
        
        echo "步骤 3: 添加所有文件..."
        git add -A
        
        echo "步骤 4: 创建提交..."
        git commit -m "$COMMIT_MESSAGE"
        
        echo "步骤 5: 推送到 GitHub..."
        echo "如果这是第一次推送，可能需要输入 GitHub 凭据"
        git push -u origin main
        
        if [ $? -eq 0 ]; then
            echo ""
            echo "================================================"
            echo "✓ 上传成功！"
            echo "================================================"
            echo "仓库地址: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
            echo ""
        else
            echo ""
            echo "上传失败，请检查:"
            echo "1. 仓库是否存在"
            echo "2. GitHub 凭据是否正确"
            echo "3. 网络连接是否正常"
        fi
        ;;
        
    3)
        echo ""
        echo "手动执行以下命令："
        echo ""
        echo "# 1. 初始化 Git 仓库"
        echo "git init"
        echo "git branch -M main"
        echo ""
        echo "# 2. 添加所有文档"
        echo "git add -A"
        echo ""
        echo "# 3. 创建提交"
        echo "git commit -m \"$COMMIT_MESSAGE\""
        echo ""
        echo "# 4. 添加远程仓库"
        echo "git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
        echo ""
        echo "# 5. 推送到 GitHub"
        echo "git push -u origin main"
        echo ""
        echo "# 如果遇到权限问题，可以使用以下方式认证："
        echo "# - Personal Access Token (推荐)"
        echo "# - SSH 密钥"
        echo ""
        ;
        
    *)
        echo "无效选项，请重新运行脚本"
        exit 1
        ;;
esac

echo ""
echo "完成！"