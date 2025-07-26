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

CURSOR_USER_PATH="$HOME/Library/Application Support/Cursor/User"

CURSOR_IMPORT_PATHS=(
  keybindings.json
  settings.json
)

for FILENAME in $CURSOR_IMPORT_PATHS; do
  echo "Importing $CURSOR_USER_PATH/$FILENAME ..."
  cp -Rp "$CURSOR_USER_PATH/$FILENAME" "./cursor/$FILENAME"
done

echo "Done! ✨"
