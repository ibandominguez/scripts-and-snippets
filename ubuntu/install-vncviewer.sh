#!/usr/bin/env bash

curl -o vncviewer-installer.deb https://downloads.realvnc.com/download/file/viewer.files/VNC-Viewer-7.11.0-Linux-x64.deb

sudo dpkg -i vncviewer-installer.deb
rm vncviewer-installer.deb
