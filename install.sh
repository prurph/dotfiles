#!/bin/bash

# *** nvim
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/undo"
ln -sf "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"

# *** X11
# To symlink entire directory, must ensure it doesn't exist
rm -rf "$HOME/.config/X11"
ln -s "$HOME/dotfiles/X11" "$HOME/.config"

# *** i3
rm -rf "$HOME/.config/i3"
ln -s "$HOME/dotfiles/i3" "$HOME/.config"

# *** zsh
BASE16_SHELL="$HOME/.config/base16-shell"
rm -rf "$BASE16_SHELL"
git clone https://github.com/chriskempson/base16-shell.git $BASE16_SHELL
source "$BASE16_SHELL/scripts/base16-ocean.sh"

ZSH_SNAP="$HOME/.config/zsh/zsh-snap"
rm -rf $ZSH_SNAP
git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git $ZSH_SNAP

mkdir -p "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/.zshenv" "$HOME"
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/aliases" "$HOME/.config/zsh/aliases"
ln -sf "$HOME/dotfiles/zsh/scripts" "$HOME/.config/zsh/scripts"
rm -rf "$HOME/.config/zsh/external"
ln -sf "$HOME/dotfiles/zsh/external" "$HOME/.config/zsh"
