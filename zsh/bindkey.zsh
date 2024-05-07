# enable vi mode
bindkey -v

# enable normal mode w/ jk
bindkey -M viins 'jk' vi-cmd-mode

# use hjkl to select from tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

