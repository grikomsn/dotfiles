#!/usr/bin/env zsh
compaudit | xargs chmod g-w,o-w

# install zsh-syntax-highlighting plugin
echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install homebrew casks
echo "Installing apps via Homebrew casks..."
brew install --cask \
  google-chrome \
  keyboardcleantool \
  macs-fan-control microsoft-auto-update microsoft-office \
  spectacle spotify \
  vlc \
  webtorrent

# app store app ids (use `mas list | sort -k2 -` to view installed apps)
local MAS_IDS=(
  937984704  # Amphetamine
  1032155965 # Foxit PDF Reader
  1351639930 # Gifski
  412759995  # Guidance
  1464122853 # NextDNS
  425424353  # The Unarchiver

  # 539883307  # LINE
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

# install homebrew quicklook plugins (https://github.com/sindresorhus/quick-look-plugins)
echo "Installing quicklook plugins via Homebrew..."
brew install qlstephen qlimagesize

# de-quarantine quicklook directory (https://github.com/sindresorhus/quick-look-plugins)
echo "De-quarantining quicklook directory..."
xattr -d -r com.apple.quarantine ~/Library/QuickLook

echo "Done! ✨"
