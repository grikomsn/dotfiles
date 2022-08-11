#!/usr/bin/env zsh

local EXPORT_FILENAMES=(
  .config/coc/extensions/package.json
  .config/nvim/
  .config/tabtab/
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
