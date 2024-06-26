#!/usr/bin/env bash

# Fonts are updated every once in a while therefore it is always a 
# good idea visit https://github.com/ryanoasis/nerd-fonts/releases
# and check the reference below to the latest version

declare -a fonts=(
  BitstreamVeraSansMono
  CodeNewRoman
  DroidSansMono
  FiraCode
  FiraMono
  Go-Mono
  Hack
  Hermit
  JetBrainsMono
  Meslo
  Noto
  Overpass
  ProggyClean
  RobotoMono
  SourceCodePro
  SpaceMono
)

version='3.2.1'
fonts_dir="${HOME}/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
  mkdir -p "$fonts_dir"
fi

for font in "${fonts[@]}"; do
  zip_file="${font}.zip"
  download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"
  echo "Downloading $download_url"
  wget "$download_url"
  unzip -o "$zip_file" -d "$fonts_dir"
  rm "$zip_file"
done

find "$fonts_dir" -name '*Windows Compatible*' -delete

fc-cache -fv
