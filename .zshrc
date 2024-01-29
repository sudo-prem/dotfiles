# Source
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fuzzy Search
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
bindkey '^f' fzf-file-widget

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pyenv
if which pyenv &>/dev/null ; then
    eval "$(pyenv init -)"
fi

# Set Symlink to gcc
# sudo ln -s $(which gcc-11) /usr/local/bin/gcc

# ssh
# eval `ssh-agent -s`

# Alias
alias cat='cat -n'
alias vim='nvim'
alias ls='lsd'
alias ll='lsd -alF'
alias dev='cd $HOME/Developer/'
alias vc='cd $HOME/Developer/VC/'
alias oj='cd $HOME/Developer/OJ/'
alias C='clear'
alias Q='exit'
alias cp-dir='pwd|pbcopy'
alias cp-file='pbcopy <'
alias cp-man='f() { man $1|pbcopy }; f'
alias cpp='f() { g++-11 $1 -DONPC && ./a.out }; f'
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

alias mv='mv -i'
alias rm='rm -i'

alias brew-upgrade='brew list --cask | xargs brew upgrade --cask'
alias brew-dep='brew uses --recursive --installed'
alias vsce-i='cat vs_code_extensions | xargs -n 1 code --install-extension'

alias check-port='function _check-port(){ lsof -i :$1 }; _check-port'
alias kill-port='sudo kill -9'

# Functions
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

# Backup Python Packages
function backup_python_packages() {
    local output_file="${HOME}/Developer/VC/dotfiles/requirements.txt"

    pip freeze > "$output_file"
}

# VC Config
function vcdot() {
    rm -rf $HOME/Developer/VC/dotfiles/Brewfile $HOME/Developer/VC/dotfiles/code/extensions

    brew bundle dump --file=$HOME/Developer/VC/dotfiles/Brewfile
    code --list-extensions >> $HOME/Developer/VC/dotfiles/code/extensions

    backup_python_packages

    cp $HOME/{.zshrc,.gitconfig,.gitignore_global} $HOME/Developer/VC/dotfiles/;
    cp -a $HOME/.config/nvim/. $HOME/Developer/VC/dotfiles/nvim
    cp -a $HOME/.config/wezterm/wezterm.lua $HOME/Developer/VC/dotfiles/wezterm.lua
}
