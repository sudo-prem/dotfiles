#!/bin/zsh

SCRIPT_DIR=$( cd -- "$( dirname -- "${(%):-%x}" )" && pwd )
cd "$SCRIPT_DIR" || exit 1
DOT_FOLDERS="brew,stow,wezterm,bat,colima,fzf,zsh,bash,lsd,git,lazygit,lazydocker,vim,nvim,zed,htop,format,gemini,atuin,opencode,tmux,aerospace"

for folder in ${(s/,/)DOT_FOLDERS}; do
  echo "[+] Folder :: $folder"

  if [ -f "$folder/install.zsh" ]; then
    chmod 777 $folder/install.zsh
    echo "[+] Running install.zsh in $folder"
    if ! source "$folder/install.zsh"; then
      echo "[-] Install failed :: $folder"
      exit 1
    fi

  else
    stow --ignore=README.md --ignore=LICENSE \
      -t $HOME -D $folder
    stow -v -t $HOME $folder
  fi
done

echo "[+] Reloading shell..."
exec $SHELL -l
