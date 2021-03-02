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
znap source zdharma/history-search-multi-word
znap prompt denysdovhan/spaceship-prompt

# *** Vim Mode
eval spaceship_vi_mode_enable
# Press v in normal to open command in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
# Allow ctrl-p/n for previous/next commands. Normal mode and j/k also works
bindkey "^N" down-line-or-search
bindkey "^P" up-line-or-search

# Must go after any vim mode stuff (bindkey -v/set-o vi/etc)
# https://github.com/zdharma/history-search-multi-word/issues/19
bindkey "^R" history-search-multi-word
zstyle ":history-search-multi-word" highlight-color "fg=red,bold"

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

# Dirstack
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

unsetopt CASE_GLOB


# znap handles `autoload -Uz compinit; compinit`
# Autocomplete hidden files
_comp_options+=(globdots)
