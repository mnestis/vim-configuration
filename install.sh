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
pip install --user flake8==3.3.0
mkdir -p ~/.vim/bundle/vim-flake8 
cp -vr vim-flake8/* ~/.vim/bundle/vim-flake8/

# If not already present, append ~/.local/bin to PATH

BASHRC_FIXED=$(grep "export PATH=.*/.local/bin:" ~/.bashrc | wc -l)

if [[ $BASHRC_FIXED == 0 ]]
then
    echo "Installing ~/.local/bin to PATH in ~/.bashrc"
    echo "export PATH=~/.local/bin:\$PATH" >> ~/.bashrc
else
    echo "~/.local/bin already installed to PATH in ~/.bashrc"
fi

BASHPROF_FIXED=$(grep "export PATH=.*/.local/bin:" ~/.bash_profile | wc -l)

if [[ $BASHPROF_FIXED == 0 ]]
then
    echo "Installing ~/.local/bin to PATH in ~/.bash_profile"
    echo "export PATH=~/.local/bin:\$PATH" >> ~/.bash_profile
else
    echo "~/.local/bin already installed to PATH in ~/.bash_profile"
fi

