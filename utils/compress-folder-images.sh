#!/bin/sh

# This script requires jpegoptim, Install on your OS
# sudo apt-get install jpegoptim, brew install jpegoptim ...

# compress all *.jpg files in the current directory 
find . -name "*.jpg" | xargs jpegoptim
