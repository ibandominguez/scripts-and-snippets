#!/usr/bin/env bash

curl -o anydesk-installer.deb https://download.anydesk.com/linux/anydesk_6.3.2-1_amd64.deb
sudo dpkg -i anydesk-installer.deb
sudo apt install -f -y # Install required deps
rm anydesk-installer.deb
