#!/bin/zsh

if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed."
    exit 1
fi

if [ ! -f Brewfile ]; then
    echo "Brewfile not found."
    exit 1
fi

brew bundle install --file=Brewfile
