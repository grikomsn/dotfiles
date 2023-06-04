#!/usr/bin/env bash

# https://developer.apple.com/fonts
echo "Downloading fonts for Apple platforms ..."
cd ~/Downloads

FONT_IMAGES=(
  "SF-Pro.dmg"
  "SF-Compact.dmg"
  "SF-Mono.dmg"
  "NY.dmg"
)
for FONT_IMAGE in $FONT_IMAGES; do
  wget https://devimages-cdn.apple.com/design/resources/download/$FONT_IMAGE
done

echo "Mounting font disk images ..."
for FONT_IMAGE in $FONT_IMAGES; do
  hdiutil attach $FONT_IMAGE
done

echo "Done! ✨"
