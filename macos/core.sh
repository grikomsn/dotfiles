#!/usr/bin/env bash

# populate common directories
echo "Creating Projects, Temporary, and Workspace directory in home..."
mkdir -p ~/{Projects,Temporary,Workspace}

# install xcode
echo "Installing Xcode command line tools..."
xcode-select --install

# install homebrew
read -p "Press any key to install Homebrew..."
echo "Installing Homebrew..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install homebrew taps
echo "Installing Homebrew casks..."
brew tap homebrew/cask &&
  brew tap homebrew/cask-fonts &&
  brew tap homebrew/cask-versions &&
  brew tap homebrew/services

# install homebrew cli apps
echo "Installing essential apps via Homebrew..."
brew install aria2 curl ffmpeg gh git hub jq mas nvm tree vim wget youtube-dl zsh

# install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Done! ✨"
