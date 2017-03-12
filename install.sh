#!/bin/bash

# Load the submodules
git submodule init
git submodule update

# Clear out whatever rubbish is already there
rm -rv ~/.vimrc ~/.vim

# Copy the .vimrc
cp -v .vimrc ~/

# Then install the colorscheme
mkdir -p ~/.vim/colors
cp -vr badwolf/colors/* ~/.vim/colors/

# Install vim-pathogen
mkdir -p ~/.vim/autoload
cp -vr vim-pathogen/autoload/* ~/.vim/autoload/

# Install flake8
pip install flake8
mkdir -p ~/.vim/bundle/vim-flake8 
cp -vr vim-flake8/* ~/.vim/bundle/vim-flake8/
