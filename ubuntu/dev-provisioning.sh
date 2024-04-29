#!/usr/bin/env bash

# Apt packages
apt_deps=(
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
  mcrypt
  gnome-tweak
  dotnet-sdk-8.0
  composer
  python2
  python3
  sqlite3
  imagemagick
  graphicsmagick
  wget
  calibre
  filezilla
)

# Snap packages
snap_deps=(
  nodejs
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
  cura-slicer
  gimp
  code
  opera
  firefox
  android-studio
  heroku
  bpytop
  arduino
)

# Url installers
# TODO: url installer vnc-viewer, balena-etcher
url_installers=(
  https://raw.githubusercontent.com/ibandominguez/scripts-and-snippets/master/ubuntu/install-ohmyzsh.sh
  https://raw.githubusercontent.com/ibandominguez/scripts-and-snippets/master/ubuntu/install-anydesk.sh
  https://raw.githubusercontent.com/ibandominguez/scripts-and-snippets/master/ubuntu/install-google-chrome.sh
  https://github.com/ibandominguez/scripts-and-snippets/raw/master/ubuntu/install-nerd-fonts.sh
  https://github.com/ibandominguez/scripts-and-snippets/raw/master/ubuntu/install-lazygit.sh
  https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh
)

# Install snaps
for snap in "${snap_deps[@]}"; do
  sudo snap install --classic "$snap"
done

# Instal apts
sudo apt update
sudo apt install -y "${apt_deps[@]}"

# Install url installers
for url in "${url_installers[@]}"; do
  curl -L "$url" | sh
done

# Clone dotfiles (NvChad, Tmux, OhMyZsh ...)
cd ~ && git init
git remote add origin https://github.com/ibandominguez/dotfiles.git 
git pull origin master --force

# Reboot system
# sudo reboot
