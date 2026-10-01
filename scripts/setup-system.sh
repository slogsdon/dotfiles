#!/bin/bash

# Check for Homebrew,
# Install if we don't have it
if ! command -v brew >/dev/null && [ ! -x /opt/homebrew/bin/brew ]; then
  echo "==> installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# Update homebrew recipes
brew update

binaries=(
  coreutils
  findutils
  zsh
  htop
  tree
  hub
  git
  git-lfs
  gh
  hg
  tmux
  neovim
  svn
  wrk
  ansible
  docker
  zplug
  stow
  starship
  # Languages
  python
  node
  erlang
  elixir
  haskell-stack
  go
  lua
  # plt-racket
  sbcl
  php
  composer
  leiningen # clojure
  clojurescript
  ldc # dlang (dmd is x86-only)
  rbenv
  ruby-build
  openjdk
  rust
  fzf
  ripgrep
)

echo "==> installing binaries..."
brew install ${binaries[@]}

casks=(
  orbstack
  ollama
  iterm2
  1password
  google-chrome
  firefox
  microsoft-edge
  visual-studio-code
  visual-studio
  obs
  obs-virtualcam
  arduino
  dotnet-sdk
  android-studio
  amethyst
  monitorcontrol
  cursor
  orcaslicer
  claude
  ghostty
  obsidian
)

echo "==> installing cask binaries..."
brew install --cask ${casks[@]}

brew cleanup

## htop
# setting the setuid bit
sudo chown root:wheel `brew --prefix htop`/bin/htop
sudo chmod u+s `brew --prefix htop`/bin/htop

## JDK (brew openjdk; let /usr/bin/java find it)
sudo ln -sfn "$(brew --prefix openjdk)/libexec/openjdk.jdk" /Library/Java/JavaVirtualMachines/openjdk.jdk

## ZSH
echo "==> setting zsh as login shell..."
BREW_ZSH="$(brew --prefix)/bin/zsh"
grep -qx "$BREW_ZSH" /etc/shells || echo "$BREW_ZSH" | sudo tee -a /etc/shells >/dev/null
chsh -s "$BREW_ZSH"

## Defaults
echo "==> setting system defaults"
bash "$(dirname "$0")/osx-for-hackers.sh"
