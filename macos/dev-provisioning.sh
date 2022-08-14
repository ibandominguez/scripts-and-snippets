#!/usr/bin/env bash

# check if running as sudo

if [[ $UID == 0 ]]; then
  echo "LOG => Please don´t run this script as sudo, it will ask for your password when required"
  exit 1
fi

# formulaes

formulaes=(
  fig # Terminal enhanced
  node 
  yarn
  php
  mcrypt
  composer # php package manager
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
)

casks=(
  # Browsers
  opera
  google-chrome
  firefox
  # Databases management
  beekeeper-studio
  # Text editor
  visual-studio-code
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
)

# Command Line Tools

echo "LOG => installing xcode command line tools"
xcode-select --install

# install homebrew

echo "LOG => installing homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor && brew update && brew upgrade

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

# install zshrc

echo "LOG => installing zshrc"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# install vim
# Do not forget to open up vim and run :PluginInstall

curl -L https://raw.githubusercontent.com/ibandominguez/scripts-and-snippets/master/utils/install-vim.sh | sh
