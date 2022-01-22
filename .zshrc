# Source
export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Prompt
autoload -U colors && colors
PS1="%{$fg[yellow]%}%2~ %{$fg[blue]%}➜ "

# Alias
alias vc="cd ~/Work/VC/"
alias oj="cd ~/Work/OJ/"

alias cpp='f() { g++-11 $1 -DONPC && ./a.out };f'
alias diskhealth='smartctl -a disk0'

alias g='s -p google'
alias gm='s -p gmail'
alias yt='s -p youtube'
alias stov='s -p stackoverflow'
