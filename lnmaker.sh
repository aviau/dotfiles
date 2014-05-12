#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "usage: ./lnmaker.sh DOTFILES_DIR"
  exit
fi

dir=$(readlink -f $1)

# .tmux.conf
mv ~/.tmux.conf ~/.tmux.conf.bak
ln ${dir}/.bashrc ~/.bashrc --symbolic
