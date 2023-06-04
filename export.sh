#!/usr/bin/env zsh

EXPORT_FILENAMES=(
  .gitconfig
  .profile
  .zprofile
  .zshenv
  .zshrc
)
for FILENAME in $EXPORT_FILENAMES; do
  echo "Exporting ~/$FILENAME ..."
  cp -Rp ./$FILENAME ~/$FILENAME
done

echo "Done! ✨"
