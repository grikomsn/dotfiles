#!/usr/bin/env zsh

# ./check-arch.sh
ARCH_NAME="$(uname -m)"
if [ "${ARCH_NAME}" = "x86_64" ]; then
  BREW_PREFIX="/usr/local"
elif [ "${ARCH_NAME}" = "arm64" ]; then
  BREW_PREFIX="/opt/homebrew"
fi

DF_HOSTNAME="${DF_HOSTNAME:=dotfiles-git-codingki-grikomsn.vercel.app}"

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
  ~/.config/tabtab/zsh
  ~/.ssh
)
for MKDIR_PATH in $MKDIR_PATHS; do
  echo "Creating $MKDIR_PATH directory ..."
  mkdir -p $MKDIR_PATH
done

REMOTE_HOME_FILES=(
  .config/tabtab/zsh/__tabtab.zsh
  .config/tabtab/zsh/pnpm.zsh
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
  airbuddy
  cleanmymac
  cleanshot
  discord
  docker
  font-jetbrains-mono-nerd-font
  imageoptim
  iterm2
  keyboardcleantool
  logi-options-plus
  microsoft-auto-update
  microsoft-office
  mullvadvpn
  obs
  raycast
  rectangle
  slack
  spotify
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
  937984704  # Amphetamine
  1355679052 # Dropover
  747648890  # Telegram
  425424353  # The Unarchiver
  1607635845 # Velja
  408981434  # iMovie
)
echo "Installing apps via app store ..."
for ID in $MAS_IDS; do
  mas install $ID
done

echo "Installing Rust..."
bash -c "$(curl -fsSL https://sh.rustup.rs)"

echo "Installing Node.js runtimes via fnm ..."
fnm install --lts
fnm install 16
fnm alias 16 default

# echo "Installing npm, yarn, and various packages ..."
# node-update-globals

echo "Installing pip packages ..."
pip3 install --upgrade pip
pip3 install virtualenv watchdog

echo "Installing 'main' virtualenv ..."
mkdir -p ~/.virtualenvs
virtualenv ~/.virtualenvs/main

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
