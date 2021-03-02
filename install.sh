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
mkdir -p "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/.zshenv" "$HOME"
# zshenv will have set up XDG_CONFIG_HOME to .config
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.config/zsh"
