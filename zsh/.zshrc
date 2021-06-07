# Do nothing if not running interactively
[[ $- != *i* ]] && return

fpath=($ZDOTDIR/external $fpath)

# *** Plugins
source "$XDG_CONFIG_HOME/zsh/zsh-snap/znap.zsh"

znap source ohmyzsh/ohmyzsh plugins/git
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
znap source zdharma/fast-syntax-highlighting
znap prompt denysdovhan/spaceship-prompt

# Prevent fast-syntax-highlighting from reversing colors
# https://github.com/zdharma/fast-syntax-highlighting/issues/105
# https://github.com/zdharma/fast-syntax-highlighting/issues/170
zle_highlight=('paste:none')

# *** Vim Mode
bindkey -v
export KEYTIMEOUT=1
# See keybindings with:
#   bindkey -l  list existing keymap names
#   bindkey -M  list bindings in a given keymap
# Change cursor based on mode
autoload -Uz cursor_mode && cursor_mode
# Press v in normal to open command in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
# Allow ctrl-p/n for previous/next commands. Normal mode and j/k also works
bindkey "^N" down-line-or-search
bindkey "^P" up-line-or-search
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^?" backward-delete-char
# ^L is used by tmux to move splits, rebind clear to ^G
bindkey -r "^L"
bindkey -r "^G"
bindkey -s "^G" "clear\n"

source "$XDG_CONFIG_HOME/zsh/aliases"
source "$XDG_CONFIG_HOME/zsh/scripts.sh"

# History
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Completion
setopt AUTO_PARAM_SLASH
setopt LIST_AMBIGUOUS
setopt AUTO_LIST

# znap handles `autoload -Uz compinit; compinit`
# Autocomplete hidden files
_comp_options+=(globdots)

# Dirstack
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

unsetopt CASE_GLOB

# FZF key bindings
# ^R:    history search (as usual)
# ^T:    files/directories (think _T_ree)
# ALT-C: cd into directory
if [[ $(command -v "fzf") ]]; then
  source /usr/share/fzf/completion.zsh
  source /usr/share/fzf/key-bindings.zsh
fi

if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH=/usr/local/racket/bin:$HOME/bin:$PATH
