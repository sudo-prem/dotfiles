# Source
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:"

# Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fuzzy Search
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
bindkey '^f' fzf-file-widget

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pyenv
if which pyenv &>/dev/null ; then
    eval "$(pyenv init -)"
fi

# Alias
alias cat='cat -n'
alias vim='nvim'
alias ls='lsd'
alias la='ls -a'
alias ll='ls -alF'
alias lt='ls --tree'
alias dev='cd $HOME/Developer/'
alias vc='cd $HOME/Developer/VC/'
alias oj='cd $HOME/Developer/OJ/'
alias C='clear'
alias Q='exit'
alias cp-dir='pwd|pbcopy'
alias cp-file='pbcopy <'
alias cpp='f() { g++-13 $1 -DONPC && ./a.out }; f'
alias ..='cd ..'
alias count='ls -1 | wc -l'
alias prop='stat -x'
alias bak='f() { mv "$1" "$1.bak" }; f'

alias cvenv='python -m venv venv'
alias avenv='source venv/bin/activate'
alias jl='jupyter lab'
alias jl-i='pip install jupyterlab ipykernel'
alias jl-ls='jupyter kernelspec list'
alias jl-add='python -m ipykernel install --user --name=venv'
alias jl-delete='jupyter kernelspec uninstall venv'

alias github='open "https://github.com/sudo-prem"'
alias gg='lazygit'

alias mv='mv -i'
alias rm='rm -i'

alias brew-upgrade='brew list --cask | xargs brew upgrade --cask'
alias brew-dep='brew uses --recursive --installed'

alias check-port='function _check-port(){ lsof -i :$1 }; _check-port'
alias kill-port='sudo kill -9'

# Setup Command Prompt
function setup_prompt() {
    autoload -Uz vcs_info
    precmd() { vcs_info }
    zstyle ':vcs_info:git:*' formats '(%b)'
    setopt PROMPT_SUBST
    RPROMPT=\$vcs_info_msg_0_
    autoload -U colors && colors
    PS1='%{$fg[yellow]%}%2~ %{$fg[blue]%}➜ %{$fg[red]%}'
}
setup_prompt

# version control dotfiles
function vcdot() {
    rm -rf $HOME/dotfiles/Brewfile $HOME/dotfiles/requirements.txt

    brew bundle dump --file=$HOME/dotfiles/Brewfile
    pip freeze > $HOME/dotfiles/requirements.txt
}
