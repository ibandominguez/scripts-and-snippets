#!/usr/bin/env bash

# check if running as sudo

if [[ $UID == 0 ]]; then
  echo "LOG => Please don´t run this script as sudo, it will ask for your password when required"
  exit 1
fi

# taps

taps=(
  homebrew/cask-fonts
)

# formulaes

formulaes=(
  fd
  ripgrep
  fzf
  neovim
  node
  yarn
  php
  mcrypt
  composer
  python
  sqlite3
  mysql
  postgresql
  mongodb
  imagemagick
  graphicsmagick
  heroku
  awscli
  git
  tree
  jq
  curl
  wget
  sdl2
  sdl2_image
  sdl2_ttf
  sdl2_mixer
  jesseduffield/lazydocker/lazydocker
  jesseduffield/lazygit/lazygit
  bpytop
  dua-cli
  tldr
  chafa
  font-hack-nerd-font
  tmux
)

casks=(
  # Browsers
  opera
  google-chrome
  firefox
  # Databases management
  beekeeper-studio
  # Text editor
  # visual-studio-code
  # Devops (Docker)
  docker
  # Rectangleapp, window sorting utility
  # https://rectangleapp.com/
  rectangle
  # Gimp OpenSource image editing
  gimp
  # FTP Utility tool
  filezilla
  # Compressed files
  betterzipql
  # File preview enhancers
  qlmarkdown
  quicklook-json
  qlprettypatch
  qlimagesize
  webpquicklook
  # Remote desktop
  anydesk
)

# Command Line Tools

echo "LOG => installing xcode command line tools"
xcode-select --install

# install homebrew

echo "LOG => installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew doctor && brew update && brew upgrade

# taps

echo "LOG => installing brew taps"
for i in "${taps[@]}"
	do
	  brew tap $i
	done

# formulaes

echo "LOG => installing brew formulaes"
for i in "${formulaes[@]}"
	do
	  brew install $i
	done

# casks

echo "LOG => installing brew casks"
for i in "${casks[@]}"
	do
	  brew install --cask $i
	done

# Clone dotfiles (NvChad, Tmux, OhMyZsh ...)

cd ~ && git init && git remote add origin https://github.com/ibandominguez/dotfiles.git && git pull origin master

# install ohmyzsh

echo "LOG => installing zshrc"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# TODO: install ohmyzsh plugins 
# using dotfiles func
