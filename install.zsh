#!/bin/zsh

SCRIPT_DIR=$( cd -- "$( dirname -- "${(%):-%x}" )" && pwd )

DOT_FOLDERS="stow,wezterm,zsh,lsd,fzf,git,lazygit,nvim,htop"

for folder in ${(s/,/)DOT_FOLDERS}; do
    echo "[+] Folder :: $folder"
    stow --ignore=README.md --ignore=LICENSE \
        -t $HOME -D $folder
    stow -v -t $HOME $folder
done

echo "[+] Reloading shell..."
exec $SHELL -l

