# Do nothing if not running interactively
[[ $- != *i* ]] && return

fpath=($ZDOTDIR/external $fpath)

BASE16_SHELL="$XDG_CONFIG_HOME/base16-shell/"
[[ -n "$PS1" ]] && \
    [[ -s "$BASE16_SHELL/profile_helper.sh" ]] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# *** Plugins
source "$XDG_CONFIG_HOME/zsh/zsh-snap/znap.zsh"

znap source ohmyzsh/ohmyzsh plugins/git
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
znap source zdharma/fast-syntax-highlighting
znap prompt denysdovhan/spaceship-prompt

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

source "$XDG_CONFIG_HOME/zsh/aliases"
source "$XDG_CONFIG_HOME/zsh/scripts"

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

if [[ $(command -v "fzf") ]]; then
  source /usr/share/fzf/completion.zsh
  source /usr/share/fzf/key-bindings.zsh
fi

if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi
