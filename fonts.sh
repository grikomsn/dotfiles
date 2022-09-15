#!/usr/bin/env bash

# https://developer.apple.com/fonts
echo "Downloading fonts for Apple platforms ..."
cd ~/Downloads
wget https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg
wget https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg
wget https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg
wget https://devimages-cdn.apple.com/design/resources/download/NY.dmg

echo "Done! ✨"
