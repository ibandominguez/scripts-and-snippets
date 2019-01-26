#!/usr/bin/env bash

# check if running as sudo

if [[ $UID == 0 ]]; then
  echo "LOG => Please don´t run this script as sudo, it will ask for your password when required"
  exit 1
fi

# packages

packages=(
  homebrew/php/php71
  mcrypt
  php71-mcrypt
  sqlite3
  mysql
  gphoto2
  redis
  node
  imagemagick
  graphicsmagick
  postgresql
  mongodb
  heroku
  git
  brew-cask
  homebrew/php/composer
  nginx
  homebrew/apache/httpd24
  tree
  jq
  curl
  android-sdk
  python
  docker
  boot2docker
  install
  sdl2
  sdl2_image
  sdl2_ttf
  sdl2_mixer
  gstreamer
  yarn
  watchman
  awscli
)

casks=(
  google-chrome
  firefox
  mysqlworkbench
  virtualbox
  vagrant
  vagrant-manager
  filezilla
  atom
  skype
  java
  sequel-pro
  arduino
  opera
  qlmarkdown
  quicklook-json
  qlprettypatch
  betterzipql
  qlimagesize
  webpquicklook
  android-studio
  Caskroom/cask/gimp
  wireshark
)

# Command Line Tools

echo "LOG => installing xcode"
xcode-select --install

# install homebrew

echo "LOG => installing homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor && brew update && brew upgrade

# homebrew taps

brew tap homebrew/dupes
brew tap caskroom/homebrew-cask
brew tap homebrew/php

# brewPackages

echo "LOG => installing brew packages"
for i in "${brewPackages[@]}"
	do
	  brew install $i
	done

# casksPackages

echo "LOG => installing brew casks"
for i in "${casksPackages[@]}"
	do
	  brew cask install $i
	done

# install zshrc

echo "LOG => installing zshrc"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
