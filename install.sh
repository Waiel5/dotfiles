#!/usr/bin/env bash
# install.sh - symlink dotfiles to home directory
# usage: ./install.sh

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

# Create symlinks
link_file() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ]; then
        rm "$dest"
        echo "  Removed existing symlink: $dest"
    elif [ -f "$dest" ]; then
        mv "$dest" "${dest}.backup"
        echo "  Backed up: $dest -> ${dest}.backup"
    fi

    ln -s "$src" "$dest"
    echo "  Linked: $src -> $dest"
}

echo ""
echo "==> Linking shell config"
link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

echo ""
echo "==> Linking vim config"
link_file "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"

echo ""
echo "==> Linking tmux config"
link_file "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

echo ""
echo "==> Linking git config"
link_file "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/git/.gitignore_global" "$HOME/.gitignore_global"

echo ""
echo "Done! Restart your shell or run: source ~/.zshrc"
