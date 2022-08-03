#!/usr/bin/env zsh

local FILENAMES=(
  ~/.profile
  ~/.zprofile
  ~/.zshenv
  ~/.zshrc
)
for FILENAME in $FILENAMES; do
  cp $FILENAME ~/
done
