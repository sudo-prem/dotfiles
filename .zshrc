# Source
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:"
export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:$PATH"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fuzzy Search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^f' fzf-file-widget

# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
RPROMPT=\$vcs_info_msg_0_
autoload -U colors && colors
PS1="%{$fg[yellow]%}%2~ %{$fg[blue]%}➜ %{$fg[red]%}"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pyenv
eval "$(pyenv init -)"

# ssh
# eval `ssh-agent -s`

# Alias
alias dev="cd ~/Developer/"
alias vc="cd ~/Developer/VC/"
alias oj="cd ~/Developer/OJ/"
alias C="clear"
alias Q="exit"
alias cp-dir='pwd|pbcopy'
alias cpp='f() { g++-11 $1 -DONPC && ./a.out };f'
alias ll='ls -alF'
alias ..='cd ..'
alias count='ls -1 | wc -l'
alias prop='stat -x'

alias google='s -p google'
alias youtube='s -p youtube'

alias github='open "https://github.com/sudo-prem?tab=repositories"'
alias git-log='git log --oneline --decorate --graph --all'

alias mv='mv -i'
alias rm='rm -i'

alias vsce-i='cat vs_code_extensions | xargs -n 1 code --install-extension'
alias brew-i=''

# Functions
function vcdot() {
	rm -rf ~/Developer/VC/dotfiles/Brewfile ~/Developer/VC/dotfiles/code/extensions

	brew bundle dump --file=~/Developer/VC/dotfiles/Brewfile
	code --list-extensions >> ~/Developer/VC/dotfiles/code/extensions

	cp ~/{.vimrc,.zshrc,.tmux.conf,.gitconfig,.gitignore_global} ~/Developer/VC/dotfiles/;
	cp ~/.vim/UltiSnips/cpp.snippets ~/Developer/VC/dotfiles/.vim/UltiSnips/;
}

function cursorChange() {
	echo -ne '\e[6 q'
}
precmd_functions+=(cursorChange)

