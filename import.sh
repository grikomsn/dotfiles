#!/usr/bin/env zsh

IMPORT_FILENAMES=(
  .gitconfig
  .profile
  .zprofile
  .zshenv
  .zshrc
)
for FILENAME in $IMPORT_FILENAMES; do
  echo "Importing ~/$FILENAME ..."
  cp -Rp ~/$FILENAME ./$FILENAME
done

echo "Done! ✨"
