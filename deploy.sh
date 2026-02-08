#!/bin/bash

# Picsur Zeabur 部署腳本
# 此腳本用於快速部署 Picsur 到 Zeabur

set -e

echo "🚀 Picsur Zeabur 部署工具"
echo "=========================="
echo ""

# 檢查是否有 picsur-template.yaml
if [ ! -f "picsur-template.yaml" ]; then
    echo "❌ 錯誤：找不到 picsur-template.yaml 檔案"
    echo "請確保你在正確的目錄中執行此腳本"
    exit 1
fi

echo "選擇部署方式："
echo "1) 部署到 Zeabur（測試用）"
echo "2) 發布為公開模板"
echo "3) 取消"
echo ""

read -p "請輸入選項 (1-3): " choice

case $choice in
    1)
        echo ""
        echo "📦 開始部署到 Zeabur..."
        echo ""
        npx zeabur@latest template deploy -f picsur-template.yaml
        ;;
    2)
        echo ""
        echo "📢 發布模板到 Zeabur Marketplace..."
        echo ""
        echo "⚠️  注意：發布前請確保："
        echo "   - 模板已經測試過"
        echo "   - 所有資訊都正確填寫"
        echo "   - 符合 Zeabur 的模板貢獻要求"
        echo ""
        read -p "確定要發布嗎？(y/N): " confirm
        
        if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
            npx zeabur@latest template create -f picsur-template.yaml
        else
            echo "已取消發布"
        fi
        ;;
    3)
        echo "已取消"
        exit 0
        ;;
    *)
        echo "❌ 無效的選項"
        exit 1
        ;;
esac

echo ""
echo "✅ 完成！"
