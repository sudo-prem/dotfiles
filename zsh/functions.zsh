# Compile a single C++ file with g++-15 (ONPC define) and run it.
cpp() { g++-15 "$1" -DONPC && ./a.out }

# Back up a file in place: foo -> foo.bak
bak() { mv "$1" "$1.bak" }

# Show what's listening on a given port.
check-port() { lsof -i :"$1" }

# fuzzy tmux session picker
t() {
  local out key sel name ans
  local -a opt
  out=$( { tmux list-sessions -F '#S' 2>/dev/null; echo '+ new session'; } | \
    fzf --reverse --height=40% --border --prompt='tmux> ' \
        --header='ctrl-r:rename  ctrl-x:kill' --expect=ctrl-r,ctrl-x \
        --preview 'tmux list-windows -t {} 2>/dev/null' )
  key=$(sed -n 1p <<< "$out")
  sel=$(sed -n 2p <<< "$out")
  [[ -z "$sel" ]] && return

  if [[ "$sel" == '+ new session' ]]; then
    read "name?New session name (blank = auto): "
    [[ -n "$name" ]] && opt=(-s "$name")
    [[ -n "$TMUX" ]] \
      && tmux switch-client -t "$(tmux new-session -d -P -F '#S' "${opt[@]}")" \
      || tmux new-session "${opt[@]}"
    return
  fi

  case "$key" in
    ctrl-r) read "name?Rename '$sel' to: "; [[ -n "$name" ]] && tmux rename-session -t "$sel" "$name" ;;
    ctrl-x) read "ans?Kill '$sel'? (y/N): ";  [[ "$ans" == [yY]* ]] && tmux kill-session -t "$sel" ;;
    *)      [[ -n "$TMUX" ]] && tmux switch-client -t "$sel" || tmux attach-session -t "$sel" ;;
  esac
}

