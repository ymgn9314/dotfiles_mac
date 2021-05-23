#!/bin/zsh

set -u

BASEDIR=$(dirname $0)
cd $BASEDIR

echo "create symbolic link."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    # create symbolic link
    ln -snfv ${PWD}/"$f" ${HOME}
done

echo ""
echo "dotfiles installed."
exec $SHELL -l