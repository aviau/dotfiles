#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "usage: ./lnmaker.sh DOTFILES_DIR"
  exit
fi

dir=$(readlink -f $1)

# .tmux.conf
ln ${dir}/.tmux.conf ~/.tmux.conf --symbolic

# .atom
ln ${dir}/.atom ~/.atom --symbolic

# .bash_profile
ln ${dir}/.bash_profile ~/.bash_profile --symbolic

# .bashrc
ln ${dir}/.bashrc ~/.bashrc --symbolic

# .bin
ln ${dir}/bin ~/bin --symbolic

# awesome
ln ${dir}/.config/awesome ~/.config/awesome --symbolic
