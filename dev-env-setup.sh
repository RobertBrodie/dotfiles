#!/usr/bin/env bash
set -euo pipefail

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Automated setup for development environment tools.

Options:
  -h, --help    Show this help message and exit

Tools configured:
  symlinks      Creates ~/.tmux.conf, ~/.vimrc and ~/.zshrc symlinks to this repo
  tmux          Installs TPM (Tmux Plugin Manager) and declared plugins
  vim           Installs Vundle and declared plugins (including NERDTree)
  zsh           Installs oh-my-zsh custom plugins
EOF
}

for arg in "$@"; do
    case "$arg" in
        -h|--help)
            usage
            exit 0
            ;;
        *)
            echo "Unknown option: $arg" >&2
            usage >&2
            exit 1
            ;;
    esac
done

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# --- Symlinks ---
echo "==> Creating dotfile symlinks"

link() {
    local src="$1" dst="$2"
    if [ -L "$dst" ]; then
        echo "    $dst already a symlink, skipping."
    elif [ -e "$dst" ]; then
        echo "    Backing up existing $dst to ${dst}.bak"
        mv "$dst" "${dst}.bak"
        ln -s "$src" "$dst"
        echo "    Linked $dst -> $src"
    else
        ln -s "$src" "$dst"
        echo "    Linked $dst -> $src"
    fi
}

link "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
link "$DOTFILES_DIR/.vimrc"     "$HOME/.vimrc"
link "$DOTFILES_DIR/.zshrc"     "$HOME/.zshrc"

echo "==> Done. Symlinks created."

TPM_DIR="$HOME/.tmux/plugins/tpm"
TPM_REPO="https://github.com/tmux-plugins/tpm"

echo "==> Installing TPM and tmux plugins"

# Install TPM
if [ -d "$TPM_DIR/.git" ]; then
    echo "    TPM already installed, updating..."
    git -C "$TPM_DIR" pull --ff-only
else
    echo "    Cloning TPM into $TPM_DIR..."
    mkdir -p "$(dirname "$TPM_DIR")"
    git clone "$TPM_REPO" "$TPM_DIR"
fi

# Install all plugins declared in .tmux.conf
echo "==> Installing plugins via TPM..."
"$TPM_DIR/bin/install_plugins"

echo "==> Done. Plugins installed successfully."

# --- Vim: Vundle + plugins ---
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"
VUNDLE_REPO="https://github.com/VundleVim/Vundle.vim.git"

echo "==> Installing Vundle and Vim plugins"

if [ -d "$VUNDLE_DIR/.git" ]; then
    echo "    Vundle already installed, updating..."
    git -C "$VUNDLE_DIR" pull --ff-only
else
    echo "    Cloning Vundle into $VUNDLE_DIR..."
    mkdir -p "$(dirname "$VUNDLE_DIR")"
    git clone "$VUNDLE_REPO" "$VUNDLE_DIR"
fi

echo "==> Installing Vim plugins..."

clone_vim_plugin() {
    local repo="$1" name="${1##*/}" dst="$HOME/.vim/bundle/$name"
    if [ -d "$dst/.git" ]; then
        echo "    $name already installed, updating..."
        git -C "$dst" pull --ff-only
    else
        echo "    Cloning $name..."
        git clone "https://github.com/${repo}.git" "$dst"
    fi
}

clone_vim_plugin preservim/nerdtree

echo "==> Done. Vim plugins installed successfully."

# --- ZSH: oh-my-zsh custom plugins ---
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo "==> Installing oh-my-zsh custom plugins"

clone_zsh_plugin() {
    local repo="$1" name="${1##*/}" dst="$ZSH_CUSTOM/plugins/$name"
    if [ -d "$dst/.git" ]; then
        echo "    $name already installed, updating..."
        git -C "$dst" pull --ff-only
    else
        echo "    Cloning $name..."
        git clone "https://github.com/${repo}.git" "$dst"
    fi
}

clone_zsh_plugin zsh-users/zsh-autosuggestions
clone_zsh_plugin zsh-users/zsh-syntax-highlighting
clone_zsh_plugin MichaelAquilina/zsh-you-should-use
clone_zsh_plugin fdellwing/zsh-bat

echo "==> Done. ZSH plugins installed successfully."
