#!/bin/bash

storage=(
  # editors
  emacs 
  nvim 
  vim 
  # vcs
  git 
  # ui
  herbstluftwm 
  tmux 
  xorg 
  # comms
  weechat 
  # shells
  zsh
  # misc
  util 
)

pushd () {
  command pushd "$@" > /dev/null
}
popd () {
  command popd "$@" > /dev/null
}

pushd ~
pushd .dotfiles

for i in ${storage[@]}
do
  stow $i
done

popd
popd

exit 0
