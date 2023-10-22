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
eval "$(pyenv init -)"

# ssh
eval `ssh-agent -s`

# Alias
alias vim='nvim'
alias ls='ls --color=auto'
alias dev='cd $HOME/Developer/'
alias vc='cd $HOME/Developer/VC/'
alias oj='cd $HOME/Developer/OJ/'
alias C='clear'
alias Q='exit'
alias cp-dir='pwd|pbcopy'
alias cp-file='pbcopy <'
alias cp-man='f() { man $1|pbcopy }; f'
alias cpp='f() { g++-11 $1 -DONPC && ./a.out };f'
alias ll='ls -alF'
alias ..='cd ..'
alias count='ls -1 | wc -l'
alias prop='stat -x'

alias google='s -p google'
alias youtube='s -p youtube'

alias cvenv='python -m venv venv'
alias avenv='source venv/bin/activate'
alias jl-ls='jupyter kernelspec list'
alias jl-add='python -m ipykernel install --user --name=venv'
alias jl-delete='jupyter kernelspec uninstall venv'

alias github='open "https://github.com/sudo-prem"'
alias git-log='git log --oneline --decorate --graph --all'

alias mv='mv -i'
alias rm='rm -i'

alias vsce-i='cat vs_code_extensions | xargs -n 1 code --install-extension'

alias start-pg='brew services start postgresql@15'
alias stop-pg='brew services stop postgresql@15'
alias create-pg-user='/opt/homebrew/opt/postgresql@15/bin/createuser -s postgres'
alias check-port='function _check-port(){ lsof -i :$1 }; _check-port'

# Rename current session - Ctrl + A + $
# Detach current session - Ctrl + A + D
# Preview all sessions - Ctrl + A + S
alias tmux-use='tmux attach -t '
alias tmux-new='tmux new -s '
alias tmux-kill='tmux kill-session '

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

	cp $HOME/{.zshrc,.tmux.conf,.gitconfig,.gitignore_global} $HOME/Developer/VC/dotfiles/;
	cp -a $HOME/.config/nvim/. $HOME/Developer/VC/dotfiles/nvim
}

# Change Cursor Style
function cursorChange() {
	echo -ne '\e[6 q'
}
precmd_functions+=(cursorChange)

