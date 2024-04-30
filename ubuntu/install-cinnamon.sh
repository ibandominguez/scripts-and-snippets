#!/usr/bin/env bash

# This script will install the cinnamon desktop
# Logout and login, note that you'll have a little icon next to the login prompt with
# a set of choices for the desktop environment

sudo add-apt-repository ppa:moorkai/cinnamon
sudo apt-get update
sudo apt-get install cinnamon
