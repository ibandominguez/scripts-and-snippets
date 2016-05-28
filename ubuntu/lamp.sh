#!/usr/bin/env bash

# This script will install a basic lamp stack

sudo apt-get update
sudo apt-get install -y apache2
sudo apt-get install mysql-server php5-mysql
sudo mysql_install_db
sudo mysql_secure_installation
sudo apt-get install -y libapache2-mod-php5 php5-cli php5-common php5-mysql php5-gd php5-fpm php5-cgi php-pear php5-memcache php5-memcached php-apc php-soap php-xml-serializer php-xml-parser php5-geoip php5-mcrypt php5-curl php5-json php5-sqlite
sudo service apache2 restart
