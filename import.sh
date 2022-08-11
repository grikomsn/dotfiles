#!/usr/bin/env zsh

local IMPORT_FILENAMES=(
  .config/coc/extensions/package.json
  .config/nvim/
  .config/tabtab/
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
