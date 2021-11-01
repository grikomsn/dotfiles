#!/usr/bin/env bash

# install xcode
echo "Installing Xcode command line tools..."
xcode-select --install

# install homebrew
read -p "Press any key to install Homebrew..."
echo "Installing Homebrew..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install homebrew taps
echo "Installing Homebrew casks..."
brew tap homebrew/cask &&
  brew tap homebrew/cask-fonts &&
  brew tap homebrew/cask-versions &&
  brew tap homebrew/services

# install homebrew cli apps
echo "Installing essential apps via Homebrew..."
brew install mas zsh

# install oh-my-zsh
echo "Installing oh-my-zsh..."
bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Done! ✨"
