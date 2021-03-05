#!/bin/zsh

# Write some functions/scripts in here
watermelon() {
  echo "WATERMELON!"
}

fdiff() {
  diff -u $1 $2 | diff-so-fancy
}

ftmuxp() {
  if [[ -n $TMUX ]]; then
    echo 'tmux is running. Switch sessions with PREFIX d (detach) then tmux attach-session -t <session>'
    return;
  fi

  # Omit scratchpad
  workspaces="$(ls $XDG_CONFIG_HOME/tmuxp | sed -e 's#.yml$##' | grep -v scratchpad | sort)"

  create_new_session="(New Session)"
  workspaces=$(echo "${create_new_session}\n$workspaces")
  choice="$(echo $workspaces | fzf | cut -d: -f1)"

  if [[ $choice = $create_new_session ]]; then
    tmux new-session
  elif [[ -n "$choice" ]]; then
    win_title $choice
    tmuxp load "$choice"
  fi
}

win_title() {
  if [[ -z $1 ]]; then
    echo 'Usage: win_title <title>'
  fi
  echo -e "\e]0;$1\a"
}

# Use instead of vman binary: set nohidden avoids creating [No Name] buffer.
vman() {
  nvim -c "set nohidden" -c "SuperMan $*"

  if [[ $? != 0 ]]; then
    echo "No manual entry for $*"
  fi
}
