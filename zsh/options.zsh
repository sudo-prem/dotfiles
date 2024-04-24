# prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b) '
setopt PROMPT_SUBST
autoload -U colors && colors
PROMPT='%{$fg[yellow]%}%3~ %{$fg[red]%}${vcs_info_msg_0_}%{$fg[blue]%}➜ %{$reset_color%}'

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# tab complete
# autoload -U compinit
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# compinit
# _comp_options+=(globdots)

# update cursor shapes on vi mode change
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# use beam cursor on startup and new prompt
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

