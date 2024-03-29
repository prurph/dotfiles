#!/bin/bash
set -u
: "$XDG_CONFIG_HOME"
: "$DOTFILES"
: "$NVIM_LISPWORDS"

# *** fonts
mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

# *** xkb
rm -rf "$XDG_CONFIG_HOME/xkb"
ln -s "$DOTFILES/xkb" "$XDG_CONFIG_HOME"

# *** nvim
mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"
ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim/init.vim"
ln -sf "$DOTFILES/nvim/coc-settings.json" "$XDG_CONFIG_HOME/nvim/coc-settings.json"
[[ ! -f "$DOTFILES/nvim/autoload/plug.vim" ]] \
  && curl -fLo "$DOTFILES/nvim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p "$HOME/bin"
ln -sf "$DOTFILES/nvim/scmindent/scmindent.lua" "$HOME/bin/scmindent.lua"
ln -sf "$DOTFILES/nvim/scmindent/.lispwords.lua" "$NVIM_LISPWORDS"
mkdir -p "$XDG_CONFIG_HOME/nvim/autoload"
ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"
nvim --noplugin +PlugUpdate +qa

# *** X11
# To symlink entire directory, must ensure it doesn't exist
rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"

# *** i3
rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"

# *** sway
rm -rf "$XDG_CONFIG_HOME/sway"
ln -s "$DOTFILES/sway" "$XDG_CONFIG_HOME"

# *** waybar
rm -rf "$XDG_CONFIG_HOME/waybar"
ln -s "$DOTFILES/waybar" "$XDG_CONFIG_HOME"

# *** wofi (launcher)
rm -rf "$XDG_CONFIG_HOME/wofi"
ln -s "$DOTFILES/wofi" "$XDG_CONFIG_HOME"

# *** zsh
ZSH_SNAP="$XDG_CONFIG_HOME/zsh/zsh-snap"
rm -rf $ZSH_SNAP
git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git $ZSH_SNAP
source "$ZSH_SNAP/install.zsh"

mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"
ln -sf "$DOTFILES/zsh/scripts.sh" "$XDG_CONFIG_HOME/zsh/scripts.sh"
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

# *** dunst
mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"

# *** git
source "$DOTFILES/git/config.sh"

# *** alacritty
mkdir -p "$XDG_CONFIG_HOME/alacritty"
ln -sf "$DOTFILES/alacritty/alacritty.yml" "$XDG_CONFIG_HOME/alacritty/alacritty.yml"

# *** kitty
mkdir -p "$XDG_CONFIG_HOME/kitty"
ln -sf "$DOTFILES/kitty/kitty.conf" "$XDG_CONFIG_HOME/kitty/kitty.conf"
ln -sf "$DOTFILES/kitty/nord.conf" "$XDG_CONFIG_HOME/kitty/nord.conf"

# *** tmux
mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
ln -sf "$DOTFILES/tmux/tmuxline" "$XDG_CONFIG_HOME/tmux/tmuxline"
[[ ! -d "$XDG_CONFIG_HOME/tmux/plugins/tpm" ]] && git clone https://github.com/tmux-plugins/tpm "$XDG_CONFIG_HOME/tmux/plugins/tpm"

# *** tmuxp
mkdir -p "$XDG_CONFIG_HOME/tmuxp"
ln -sf "$DOTFILES/tmuxp/scratchpad.yml" "$XDG_CONFIG_HOME/tmuxp/scratchpad.yml"
ln -sf "$DOTFILES/tmuxp/tycs-prog.yml" "$XDG_CONFIG_HOME/tmuxp/tycs-prog.yml"

# *** nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
