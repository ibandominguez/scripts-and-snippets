#!/usr/bin/env bash

# Install ZSH
sudo apt-get install zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
chsh -s `which zsh`
