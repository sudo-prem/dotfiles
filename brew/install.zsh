#!/bin/zsh

SCRIPT_DIR=$( cd -- "$( dirname -- "${(%):-%x}" )" && pwd )

if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed."
    exit 1
fi

if [ ! -f "$SCRIPT_DIR/Brewfile" ]; then
    echo "Brewfile not found."
    exit 1
fi

brew bundle install --file="$SCRIPT_DIR/Brewfile"
