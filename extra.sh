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
  betterdisplay
  cleanmymac
  cleanshot
  cyberduck
  dbngin
  discord
  equinox
  figma
  font-sf-mono-for-powerline
  fork
  google-chrome-dev
  gpg-suite-no-mail
  imageoptim
  iterm2
  jetbrains-toolbox
  keyboardcleantool
  linear-linear
  logi-options-plus
  loopback
  macs-fan-control
  master-pdf-editor
  mist
  mullvadvpn
  ngrok
  notion
  obs
  opal-composer
  orbstack
  paragon-ntfs
  parallels
  proxyman
  qflipper
  rapidapi
  raycast
  rectangle-pro
  rode-connect
  screen-studio
  slack
  spotify
  steam
  tableplus
  visual-studio-code
  vlc
  whatsapp
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
  1569813296 # 1Password for Safari
  937984704  # Amphetamine
  611658502  # Boxy SVG
  1287239339 # ColorSlurp
  1447043133 # Cursor Pro
  1355679052 # Dropover
  1503988785 # Entity Pro
  1032155965 # Foxit PDF Reader
  1351639930 # Gifski
  1294126402 # HEIC Converter
  920404675  # Monodraw
  1464122853 # NextDNS
  1289583905 # Pixelmator Pro
  1519867270 # Refined GitHub
  747648890  # Telegram
  899247664  # TestFlight
  425424353  # The Unarchiver
  1607635845 # Velja
  408981434  # iMovie
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

echo "Setting up fzf ..."
$BREW_PREFIX/opt/fzf/install

echo "Setting up git lfs ..."
sudo git lfs install --system

echo "Setting up mkcert ..."
mkcert -install

echo "Setting up openjdk ..."
sudo ln -sfn $BREW_PREFIX/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

eval "$(ssh-agent -s)"

echo "Done! ✨"
