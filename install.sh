#!/bin/bash

# Load the submodules
echo -e "\e[92mCloning submodule repositories.\e[0m"
git submodule init
git submodule update

# Clear out whatever rubbish is already there
echo -e "\e[92mRemoving existing Vim configuration.\e[0m"
rm -rv ~/.vimrc ~/.vim

# Copy the .vimrc
echo -e "\e[92mCopying new Vim configuration...\e[0m"
cp -v .vimrc ~/

# Then install the colorscheme
echo -e "\e[92mInstalling colour-scheme...\e[0m"
mkdir -p ~/.vim/colors
cp -vr badwolf/colors/* ~/.vim/colors/

# Finished
echo -e "\e[1mDone.\e[0m"
