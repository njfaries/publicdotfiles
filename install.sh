# Run this script to set up the necessary symlinks after cloning

#!bin/bash

cd ~

if [ ! -e .dotfiles/ ]; then
	mv publicdotfiles .dotfiles
fi

echo "Removing .bashrc"
rm .bashrc
echo "Setting up symlink to .bashrc"
ln -s .dotfiles/.bashrc .bashrc

echo "Removing .bash_profile"
rm .bash_profile
echo "Setting up symlink to .bash_profile"
ln -s .dotfiles/.bash_profile .bash_profile

echo "Removing .vimrc"
rm .vimrc
echo "Setting up symlink to .vimrc"
ln -s .dotfiles/vimrc .vimrc

