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

# .bin
mv ~/bin ~/.bin.bak
ln ${dir}/bin ~/bin --symbolic

# awesome
mv ~/.config/awesome ~/.config/awesome.bak
ln ${dir}/.config/awesome ~/.config/awesome --symbolic

# .profile
mv ~/.profile ~/.profile.bak
ln ${dir}/.profile ~/.profile --symbolic
