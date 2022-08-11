#!/usr/bin/env zsh

local DF_HOSTNAME="${DF_HOSTNAME:=df.griko.id}"

echo "Downloading ~/.config/ files ..."
mkdir -p ~/.config/{coc/extensions,nvim}
curl -fsSL https://$DF_HOSTNAME/.config/coc/extensions/package.json >~/.config/coc/extensions/package.json
curl -fsSL https://$DF_HOSTNAME/.config/nvim/coc-settings.json >~/.config/nvim/coc-settings.json
curl -fsSL https://$DF_HOSTNAME/.config/nvim/init.vim >~/.config/nvim/init.vim

echo "Installing vim-plug for neovim ..."
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing coc extensions ..."
cd ~/.config/coc/extensions
yarn install --no-lockfile

echo "Done! ✨"
