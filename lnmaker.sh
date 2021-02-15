#!/usr/bin/env bash

set -eo pipefail

DOTFILES_DIR=$(realpath $(dirname $0))

git submodule update --init --recursive

# vscode
mkdir -p ~/.config/Code/User
ln -sf ${DOTFILES_DIR}/vscode/keybindings.json ~/.config/Code/User/keybindings.json
ln -sf ${DOTFILES_DIR}/vscode/settings.json ~/.config/Code/User/settings.json

# rofi
mkdir -p ~/.config/rofi
ln -sf ${DOTFILES_DIR}/.config/rofi/config.rasi ~/.config/rofi/config.rasi

# .tmux.conf
ln -sf ${DOTFILES_DIR}/.tmux.conf ~/.tmux.conf

# .sbuildrc
ln -sf ${DOTFILES_DIR}/.sbuildrc ~/.sbuildrc

# .devscripts
ln -sf ${DOTFILES_DIR}/.devscripts ~/.devscripts

# .Xresources
ln -sf ${DOTFILES_DIR}/.Xresources ~/.Xresources

# .vimrc
ln -sf ${DOTFILES_DIR}/.vimrc ~/.vimrc

# .vim
rm -rf ~/.vim
ln -sf ${DOTFILES_DIR}/.vim ~/.vim

# .atom
rm -rf ~/.atom
ln -sf ${DOTFILES_DIR}/.atom ~/.atom

# .bin
ln -nsf ${DOTFILES_DIR}/bin ~/bin

# awesome
rm -rf ~/.config/awesome
ln -sf ${DOTFILES_DIR}/.config/awesome ~/.config/awesome

# redshift
rm -rf ~/.config/redshift.conf
ln -sf ${DOTFILES_DIR}/.config/redshift.conf ~/.config/redshift.conf

# sway
rm -rf ~/.config/sway
ln -sf ${DOTFILES_DIR}/.config/sway ~/.config/sway

# waybar
rm -rf ~/.config/waybar
ln -sf ${DOTFILES_DIR}/.config/waybar ~/.config/waybar

# i3
rm -rf ~/.config/i3
ln -sf ${DOTFILES_DIR}/.config/i3 ~/.config/i3

# .profile
ln -sf ${DOTFILES_DIR}/.profile ~/.profile

# .bashrc
ln -sf ${DOTFILES_DIR}/.bashrc ~/.bashrc

# .config/autostart
mv ~/.config/autostart ~/.config/autostart.bak
ln -s ${DOTFILES_DIR}/.config/autostart ~/.config/autostart

# ranger config
rm -rf ~/.config/ranger
ln -sf ${DOTFILES_DIR}/.config/ranger ~/.config/ranger

# .gconf/apps/guake
mkdir -p ~/.gconf/apps
ln -sf ${DOTFILES_DIR}/.gconf/apps/guake ~/.gconf/apps/guake

# .gitconfig
ln -sf ${DOTFILES_DIR}/.gitconfig ~/.gitconfig

# .pyrc
ln -sf ${DOTFILES_DIR}/.pyrc ~/.pyrc

# .dput.cf
ln -sf ${DOTFILES_DIR}/.dput.cf ~/.dput.cf

# quiltrc
ln -sf ${DOTFILES_DIR}/.quiltrc-dpkg ~/.quiltrc-dpkg

# gbp.conf
ln -sf ${DOTFILES_DIR}/.gbp.conf ~/.gbp.conf

# zshrc
ln -sf ${DOTFILES_DIR}/.zshrc ~/.zshrc

# .pbuilderrc
ln -sf ${DOTFILES_DIR}/.pbuilderrc ~/.pbuilderrc

# .gitignore_global
ln -sf ${DOTFILES_DIR}/.gitignore_global ~/.gitignore_global

# youcompleteme
ln -sf ${DOTFILES_DIR}/.ycm_extra_conf.py ~/.ycm_extra_conf.py

# gnupg files
mkdir -p ~/.gnupg
ln -sf ${DOTFILES_DIR}/.gnupg/gpg.conf ~/.gnupg/gpg.conf
ln -sf ${DOTFILES_DIR}/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -sf ${DOTFILES_DIR}/.gnupg/sshcontrol ~/.gnupg/sshcontrol
chmod -R 700 ~/.gnupg || true

# .caffrc
ln -sf ${DOTFILES_DIR}/.caffrc ~/.caffrc

# systemd
rm -rf ~/.config/systemd
ln -sf ${DOTFILES_DIR}/.config/systemd ~/.config/systemd

# perkeep
mkdir -p ~/.perkeepfs
ln -nsf ~/.perkeepfs/roots/root ~/perkeep
