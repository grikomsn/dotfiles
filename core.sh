#!/usr/bin/env bash

sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

DF_HOSTNAME="${DF_HOSTNAME:=dotfiles.nibras.co}"

echo "Creating Projects, Temporary, and Workspace directory in home ..."
mkdir -p ~/{Projects,Scripts,Temporary,Workspace}

echo "Installing Xcode command line tools ..."
xcode-select --install

if [ "$(uname -m)" = "arm64" ]; then
  echo "Installing Rosetta ..."
  softwareupdate --install-rosetta --agree-to-license
fi

read -p "Press any key to install Homebrew ..."
echo "Installing Homebrew ..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Fetching Brewfile ..."
curl -fsSL https://$DF_HOSTNAME/Brewfile >~/Brewfile

echo "Brewing ..."
brew bundle --global --force

echo "Done! ✨"
