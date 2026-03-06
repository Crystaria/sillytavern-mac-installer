#!/bin/bash
# SillyTavern Mac 一键安装脚本 - 双击版本
# 用法：双击此文件即可运行

# 切换到脚本所在目录
cd "$(dirname "$0")"

# 执行主安装脚本
bash install.sh

# 保持窗口打开（如果安装失败，让用户看到错误信息）
echo ""
echo "按回车键关闭此窗口..."
read -p ""
