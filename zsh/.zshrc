export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:"
export XDG_CONFIG_HOME="$HOME/.config"
export DOTFILES="$HOME/dotfiles"
export HOMEBREW_NO_ENV_HINTS=TRUE
export HOMEBREW_NO_AUTO_UPDATE=TRUE
export KEYTIMEOUT=20
export SHELL_SESSIONS_DISABLE=1
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(zoxide init --cmd cd zsh)"
eval "$(pyenv init -)"

source $HOME/.fzf.zsh
source $DOTFILES/zsh/options.zsh
source $DOTFILES/zsh/bindkey.zsh
source $DOTFILES/zsh/alias.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

