autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
RPROMPT=\$vcs_info_msg_0_
autoload -U colors && colors
PS1='%{$fg[yellow]%}%2~ %{$fg[blue]%}➜ %{$fg[red]%}'
