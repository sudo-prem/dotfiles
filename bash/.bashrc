# Only continue for interactive shells.
case $- in
  *i*) ;;
  *) return ;;
esac

# History behavior.
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
shopt -s checkwinsize

# Show chroot name in prompt when available.
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# Prompt setup inspired by Debian defaults.
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes ;;
esac

if [ -n "${force_color_prompt:-}" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >/dev/null 2>&1; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
esac

# Load LS_COLORS when dircolors exists.
if [ -x /usr/bin/dircolors ]; then
  if [ -r "$HOME/.dircolors" ]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
  else
    eval "$(dircolors -b)"
  fi
fi

# Common colorized search aliases.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Match zsh vi-mode preference.
set -o vi

# Safer defaults.
alias mv='mv -i'
alias rm='rm -i'

# Core helpers.
alias ..='cd ..'
alias C='clear'
alias Q='exit'
alias count='ls -1 | wc -l'

bak() {
  if [ $# -ne 1 ]; then
    printf 'Usage: bak <file>\n' >&2
    return 1
  fi
  mv -- "$1" "$1.bak"
}

# Python helpers.
alias cvenv='python3 -m venv venv'
alias avenv='source venv/bin/activate'

# Port helpers.
check-port() {
  if [ $# -ne 1 ]; then
    printf 'Usage: check-port <port>\n' >&2
    return 1
  fi
  lsof -i :"$1"
}
alias kill-port='sudo kill -9'

# File helpers using standard Linux tools.
alias ls='ls --color=auto'
alias l.='ls -d .*'
alias la='ls -A'
alias ll='ls -alF'
alias lt='tree -L 2'
alias lta='tree -a -L 2'

# Git helpers.
alias lg='lazygit'
