#!/usr/bin/env zsh

echo "Downloading .config files..."
mkdir -p ~/.config/{coc/extensions,nvim}
curl -fsSL https://df.griko.id/.config/coc/extensions/package.json >~/.config/coc/extensions/package.json
curl -fsSL https://df.griko.id/.config/nvim/coc-settings.json >~/.config/nvim/coc-settings.json
curl -fsSL https://df.griko.id/.config/nvim/init.vim >~/.config/nvim/init.vim

echo "Installing vim-plug for neovim..."
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing coc extensions..."
cd ~/.config/coc/extensions
yarn install --no-lockfile

echo "Done! ✨"
