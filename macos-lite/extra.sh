#!/usr/bin/env zsh

# install zsh-syntax-highlighting plugin
echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install homebrew casks
echo "Installing apps via Homebrew casks..."
brew install --cask \
  keyboardcleantool \
  macs-fan-control microsoft-auto-update microsoft-office \
  spotify \
  vlc \
  webtorrent

# app store app ids (use `mas list | sort -k2 -` to view installed apps)
local MAS_IDS=(
  937984704  # Amphetamine
  1032155965 # Foxit Reader
  412759995  # Guidance
  408981434  # iMovie
  539883307  # LINE
  1464122853 # NextDNS
  747648890  # Telegram
  425424353  # The Unarchiver
)

echo "Downloading .zshrc..."
curl -fsSL https://df.griko.id/macos-lite/.zshrc >~/.zshrc

echo "Downloading .profile..."
curl -fsSL https://df.griko.id/macos-lite/.profile >~/.profile

echo "Loading .zshrc..."
source ~/.zshrc

# install apps from app store
echo "Installing apps via app store..."
mas install $MAS_IDS

# de-quarantine quicklook directory (https://github.com/sindresorhus/quick-look-plugins)
echo "De-quarantining quicklook directory..."
xattr -d -r com.apple.quarantine ~/Library/QuickLook

echo "Done! ✨"
