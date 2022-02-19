# Source
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:"
export PATH="/opt/homebrew/opt/python@3.9/libexec/bin:$PATH"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
RPROMPT=\$vcs_info_msg_0_

autoload -U colors && colors
PS1="%{$fg[yellow]%}%2~ %{$fg[blue]%}➜ %{$fg[red]%}"

# Alias
alias vc="cd ~/Work/VC/"
alias oj="cd ~/Work/OJ/"
alias C="clear"
alias Q="exit"
alias cpdir='pwd|pbcopy'
alias cpp='f() { g++-11 $1 -DONPC && ./a.out };f'
alias diskhealth='smartctl -a disk0'

alias g='s -p google'
alias gm='s -p gmail'
alias yt='s -p youtube'
alias stov='s -p stackoverflow'
alias github='open "https://github.com/premnaaath?tab=repositories"'

alias req='pip freeze > requirements.txt'
alias ireq='pip install -r requirements.txt'
alias cvenv='python -m venv ./venv'
alias avenv='source ./venv/bin/activate'
alias dvenv='deactivate'

# Functions
function vcdot() {
	cp ~/{.vimrc,.zshrc,.tmux.conf,Brewfile} ~/Work/VC/dotfiles/;
	cp ~/.vim/UltiSnips/cpp.snippets ~/Work/VC/dotfiles/.vim/UltiSnips/;
}

function cursorChange() {
   echo -ne '\e[6 q'
}
precmd_functions+=(cursorChange)

function reduce() {
		magick $1 -strip -interlace Plane -gaussian-blur 0.0005 -quality 75% $2
}
