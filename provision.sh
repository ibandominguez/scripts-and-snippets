#!/usr/bin/env bash

# packages

brewPackages=(php56 mcrypt php56-mcrypt mysql redis postgresql mongodb git brew-cask homebrew/php/composer nginx homebrew/apache/httpd24 tree curl)
casksPackages=(google-chrome node firefox virtualbox vagrant vagrant-manager filezilla atom skype sequel-pro)
composerPackages=(laravel/installer laravel/homestead phpunit/phpunit codeception/codeception squizlabs/php_codesniffer)
npmPackages=(grunt-cli gulp bower nodemon sails protactor phantomjs forever phonegap cordova jade express)

# install homebrew

echo "LOG => installing homebrew \n\n"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor && brew update && brew upgrade

# homebrew taps

brew tap homebrew/dupes
brew tap caskroom/homebrew-cask
brew tap homebrew/php

# brewPackages

echo "LOG => installing brewPackages \n\n"
for i in "${brewPackages[@]}"
	do
	  brew install $i
	done

# casksPackages

echo "LOG => installing casksPackages \n\n"
for i in "${casksPackages[@]}"
	do
	  brew cask install $i
	done

# composerPackages

echo "LOG => installing composerPackages \n\n"
for i in "${composerPackages[@]}"
	do
	  sudo composer global require $i
	done

# npmPackages

echo "LOG => installing npmPackages \n\n"
for i in "${npmPackages[@]}"
	do
	  sudo npm install $i -g
	done

# install zshrc

echo "LOG => installing zshrc \n\n"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
