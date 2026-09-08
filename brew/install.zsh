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

PINNED_CASKS=(
  "bettermouse@1.6.8812"
  "cleanshot@4.8.10"
  "permute@3.14.8"
)

brew bundle install --file="$SCRIPT_DIR/Brewfile" || return 1 2>/dev/null || exit 1
brew pin --cask "${PINNED_CASKS[@]}" || return 1 2>/dev/null || exit 1

for bundle_id in com.naotanhaocan.BetterMouse pl.maketheweb.cleanshotx com.charliemonroe.Permute-3; do
  defaults write "$bundle_id" SUEnableAutomaticChecks -bool false
  defaults write "$bundle_id" SUAutomaticallyUpdate -bool false
done
