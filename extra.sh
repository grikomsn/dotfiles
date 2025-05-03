#!/usr/bin/env zsh

# ./check-arch.sh
ARCH_NAME="$(uname -m)"
if [ "${ARCH_NAME}" = "x86_64" ]; then
  BREW_PREFIX="/usr/local"
elif [ "${ARCH_NAME}" = "arm64" ]; then
  BREW_PREFIX="/opt/homebrew"
fi

DF_HOSTNAME="${DF_HOSTNAME:=dotfiles.nibras.co}"

sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

echo "Downloading zsh-syntax-highlighting plugin ..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

MKDIR_PATHS=(
  ~/.ssh
)
for MKDIR_PATH in $MKDIR_PATHS; do
  echo "Creating $MKDIR_PATH directory ..."
  mkdir -p $MKDIR_PATH
done

REMOTE_HOME_FILES=(
  .ssh/config
  .gitconfig
  .profile
  .zprofile
  .zshrc
  .zshenv
)
for REMOTE_FILE in $REMOTE_HOME_FILES; do
  echo "Downloading ~/$REMOTE_FILE ..."
  curl -fsSL https://$DF_HOSTNAME/$REMOTE_FILE >~/$REMOTE_FILE
done

echo "Loading ~/.zshrc ..."
source ~/.zshrc

BREW_CASK_INSTALL_FORMULAS=(
  1password
  1password-cli
  airbuddy
  balenaetcher
  betterdisplay
  cleanmymac
  cleanshot
  craft
  cursor
  cyberduck
  dbngin
  discord
  figma
  font-sf-mono-for-powerline
  fork
  ghostty
  google-chrome-dev
  gpg-suite-no-mail
  imageoptim
  keyboardcleantool
  linear-linear
  logi-options+
  loopback
  mac-mouse-fix
  macs-fan-control
  master-pdf-editor
  mist
  obs
  orbstack
  paragon-ntfs
  parallels
  proxyman
  qflipper
  raycast
  rode-connect
  slack
  steam
  tableplus
  tailscale
  vlc
  webtorrent
  whatsapp
  yaak
  zoom
)
echo "Installing Homebrew casks ..."
for FORMULA in $BREW_CASK_INSTALL_FORMULAS; do
  if [[ "${PREFER_REINSTALL}" ]]; then
    brew reinstall --cask $FORMULA
  else
    brew install --cask $FORMULA
  fi
done

# mas list | sort -b -k2
MAS_IDS=(
  1569813296 # 1Password for Safari  (8.10.70)
  611658502  # Boxy SVG              (4.66.0)
  1287239339 # ColorSlurp            (3.9.2)
  1447043133 # Cursor Pro            (2.13)
  411643860  # DaisyDisk             (4.31)
  1503988785 # Entity Pro            (1.6)
  1591510203 # Equinox               (4.0)
  1032155965 # Foxit PDF Reader      (11.1.2)
  408981434  # iMovie                (10.4.3)
  1622835804 # Kagi for Safari       (2.2.3)
  409183694  # Keynote               (14.4)
  1263070803 # Lungo                 (2.7.0)
  920404675  # Monodraw              (1.6.2)
  1464122853 # NextDNS               (1.5.1)
  1592917505 # Noir                  (2025.1.2
  409203825  # Numbers               (14.4)
  409201541  # Pages                 (14.4)
  1289583905 # Pixelmator Pro        (3.6.17)
  6738274497 # Raycast Companion     (1.1.0)
  1519867270 # Refined GitHub        (25.2.26)
  1482490089 # Tampermonkey Classic  (5.3.6218
  747648890  # Telegram              (11.9)
  899247664  # TestFlight            (3.8.0)
  425424353  # The Unarchiver        (4.3.9)
  1607635845 # Velja                 (2.1.1)
)
echo "Installing apps via app store ..."
for ID in $MAS_IDS; do
  mas install $ID
done

echo "Installing Bun ..."
bash -c "$(curl -fsSL https://bun.sh/install)"

echo "Installing Deno ..."
bash -c "$(curl -fsSL https://deno.land/x/install/install.sh)"

echo "Installing Rust ..."
bash -c "$(curl -fsSL https://sh.rustup.rs)"

echo "Installing Node.js runtimes via fnm ..."
fnm install --lts
fnm alias lts-latest default

# echo "Installing npm, yarn, and various packages ..."
# node-update-globals

echo "Installing pip packages ..."
pip3 install --upgrade pip
pip3 install neovim watchdog

# echo "Setting up fzf ..."
# $BREW_PREFIX/opt/fzf/install

echo "Setting up git lfs ..."
sudo git lfs install --system

echo "Setting up mkcert ..."
mkcert -install

# echo "Setting up openjdk ..."
# sudo ln -sfn $BREW_PREFIX/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

eval "$(ssh-agent -s)"

echo "Done! ✨"
