#!/bin/bash

# ============================================================================
# SillyTavern Mac 一键安装脚本
# ============================================================================
# 版本：0.1.0-alpha
# 作者：小爪 🦞 (Working with Crystaria)
# 项目：https://github.com/Crystaria/sillytavern-mac-installer
# 
# 功能：在 macOS 上全自动安装 SillyTavern
# 用法：bash install.sh
# ============================================================================

set -e  # 遇到错误立即退出

# ----------------------------------------------------------------------------
# 配置
# ----------------------------------------------------------------------------
ST_REPO="https://github.com/SillyTavern/SillyTavern"
ST_BRANCH="release"
INSTALL_DIR="$HOME/SillyTavern"
HELPER_SCRIPT="$HOME/sillytavern-helper.sh"
NODE_MIN_VERSION=18
NPM_REGISTRY="https://registry.npmmirror.com"  # 淘宝镜像

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ----------------------------------------------------------------------------
# 辅助函数
# ----------------------------------------------------------------------------

# 打印带颜色的消息
info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 打印步骤标题
step() {
    echo ""
    echo -e "${CYAN}════════════════════════════════════════${NC}"
    echo -e "${CYAN}  $1${NC}"
    echo -e "${CYAN}════════════════════════════════════════${NC}"
    echo ""
}

# 检查命令是否存在
command_exists() {
    command -v "$1" &> /dev/null
}

# 检查是否是 macOS
check_macos() {
    if [[ "$(uname)" != "Darwin" ]]; then
        error "这个脚本只能在 macOS 上运行！"
        error "当前系统：$(uname)"
        echo ""
        info "如果您使用的是 Linux 或 Windows，请访问项目页面查看其他安装方式："
        info "https://github.com/Crystaria/sillytavern-mac-installer"
        exit 1
    fi
    success "检测到 macOS 系统 ✓"
}

# 检查 Node.js 版本
check_node_version() {
    if command_exists node; then
        local version=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
        if [[ $version -ge $NODE_MIN_VERSION ]]; then
            success "Node.js 版本检查通过 ✓ (v$(node -v))"
            return 0
        else
            warning "Node.js 版本过低 (v$(node -v))，需要 v${NODE_MIN_VERSION}+"
            return 1
        fi
    else
        warning "未检测到 Node.js"
        return 1
    fi
}

# 安装 Xcode Command Line Tools
install_xcode_clt() {
    step "安装 Xcode Command Line Tools"
    
    if xcode-select -p &> /dev/null; then
        success "Xcode Command Line Tools 已安装 ✓"
        return 0
    fi
    
    info "正在安装 Xcode Command Line Tools..."
    info "这可能需要几分钟，请耐心等待..."
    echo ""
    
    # 触发安装
    xcode-select --install 2>/dev/null || true
    
    # 等待用户手动安装完成（弹窗）
    echo ""
    info "请在弹出的窗口中点击「安装」按钮"
    info "安装完成后，按回车键继续..."
    read -p ""
    
    # 验证安装
    if xcode-select -p &> /dev/null; then
        success "Xcode Command Line Tools 安装成功 ✓"
    else
        error "Xcode Command Line Tools 安装失败"
        error "请手动安装：xcode-select --install"
        exit 1
    fi
}

