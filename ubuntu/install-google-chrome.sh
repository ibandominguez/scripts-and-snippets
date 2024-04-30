#!/usr/bin/env bash

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install # just in case it fails
rm google-chrome-stable_current_amd64.deb
