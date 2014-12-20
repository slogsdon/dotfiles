#!/bin/bash

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update
brew tap homebrew/dupes
brew tap caskroom/fonts
brew tap caskroom/versions

binaries=(
  coreutils
  findutils
  bash
  zsh
  htop
  homebrew/dupes/grep
  graphicsmagick
  webkit2png
  rename
  zopfli
  ffmpeg
  sshfs
  trash
  tree
  ack
  hub
  git
  libgit2
  hg
  bazaar
  tmux
  reattach-to-user-namespace
  vim
  svn
  wrk
  python
  node
  erlang
  elixir
  ghc
  cabal-install
  go
  lua
  plt-racket
  sbcl
  homebrew/php/php56
  leiningen # clojure
  clojurescript
  dmd # dlang
  ansible
  rbenv
  ruby-build
)

echo "installing binaries..."
brew install ${binaries[@]}
brew install weechat --with-lua --with-perl --with-python --with-ruby

brew cleanup

## htop
# setting the setuid bit
sudo chown root:wheel `brew --prefix htop`/bin/htop
sudo chmod u+s `brew --prefix htop`/bin/htop

## JDK

open "http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html"

## Apps

brew install caskroom/cask/brew-cask
# Apps
apps=(
  alfred
  dropbox
  google-chrome
  qlcolorcode
  screenflick
  slack
  appcleaner
  firefox
  qlmarkdown
  rdio
  spotify
  vagrant
  vagrant-manager
  flash
  iterm2
  qlprettypatch
  sublime-text3
  virtualbox
  atom
  flux
  mailbox
  qlstephen
  vlc
  quicklook-json
  skype
  transmission
  android-studio-bundle
  boot2docker
  cakebrew
  ccmenu
  cinch
  cyberduck
  dash
  google-hangouts
  google-web-designer
  heroku-toolbelt
  idris
  julia
  lighttable
  macdown
  pgadmin3
  pixlr
  remote-desktop-connection
  rust
  the-unarchiver
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link

## Fonts

# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
  font-open-sans
  font-source-code-pro
  font-sauce-code-powerline
  font-anonymous-pro
  font-anonymous-pro-for-powerline
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

brew cask cleanup

## Powerline

powerline=(
  psutil
  mercurial
  pygit2
  bzr
  pyuv
)

echo "installing powerline..."
pip install ${powerline[@]}
pip install git+git://github.com/Lokaltog/powerline

## ZSH
echo "setting zsh as login shell..."
sudo -s "echo "/usr/local/bin/zsh" >> /etc/shells"
chsh -s /usr/local/bin/zsh

## Defaults
bash osx-for-hackers.sh
