#!/bin/zsh

SCRIPT_DIR=$( cd -- "$( dirname -- "${(%):-%x}" )" && pwd )
DOT_FOLDERS="brew,stow,wezterm,bat,colima,fzf,zsh,lsd,git,lazygit,lazydocker,vim,nvim,zed,htop,format"

for folder in ${(s/,/)DOT_FOLDERS}; do
  echo "[+] Folder :: $folder"

  if [ -f "$folder/install.zsh" ]; then
    chmod 777 $folder/install.zsh
    echo "[+] Running install.zsh in $folder"
    source "$folder/install.zsh"

	if [ "$folder" = "brew" ]; then
      echo "[+] Reloading shell after brew install..."
      exec $SHELL -l
    fi

  else
    stow --ignore=README.md --ignore=LICENSE \
      -t $HOME -D $folder
    stow -v -t $HOME $folder
  fi
done

echo "[+] Reloading shell..."
exec $SHELL -l

