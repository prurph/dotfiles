#!/bin/bash
if !([[ $XDG_CONFIG_HOME ]]) || !([[ $DOTFILES ]]); then
  echo "\$XDG_CONFIG_HOME or \$DOTFILES empty. Abort."
  exit 1
fi

# *** fonts
mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

# *** nvim
mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"
ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim/init.vim"

# *** X11
# To symlink entire directory, must ensure it doesn't exist
rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"

# *** i3
rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"

# *** zsh
BASE16_SHELL="$XDG_CONFIG_HOME/base16-shell"
rm -rf "$BASE16_SHELL"
git clone https://github.com/chriskempson/base16-shell.git $BASE16_SHELL
source "$BASE16_SHELL/scripts/base16-ocean.sh"

ZSH_SNAP="$XDG_CONFIG_HOME/zsh/zsh-snap"
rm -rf $ZSH_SNAP
git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git $ZSH_SNAP

mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"
ln -sf "$DOTFILES/zsh/scripts" "$XDG_CONFIG_HOME/zsh/scripts"
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

# *** dunst
mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"
