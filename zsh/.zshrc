export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:"
export XDG_CONFIG_HOME="$HOME/.config"
export DOTFILES="$HOME/dotfiles"
export HOMEBREW_NO_ENV_HINTS=TRUE
export HOMEBREW_NO_AUTO_UPDATE=TRUE
export TLDR_AUTO_UPDATE_DISABLED=TRUE
export KEYTIMEOUT=20
export SHELL_SESSIONS_DISABLE=1
export NVM_DIR="$HOME/.nvm"
export COLIMA_HOME="$XDG_CONFIG_HOME/colima"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(zoxide init --cmd cd zsh)"
eval "$(pyenv init -)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTFILES/zsh/options.zsh
source $DOTFILES/zsh/bindkey.zsh
source $DOTFILES/zsh/alias.zsh
source $HOME/.fzf.zsh

# Enable biometrics for terminal/keychain
# sudo vim /etc/pam.d/sudo
# auth       sufficient     pam_tid.so
# w!

# Enable fast dock animations
# defaults write com.apple.dock autohide-delay -int 0
# defaults write com.apple.dock autohide-time-modifier -float 0.45
# killall Dock

# Enable fast key repeat
# sudo defaults write -g InitialKeyRepeat -int 10
# sudo defaults write -g KeyRepeat -int 1
# sudo defaults write -g ApplePressAndHoldEnabled -bool false
