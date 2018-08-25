#!/usr/bin/env bash

# Run: curl https://raw.githubusercontent.com/ibandominguez/scripts/utils/master/install-vim.sh | bash
# To get vim installed in your machine 

# Download Vundle Plugin Manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Download Vim Config file
curl https://raw.githubusercontent.com/ibandominguez/dotfiles/master/.vimrc > ~/.vimrc

# Install color schemes
git clone https://github.com/flazz/vim-colorschemes
mv vim-colorschemes/colors/ ~/.vim
rm -rf vim-colorschemes

# Do not forget to open up vim and run :PluginInstall
