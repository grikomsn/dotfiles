#!/usr/bin/env zsh
compaudit | xargs chmod g-w,o-w

sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

echo "Downloading ~/.ssh/config..." &&
  mkdir -p ~/.ssh &&
  curl -fsSL https://df.griko.id/.ssh/config >~/.ssh/config

echo "Downloading ~/.gitconfig..." &&
  curl -fsSL https://df.griko.id/.gitconfig >~/.gitconfig

echo "Downloading ~/.profile..." &&
  curl -fsSL https://df.griko.id/.profile >~/.profile

echo "Downloading ~/.zprofile..." &&
  curl -fsSL https://df.griko.id/.zprofile >~/.zprofile

echo "Downloading .zshrc..." &&
  curl -fsSL https://df.griko.id/.zshrc >~/.zshrc

echo "Downloading .zshenv..." &&
  curl -fsSL https://df.griko.id/.zshenv >~/.zshenv

echo "Loading .zshrc..." &&
  source ~/.zshrc

local BREW_CASK_INSTALL_FORMULAS=(
  1password
  airbuddy
  bartender
  cleanmymac
  cleanshot
  cyberduck
  dbngin
  discord
  docker
  font-jetbrains-mono
  font-lexend
  fork
  gitkraken
  gpg-suite-no-mail
  imageoptim
  iterm2
  jetbrains-toolbox
  keyboardcleantool
  logi-options-plus
  macs-fan-control
  microsoft-auto-update
  microsoft-edge
  microsoft-office
  mullvadvpn
  obs
  obs-virtualcam
  paragon-ntfs
  raycast
  rectangle
  spotify
  steam
  tableplus
  visual-studio-code
  vlc
  webtorrent
  zoom
)
echo "Installing apps via Homebrew casks..." &&
  brew reinstall --cask $BREW_CASK_INSTALL_FORMULAS

# mas list | sort -b -k2
local MAS_IDS=(
  1569813296 # 1Password for Safari
  824171161  # Affinity Designer
  937984704  # Amphetamine
  1319884285 # Black Out
  1287239339 # ColorSlurp
  1447043133 # Cursor Pro
  1503988785 # Entity Pro
  1351639930 # Gifski
  412759995  # Guidance
  1294126402 # HEIC Converter
  920404675  # Monodraw
  1464122853 # NextDNS
  1289583905 # Pixelmator Pro
  1519867270 # Refined GitHub
  899247664  # TestFlight
  425424353  # The Unarchiver
  1607635845 # Velja
)
echo "Installing apps via app store..." &&
  mas install $MAS_IDS

echo "Installing Deno..." &&
  bash -c "$(curl -fsSL https://deno.land/x/install/install.sh)"

echo "Installing Rust..." &&
  bash -c "$(curl -fsSL https://sh.rustup.rs)"

echo "Installing Node.js runtimes via fnm..." &&
  fnm install --lts &&
  fnm alias 16.\* default

echo "Installing npm, yarn, and various packages..." &&
  npm -g i npm yarn &&
  yarn-update-globals

echo "Installing pip packages..." &&
  pip3 install --upgrade pip &&
  pip3 install neovim virtualenv watchdog

echo "Installing 'main' virtualenv..." &&
  mkdir -p ~/.virtualenvs &&
  virtualenv ~/.virtualenvs/main

eval "$(ssh-agent -s)"

echo "Done! ✨"
