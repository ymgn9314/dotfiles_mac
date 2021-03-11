#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
HOME_DIR=${HOME}

ln -sf $SCRIPT_DIR/.zshrc $HOME_DIR/
# source $HOME_DIR/.zshrc

echo ".zshrc linked."
