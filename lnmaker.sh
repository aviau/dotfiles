#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "usage: ./lnmaker.sh DOTFILES_DIR"
  exit
fi

dir=$(readlink -f $1)

# .tmux.conf
mv ~/.tmux.conf ~/.tmux.conf.bak
ln ${dir}/.tmux.conf ~/.tmux.conf --symbolic

# .atom
mv ~/.atom ~/.atom.bak
ln ${dir}/.atom ~/.atom --symbolic

# .bash_profile
mv ~/.bash_profile ~/.bash_profile.bak
ln ${dir}/.bash_profile ~/.bash_profile --symbolic

# .bashrc
mv ~/.bashrc ~/.bashrc.bak
ln ${dir}/.bashrc ~/.bashrc --symbolic

# .bin
mv ~/bin ~/bin.bak
ln ${dir}/bin ~/bin --symbolic
