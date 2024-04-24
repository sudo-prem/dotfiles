export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:"
export XDG_CONFIG_HOME="$HOME/.config"
export DOTFILES="$HOME/dotfiles"
export HOMEBREW_NO_ENV_HINTS=TRUE
export HOMEBREW_NO_AUTO_UPDATE=TRUE
export TLDR_AUTO_UPDATE_DISABLED=TRUE
export KEYTIMEOUT=20
export SHELL_SESSIONS_DISABLE=1
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(zoxide init --cmd cd zsh)"
eval "$(pyenv init -)"

source $DOTFILES/zsh/options.zsh
source $DOTFILES/zsh/bindkey.zsh
source $DOTFILES/zsh/alias.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -f $HOME/.fzf.zsh ]] && \. $HOME/.fzf.zsh
FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="--height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy),ctrl-x:execute(rm -i {+})+abort'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard || fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
eval "$(fzf --zsh)"
source $HOME/.fzf.zsh
