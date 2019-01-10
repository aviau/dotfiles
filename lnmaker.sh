#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "usage: ./lnmaker.sh DOTFILES_DIR"
  exit
fi

dir=$(readlink -f $1)

git submodule update --init --recursive

# vscode
mkdir -p ~/.config/Code/User
ln -sf ${dir}/vscode/keybindings.json ~/.config/Code/User/keybindings.json
ln -sf ${dir}/vscode/settings.json ~/.config/Code/User/settings.json

# .tmux.conf
ln -sf ${dir}/.tmux.conf ~/.tmux.conf

# .sbuildrc
ln -sf ${dir}/.sbuildrc ~/.sbuildrc

# .devscripts
ln -sf ${dir}/.devscripts ~/.devscripts

# .Xresources
ln -sf ${dir}/.Xresources ~/.Xresources

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


# i3
rm -rf ~/.config/i3
ln -sf ${dir}/.config/i3 ~/.config/i3

# .profile
ln -sf ${dir}/.profile ~/.profile

# .bashrc
ln -sf ${dir}/.bashrc ~/.bashrc

# .config/autostart
mv ~/.config/autostart ~/.config/autostart.bak
ln -s ${dir}/.config/autostart ~/.config/autostart

# ranger config
rm -rf ~/.config/ranger
ln -sf ${dir}/.config/ranger ~/.config/ranger

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

# gnupg files
mkdir -p ~/.gnupg
ln -sf ${dir}/.gnupg/gpg.conf ~/.gnupg/gpg.conf
ln -sf ${dir}/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -sf ${dir}/.gnupg/sshcontrol ~/.gnupg/sshcontrol
chmod -R 700 ~/.gnupg

# .caffrc
ln -sf ${dir}/.caffrc ~/.caffrc
