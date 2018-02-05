#!/usr/bin/env bash

APT_PPAS=ppa:ondrej/php pa:otto-kesselgulasch/gimp
APT_PKGS=php7.0 php7.0-mysql php7.0-fpm nodejs npm build-essential libssl-dev chromium-browser filezilla arduino wireshark gimp zsh git-core
NPM_PKGS=gulp bower yo webpack generator-karma generator-angular selenium-standalone firebase-tools nodemon sails protractor phantomjs forever nightwatch phonegap cordova jade express ionic react-native-cli jasmine-node
CMP_PKGS=laravel/installer laravel/homestead phpunit/phpunit codeception/codeception squizlabs/php_codesniffer

# Adding APT PPAS
sudo add-apt-repository $APT_PPAS

# Update APT
sudo apt-get update

# Update install 
sudo apt-get install $APT_PCKGS

# Instal npm global deps
sudo npm install -g $NPM_PKGS

# Install composer global deps
sudo composer global require $CMP_PKGS

# Install ZSH
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
chsh -s `which zsh`

# Reboot system
sudo shutdown -r 0