# 安装 Homebrew
install_homebrew() {
    step "安装 Homebrew"
    
    if command_exists brew; then
        success "Homebrew 已安装 ✓ (v$(brew --version | head -n1))"
        return 0
    fi
    
    info "正在安装 Homebrew..."
    info "这可能需要几分钟，请耐心等待..."
    echo ""
    
    # 使用国内镜像（如果检测到国内网络）
    if ping -c 1 www.baidu.com &> /dev/null; then
        info "检测到国内网络，使用清华镜像源..."
        export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
        export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
    fi
    
    # 安装 Homebrew（非交互式）
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # 添加到 PATH（Apple Silicon Mac）
    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    elif [[ -f /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
    fi
    
    if command_exists brew; then
        success "Homebrew 安装成功 ✓"
    else
        error "Homebrew 安装失败"
        error "请手动安装：/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi
}

# 安装 Git
install_git() {
    step "安装 Git"
    
    if command_exists git; then
        success "Git 已安装 ✓ (v$(git --version))"
        return 0
    fi
    
    info "正在通过 Homebrew 安装 Git..."
    brew install git
    
    if command_exists git; then
        success "Git 安装成功 ✓ (v$(git --version))"
    else
        error "Git 安装失败"
        exit 1
    fi
}

# 安装 Node.js
install_node() {
    step "安装 Node.js"
    
    if check_node_version; then
        return 0
    fi
    
    info "正在通过 Homebrew 安装 Node.js LTS..."
    brew install node@20
    
    # 添加到 PATH
    echo 'export PATH="/opt/homebrew/opt/node@20/bin:$PATH"' >> ~/.zprofile
    export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
    
    if command_exists node; then
        success "Node.js 安装成功 ✓ (v$(node -v))"
    else
        error "Node.js 安装失败"
        exit 1
    fi
}

# 克隆 SillyTavern 仓库
clone_sillytavern() {
    step "下载 SillyTavern"
    
    if [[ -d "$INSTALL_DIR" ]]; then
        warning "目录已存在：$INSTALL_DIR"
        info "检测到已安装的 SillyTavern"
        echo ""
        read -p "是否删除并重新安装？[y/N] " -n 1 -r
        echo ""
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            info "取消安装"
            exit 0
        fi
        info "正在删除旧版本..."
        rm -rf "$INSTALL_DIR"
    fi
    
    info "正在从 GitHub 克隆 SillyTavern..."
    info "仓库：$ST_REPO"
    info "分支：$ST_BRANCH"
    echo ""
    
    # 尝试克隆，失败时给出提示
    if git clone --depth 1 -b "$ST_BRANCH" "$ST_REPO" "$INSTALL_DIR"; then
        success "SillyTavern 下载成功 ✓"
    else
        error "克隆失败！可能是网络问题。"
        echo ""
        warning "建议解决方案："
        warning "1. 使用代理或加速器"
        warning "2. 手动下载：访问 https://github.com/SillyTavern/SillyTavern 下载 ZIP"
        warning "3. 使用 Gitee 镜像（如有）"
        echo ""
        info "重试一次..."
        if git clone --depth 1 -b "$ST_BRANCH" "$ST_REPO" "$INSTALL_DIR"; then
            success "重试成功 ✓"
        else
            error "重试失败，请检查网络连接"
            exit 1
        fi
    fi
}

# 安装 npm 依赖
install_dependencies() {
    step "安装依赖"
    
    cd "$INSTALL_DIR"
    
    info "配置 npm 镜像源（淘宝）..."
    npm config set registry "$NPM_REGISTRY"
    
    info "正在安装 npm 依赖..."
    info "这可能需要 5-10 分钟，请耐心等待..."
    info "提示：看到 deprecated 警告是正常的，不影响使用..."
    echo ""
    
    # 安装依赖，失败时重试（静默模式减少警告输出）
    if npm install --loglevel=error; then
        success "依赖安装成功 ✓"
    else
        warning "第一次安装失败，尝试清理缓存后重试..."
        npm cache clean --force
        if npm install; then
            success "重试成功 ✓"
        else
            error "依赖安装失败"
            error "请查看错误信息，或手动运行：cd $INSTALL_DIR && npm install"
            exit 1
        fi
    fi
}

# 生成管理脚本
generate_helper() {
    step "生成管理脚本"
    
    cat > "$HELPER_SCRIPT" << EOF
#!/bin/bash
# SillyTavern 管理脚本
# 用法：$HELPER_SCRIPT [start|stop|restart|logs|update]

ST_DIR="$INSTALL_DIR"

case "\$1" in
    start)
        echo "启动 SillyTavern..."
        cd "$ST_DIR"
        npm start
        ;;
    stop)
        echo "停止 SillyTavern..."
        pkill -f "node.*SillyTavern" || echo "未找到运行中的 SillyTavern"
        ;;
    restart)
        $0 stop
        sleep 2
        $0 start
        ;;
    logs)
        echo "查看日志（最近 50 行）..."
        cd "$ST_DIR"
        tail -n 50 logs/*.log 2>/dev/null || echo "未找到日志文件"
        ;;
    update)
        echo "更新 SillyTavern..."
        cd "$ST_DIR"
        git pull
        npm install
        echo "更新完成！"
        ;;
    *)
        echo "SillyTavern 管理脚本"
        echo ""
        echo "用法：$0 [命令]"
        echo ""
        echo "可用命令："
        echo "  start   - 启动 SillyTavern"
        echo "  stop    - 停止 SillyTavern"
        echo "  restart - 重启 SillyTavern"
        echo "  logs    - 查看日志"
        echo "  update  - 更新到最新版本"
        echo ""
        echo "示例："
        echo "  $0 start    # 启动"
        echo "  $0 logs     # 查看日志"
        ;;
esac
EOF

    chmod +x "$HELPER_SCRIPT"
    success "管理脚本已生成：$HELPER_SCRIPT"
}

# 打印完成信息
print_completion() {
    step "安装完成！🎉"
    
    echo -e "${GREEN}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║                                                      ║${NC}"
    echo -e "${GREEN}║   SillyTavern 安装成功！                             ║${NC}"
    echo -e "${GREEN}║                                                      ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    info "安装位置：$INSTALL_DIR"
    echo ""
    
    info "启动方式："
    echo "  1. 使用管理脚本（推荐）："
    echo "     ${CYAN}$HELPER_SCRIPT start${NC}"
    echo ""
    echo "  2. 手动启动："
    echo "     ${CYAN}cd $INSTALL_DIR && npm start${NC}"
    echo ""
    
    info "访问地址："
    echo "  ${CYAN}http://localhost:8000${NC}"
    echo ""
    
    warning "重要提示："
    echo "  - 首次使用需要在浏览器中配置 API Key"
    echo "  - 打开 http://localhost:8000 后，点击左侧菜单「API Connections」"
    echo "  - 选择你的 API 提供商（OpenAI、Claude 等），填入 API Key"
    echo ""
    
    info "管理命令："
    echo "  ${CYAN}$HELPER_SCRIPT${NC} - 查看所有可用命令"
    echo ""
    
    success "祝你使用愉快！🦞"
    echo ""
}

# ----------------------------------------------------------------------------
# 主流程
# ----------------------------------------------------------------------------

main() {
    echo ""
    echo -e "${CYAN}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║                                                      ║${NC}"
    echo -e "${CYAN}║   SillyTavern Mac 一键安装脚本                       ║${NC}"
    echo -e "${CYAN}║   版本：0.1.0-alpha                                  ║${NC}"
    echo -e "${CYAN}║                                                      ║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    info "这个脚本将自动为你安装 SillyTavern"
    info "整个过程约需 5-10 分钟，请耐心等待"
    echo ""
    
    # 检测是否为交互式运行
    if [[ -t 0 ]]; then
        # 交互式运行，询问确认
        read -p "是否继续？[Y/n] " -n 1 -r
        echo ""
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            info "已取消"
            exit 0
        fi
    else
        # 非交互式运行（curl | bash），自动继续
        info "检测到自动安装模式，自动继续..."
        sleep 2
    fi
    
    # 执行安装步骤
    check_macos
    install_xcode_clt
    install_homebrew
    install_git
    install_node
    clone_sillytavern
    install_dependencies
    generate_helper
    print_completion
}

# 运行主流程
main "$@"
