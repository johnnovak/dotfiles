#/usr/bin/env bash

DOTFILES=~/dotfiles

# Common

ln $DOTFILES/config ~/.config

ln $DOTFILES/bashrc ~/.bashrc
ln $DOTFILES/zshrc ~/.zshrc
ln $DOTFILES/tmux.conf ~/.tmux.conf

ln $DOTFILES/vimrc ~/.vimrc
ln $DOTFILES/gvimrc ~/.gvimrc

ln $DOTFILES/gitignore ~/.gitignore

ln $DOTFILES/vrapperrc ~/.vrapperrc


# OS X

if [[ "$OSTYPE" == 'darwin'* ]]; then
    #TODO
fi


# Linux

if [[ "$OSTYPE" == 'linux'* ]]; then
    #TODO
fi


# Cygwin

if [[ "$OSTYPE" == 'cygwin'* ]]; then
    #TODO
fi

