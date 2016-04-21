#!/bin/bash

storage=(emacs git herbstluftwm nvim tmux util weechat xorg zsh)

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
