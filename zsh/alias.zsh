alias cat='bat'
alias ls='lsd'
alias l.='lsd -d .*'
alias la='lsd -a'
alias ll='lsd -alF'
alias lt='lsd --tree --depth 2'
alias lta='lsd -alF --git --tree --depth 2'
alias ..='cd ..'
alias cp-dir='pwd|pbcopy'
alias cp-file='pbcopy <'
alias count='ls -1 | wc -l'
alias C='clear'
alias Q='exit'

alias cvenv='python3 -m venv venv'
alias avenv='source venv/bin/activate'
alias jl='jupyter lab'
alias jl-i='pip install jupyterlab ipykernel'
alias jl-ls='jupyter kernelspec list'
alias jl-add='python3 -m ipykernel install --user --name=venv'
alias jl-delete='jupyter kernelspec uninstall venv'

alias github='open "https://github.com/sudo-prem"'
alias lg='lazygit'
alias ld='lazydocker'

alias mv='mv -i'
alias rm='rm -i'

alias brew-dep='brew uses --recursive --installed'
alias brew-upgrade='brew list --cask | xargs brew upgrade --cask'
alias brew-bundle='rm -rf $HOME/dotfiles/brew/Brewfile; brew bundle dump --file=$HOME/dotfiles/brew/Brewfile'
alias brew-cleanup='brew cleanup --prune=all'

alias pip-freeze='rm -rf $HOME/dotfiles/misc/python/requirements.txt; pip freeze > $HOME/dotfiles/misc/python/requirements.txt'

alias kill-port='sudo kill -9'

