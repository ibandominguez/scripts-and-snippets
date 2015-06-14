#!/usr/bin/env bash

# packages

brewPackages=(php56 mcrypt php56-mcrypt mysql postgresql mongodb git brew-cask homebrew/php/composer nginx homebrew/apache/httpd24 tree)
casksPackages=(google-chrome node firefox virtualbox vagrant vagrant-manager filezilla atom skype sequel-pro)
composerPackages=(laravel/installer laravel/homestead phpunit/phpunit codeception/codeception)
npmPackages=(grunt-cli gulp bower nodemon sails protactor phantomjs forever phonegap cordova jade express)

# install homebrew

echo "=> installing homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor && brew update && brew upgrade

# homebrew taps

brew tap homebrew/dupes
brew tap caskroom/homebrew-cask
brew tap homebrew/php

# brewPackages

echo "=> installing brewPackages"
for i in "${brewPackages[@]}"
	do
	  brew install $i
	done

# casksPackages

echo "=> installing casksPackages"
for i in "${casksPackages[@]}"
	do
	  brew cask install $i
	done

# composerPackages

echo "=> installing composerPackages"
for i in "${composerPackages[@]}"
	do
	  sudo composer global require $i
	done

# npmPackages

echo "=> installing npmPackages"
for i in "${npmPackages[@]}"
	do
	  sudo npm install $i -g
	done
