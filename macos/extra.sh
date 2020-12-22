#!/usr/bin/env zsh

# install zsh-syntax-highlighting plugin
echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install homebrew casks
echo "Installing apps via Homebrew casks..."
brew install --cask \
  bartender \
  cyberduck \
  discord docker \
  firefox-developer-edition font-jetbrains-mono fork \
  gitkraken gpg-suite-no-mail \
  insomnia iterm2 \
  jetbrains-toolbox \
  keyboardcleantool \
  macs-fan-control megasync mendeley microsoft-auto-update microsoft-office \
  obs obs-virtualcam \
  skyfonts smooze spectacle spotify steam \
  tandem \
  visual-studio-code vlc \
  webtorrent

# app store app ids (use `mas list | sort -k2 -` to view installed apps)
local MAS_IDS=(
  1333542190 # 1Password 7
  937984704  # Amphetamine
  1470584107 # Dato
  1032155965 # Foxit Reader
  1351639930 # Gifski
  1513574319 # Glance – Quick Look Plugin
  412759995  # Guidance
  409183694  # Keynote
  539883307  # LINE
  1464122853 # NextDNS
  407963104  # Pixelmator
  803453959  # Slack
  747648890  # Telegram
  425424353  # The Unarchiver
  1470168007 # Vectornator Pro
  408981434  # iMovie
)

echo "Downloading .zshrc..."
curl -fsSL https://df.griko.id/macos/.zshrc >~/.zshrc

echo "Downloading .profile..."
curl -fsSL https://df.griko.id/macos/.profile >~/.profile

echo "Downloading ~/.ssh/config..."
mkdir -p ~/.ssh &&
  curl -fsSL https://df.griko.id/macos/.ssh/config >~/.ssh/config

echo "Loading .zshrc..."
source ~/.zshrc

# install apps from app store
echo "Installing apps via app store..."
mas install $MAS_IDS

# install deno
echo "Installing Deno..."
sh -c "$(curl -fsSL https://deno.land/x/install/install.sh)"

# install rustup
echo "Installing Rust..."
sh -c "$(curl -fsSL https://sh.rustup.rs)"

# de-quarantine quicklook directory (https://github.com/sindresorhus/quick-look-plugins)
echo "De-quarantining quicklook directory..."
xattr -d -r com.apple.quarantine ~/Library/QuickLook

# prep git
echo "Configuring git..."
git config --global user.name "Griko Nibras" &&
  git config --global user.email "git@griko.id" &&
  git config --global init.defaultBranch main

# prep nvm
echo "Installing Node.js LTS via nvm..."
nvm install --lts &&
  nvm alias default lts/\*

# prep npm and yarn
echo "Installing npm, yarn, and various packages..."
npm -g i npm yarn &&
  yarn global add eslint netlify-cli prettier serve speed-test vercel

echo "Downloading Paragon NTFS to ~/Downloads..."
wget -P ~/Downloads https://dl.paragon-software.com/esd/Paragon-1091-PEU_MacInstallUnlock_15.5.106.dmg

echo "Done! ✨"
