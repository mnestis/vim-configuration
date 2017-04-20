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

# Install vim-pathogen
echo -e "\e[92mInstalling Vim-Pathogen...\e[0m"
mkdir -p ~/.vim/autoload
cp -vr vim-pathogen/autoload/* ~/.vim/autoload/

# Install flake8
echo -e "\e[92mInstalling flake8...\e[0m"
pip install --user flake8==3.3.0
mkdir -p ~/.vim/bundle/vim-flake8 
cp -vr vim-flake8/* ~/.vim/bundle/vim-flake8/

# If not already present, append ~/.local/bin to PATH
# First in ~/.bashrc
BASHRC_FIXED=$(grep "export PATH=.*/.local/bin:" ~/.bashrc | wc -l)
if [[ $BASHRC_FIXED == 0 ]]
then
    echo -e "\e[92mInstalling ~/.local/bin to PATH in ~/.bashrc\e[0m"
    echo "export PATH=~/.local/bin:\$PATH" >> ~/.bashrc
else
    echo -e "\e[92m~/.local/bin already installed to PATH in ~/.bashrc\e[0m"
fi
# And then in ~/.bash_profile
BASHPROF_FIXED=$(grep "export PATH=.*/.local/bin:" ~/.bash_profile | wc -l)
if [[ $BASHPROF_FIXED == 0 ]]
then
    echo -e "\e[92mInstalling ~/.local/bin to PATH in ~/.bash_profile\e[0m"
    echo "export PATH=~/.local/bin:\$PATH" >> ~/.bash_profile
else
    echo -e "\e[92m~/.local/bin already installed to PATH in ~/.bash_profile\e[0m"
fi

# Finished
echo -e "\e[1mDone.\e[0m"
