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

# ./check-arch.sh
if [ "$(uname -m)" = "arm64" ]; then
  echo "Installing Rosetta ..."
  softwareupdate --install-rosetta --agree-to-license
fi

read -p "Press any key to install Homebrew ..."
echo "Installing Homebrew ..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

BREW_INSTALL_FORMULAS=(
  bash
  cmake
  composer
  coreutils
  curl
  ffmpeg
  findutils
  fnm
  gcc
  gh
  ghostscript
  git
  git-filter-repo
  git-lfs
  gnupg
  go
  graphviz
  grep
  hub
  imagemagick
  jq
  mas
  mkcert
  ncurses
  neovim
  openssh
  openssl
  pandoc
  php
  protobuf
  python
  python@3.12
  sops
  tree
  wget
  zsh
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
