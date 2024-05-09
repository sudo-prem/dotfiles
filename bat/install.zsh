#!/bin/zsh

# Create necessary directories
mkdir -p "$DOTFILES/bat/.config/bat/themes"

# Download theme
curl -o "$DOTFILES/bat/.config/bat/themes/tokyonight_night.tmTheme" https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_night.tmTheme

# Create symlinks
stow --ignore=README.md --ignore=LICENSE \
  -t $HOME -D bat
stow -v -t $HOME bat

# Build bat cache
bat cache --build

# Check available themes and set the desired theme
bat --list-themes | grep tokyonight_night
echo '--theme="tokyonight_night"' >> "$DOTFILES/bat/.config/bat/config"

