#!/bin/zsh

set -u

BASEDIR=$(dirname $0)
HOME_DIR=${HOME}

cd $BASEDIR

for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    # シンボリックリンクを貼る
    ln -snfv ${PWD}/"$f" $HOME_DIR
done

source $HOME_DIR/.zshrc

echo "dotfiles linked."
