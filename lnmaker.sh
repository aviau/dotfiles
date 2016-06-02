#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "usage: ./lnmaker.sh DOTFILES_DIR"
  exit
fi

dir=$(readlink -f $1)

# .tmux.conf
ln -sf ${dir}/.tmux.conf ~/.tmux.conf

# .vimrc
ln -sf ${dir}/.vimrc ~/.vimrc

# .vim
rm -rf ~/.vim
ln -sf ${dir}/.vim ~/.vim

# .atom
rm -rf ~/.atom
ln -sf ${dir}/.atom ~/.atom

# .bin
ln -nsf ${dir}/bin ~/bin

# awesome
rm -rf ~/.config/awesome
ln -sf ${dir}/.config/awesome ~/.config/awesome

# .profile
ln -sf ${dir}/.profile ~/.profile

# .bashrc
ln -sf ${dir}/.bashrc ~/.bashrc

# .config/autostart
mv ~/.config/autostart ~/.config/autostart.bak
ln -s ${dir}/.config/autostart ~/.config/autostart

# .gconf/apps/guake
ln -sf ${dir}/.gconf/apps/guake ~/.gconf/apps/guake

# .gitconfig
ln -sf ${dir}/.gitconfig ~/.gitconfig

# .pyrc
ln -sf ${dir}/.pyrc ~/.pyrc

# .dput.cf
ln -sf ${dir}/.dput.cf ~/.dput.cf

# quiltrc
ln -sf ${dir}/.quiltrc-dpkg ~/.quiltrc-dpkg

# gbp.conf
ln -sf ${dir}/.gbp.conf ~/.gbp.conf

# zshrc
ln -sf ${dir}/.zshrc ~/.zshrc

# .pbuilderrc
ln -sf ${dir}/.pbuilderrc ~/.pbuilderrc

# .gitignore_global
ln -sf ${dir}/.gitignore_global ~/.gitignore_global

# youcompleteme
ln -sf ${dir}/.ycm_extra_conf.py ~/.ycm_extra_conf.py

# gpg.conf
mkdir -p ~/.gnupg
ln -sf ${dir}/.gnupg/gpg.conf ~/.gnupg/gpg.conf
