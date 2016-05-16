#!/usr/bin/env bash

# check if running as sudo

if [[ $UID == 0 ]]; then
  echo "LOG => Please don´t run this script as sudo, it will ask for your password when required"
  exit 1
fi

# packages

brewPackages=(php56 mcrypt php56-mcrypt mysql redis postgresql mongodb git brew-cask homebrew/php/composer nginx homebrew/apache/httpd24 tree curl android-sdk python install sdl2 sdl2_image sdl2_ttf sdl2_mixer gstreamer)
casksPackages=(google-chrome node firefox virtualbox vagrant vagrant-manager filezilla atom skype sequel-pro arduino)
composerPackages=(laravel/installer laravel/homestead phpunit/phpunit codeception/codeception squizlabs/php_codesniffer)
npmPackages=(grunt-cli gulp bower yo generator-karma generator-angular nodemon sails protactor phantomjs forever phonegap cordova jade express)

# install xcode

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

echo "LOG => installing brewPackages"
for i in "${brewPackages[@]}"
	do
	  brew install $i
	done

# casksPackages

echo "LOG => installing casksPackages"
for i in "${casksPackages[@]}"
	do
	  brew cask install $i
	done

# composerPackages

echo "LOG => installing composerPackages"
for i in "${composerPackages[@]}"
	do
	  sudo composer global require $i
	done

# npmPackages

echo "LOG => installing npmPackages"
for i in "${npmPackages[@]}"
	do
	  sudo npm install $i -g
	done

# install zshrc

echo "LOG => installing zshrc"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
