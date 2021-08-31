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

# *** Spaceship Prompt
export SPACESHIP_DIR_TRUNC=0 # show all folders in cwd
export SPACESHIP_CHAR_SYMBOL=" "
# ANSI codes: https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html
export SPACESHIP_VI_MODE_INSERT="\u001b[30;45m I \u001b[35;40m\u001b[48;5;8m"
export SPACESHIP_VI_MODE_NORMAL="\u001b[30;41m N \u001b[31;40m\u001b[48;5;8m"
export SPACESHIP_VI_MODE_SUFFIX="\u001b[38;5;8m"

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
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt INC_APPEND_HISTORY   # write to history file immediately
setopt EXTENDED_HISTORY     # add timestamps
setopt HIST_IGNORE_ALL_DUPS # overwrite duplicate entries
setopt HIST_REDUCE_BLANKS   # remove superfluous blanks
setopt HIST_IGNORE_SPACE    # ignore commands with leading space

# Completion
setopt AUTO_PARAM_SLASH
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
  # Nord colors
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=dark
  --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
  --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
  '
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export MOZ_ENABLE_WAYLAND=1
export KITTY_ENABLE_WAYLAND=1

export PATH=/usr/local/racket/bin:/usr/local/go/bin:$HOME/bin:$PATH

