#!/usr/bin/env bash

# Apt packages
apt_deps=(
  net-tools # Includes ifconfig
  libfuse2 # Required to run AppImage's
  git
  tree
  php
  jq
  gcc
  make
  ripgrep
  fzf
  zsh
  yarn
  php
  php-gd
  php-xml
  php-mbstring
  php-pdo
  php-mysql
  php-sqlite3
  php-pgsql
  php-sqlsrv
  php-openssl
  php-fileinfo
  php-zip
  php-ctype
  php-json
  mcrypt
  gnome-tweak
  dotnet-sdk-8.0
  composer
  python2
  python-pip
  python3
  python3-pip
  sqlite3
  imagemagick
  graphicsmagick
  wget
  calibre
  filezilla
  gthumb # Enhanced thumbnail viewer
  xclip
)

# Snap packages
snap_deps=(
  curl
  mysql
  aws-cli
  chafa
  nvim
  tmux
  mysql
  docker
  beekeeper-studio
  blender
  gimp
  code
  opera
  firefox
  android-studio
  heroku
  bpytop
  cura-slicer # TODO: Create install script since this version is not the latest
  arduino # TODO: Create install script since this version is not the latest
)

pip_deps=(
  harlequin[mysql]
)

# Url installers
url_installers=(
  https://github.com/ibandominguez/scripts-and-snippets/raw/master/ubuntu/install-anydesk.sh
  https://github.com/ibandominguez/scripts-and-snippets/raw/master/ubuntu/install-google-chrome.sh
  https://github.com/ibandominguez/scripts-and-snippets/raw/master/ubuntu/install-lazygit.sh
  https://github.com/ibandominguez/scripts-and-snippets/raw/master/ubuntu/install-nerd-fonts.sh
  https://github.com/ibandominguez/scripts-and-snippets/raw/master/ubuntu/install-ohmyzsh.sh
  https://github.com/ibandominguez/scripts-and-snippets/raw/master/ubuntu/install-vncviewer.sh
  https://github.com/ibandominguez/scripts-and-snippets/raw/master/ubuntu/install-node-with-nvm.sh
  https://github.com/ibandominguez/scripts-and-snippets/raw/master/ubuntu/install-stl-nautilus-preview.sh
  https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh
)

# Install snaps
for snap in "${snap_deps[@]}"; do
  sudo snap install --classic "$snap"
done

# Install apts
sudo apt update
sudo apt install -y "${apt_deps[@]}"

# Install url installers
for url in "${url_installers[@]}"; do
  curl -L "$url" | sh
done

# Install pip deps
for pdep in "${pip_deps[@]}"; do
  pip3 install "$pdep"
done

# Clone dotfiles (NvChad, Tmux, OhMyZsh ...)
cd ~ && git init
git remote add origin https://github.com/ibandominguez/dotfiles.git 
git pull origin master --force

# Reboot system
# sudo reboot
