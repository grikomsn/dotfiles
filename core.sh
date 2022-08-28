#!/usr/bin/env bash

sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

echo "Creating Projects, Temporary, and Workspace directory in home ..."
mkdir -p ~/{Projects,Temporary,Workspace}

echo "Installing Xcode command line tools ..."
xcode-select --install

echo "Installing Rosetta ..."
softwareupdate --install-rosetta --agree-to-license

read -p "Press any key to install Homebrew ..."
echo "Installing Homebrew ..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Tapping Homebrew casks ..."
brew tap homebrew/cask
brew tap homebrew/cask-drivers
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap homebrew/services

BREW_INSTALL_FORMULAS=(
  bash
  cmake
  coreutils
  curl
  ffmpeg
  findutils
  fnm
  fzf
  gh
  git
  git-lfs
  go
  gnu-sed
  graphviz
  hub
  jq
  mas
  mkcert
  neovim
  openjdk
  python
  sqlite
  the_silver_searcher
  tree
  vim
  wget
  zsh
  zsh-syntax-highlighting
)
echo "Installing essential Homebrew formulas ..."
for FORMULA in $BREW_INSTALL_FORMULAS; do
  if [[ "${PREFER_REINSTALL}" ]]; then
    brew reinstall $FORMULA
  else
    brew install $FORMULA
  fi
done

echo "Installing oh-my-zsh ..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Done! ✨"
