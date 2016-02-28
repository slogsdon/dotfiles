#!/bin/bash

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "==> installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

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
  hg
  tmux
  reattach-to-user-namespace
  neovim/neovim/neovim
  svn
  wrk
  ansible
  # Languages
  python
  node
  erlang
  elixir
  haskell-stack
  go
  lua
  plt-racket
  sbcl
  homebrew/php/php56
  leiningen # clojure
  clojurescript
  dmd # dlang
  rbenv
  ruby-build
)

echo "==> installing binaries..."
brew install ${binaries[@]}
brew install weechat --with-lua --with-perl --with-python --with-ruby

brew cleanup

## htop
# setting the setuid bit
sudo chown root:wheel `brew --prefix htop`/bin/htop
sudo chmod u+s `brew --prefix htop`/bin/htop

## JDK
echo "==> download JDK"
open "http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html"

## ZSH
echo "==> setting zsh as login shell..."
sudo -s "echo "/usr/local/bin/zsh" >> /etc/shells"
chsh -s /usr/local/bin/zsh

## Defaults
echo "==> setting system defaults"
bash osx-for-hackers.sh
