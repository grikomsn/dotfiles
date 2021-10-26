#!/usr/bin/env zsh
compaudit | xargs chmod g-w,o-w

# install zsh-syntax-highlighting plugin
echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install homebrew casks
echo "Installing apps via Homebrew casks..."
brew install --cask \
  bartender \
  cleanmymac cyberduck \
  discord docker \
  figma firefox-developer-edition font-jetbrains-mono font-jetbrains-mono-nerd-font font-lexend \
  gitkraken gpg-suite-no-mail \
  imageoptim iriunwebcam iterm2 \
  jetbrains-toolbox \
  keyboardcleantool \
  macs-fan-control megasync mendeley microsoft-auto-update microsoft-edge-dev microsoft-office \
  obs obs-virtualcam \
  paragon-ntfs paw postgres-unofficial \
  raycast \
  spotify steam \
  tandem \
  visual-studio-code vlc \
  webtorrent

# app store app ids (use `mas list | sort -b -k2` to view installed apps)
local MAS_IDS=(
  1333542190 # 1Password 7
  824171161  # Affinity Designer
  937984704  # Amphetamine
  1319884285 # Black Out
  1287239339 # ColorSlurp
  1447043133 # Cursor Pro
  1503988785 # Entity Pro
  1032155965 # Foxit PDF Reader
  1351639930 # Gifski
  412759995  # Guidance
  1294126402 # HEIC Converter
  441258766  # Magnet
  920404675  # Monodraw
  1464122853 # NextDNS
  1289583905 # Pixelmator Pro
  425424353  # The Unarchiver
  572281534  # Transloader

  # 1423210932 # Flow
  # 539883307  # LINE
  # 747648890  # Telegram
)

echo "Downloading .config files..."
mkdir -p ~/.config/{coc/extensions,nvim}
curl -fsSL https://df.griko.id/.config/coc/extensions/package.json >~/.config/coc/extensions/package.json
curl -fsSL https://df.griko.id/.config/nvim/coc-settings.json >~/.config/nvim/coc-settings.json
curl -fsSL https://df.griko.id/.config/nvim/init.vim >~/.config/nvim/init.vim

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

# install fnm using automated script
echo "Installing fnm..."
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell

# install rustup
echo "Installing Rust..."
sh -c "$(curl -fsSL https://sh.rustup.rs)"

# install homebrew quicklook plugins (https://github.com/sindresorhus/quick-look-plugins)
echo "Installing quicklook plugins via Homebrew..."
brew install qlstephen qlimagesize

# de-quarantine quicklook directory (https://github.com/sindresorhus/quick-look-plugins)
echo "De-quarantining quicklook directory..."
xattr -d -r com.apple.quarantine ~/Library/QuickLook

# prep git
echo "Configuring git..."
git config --global user.name "Griko Nibras" &&
  git config --global user.email "git@griko.id" &&
  git config --global init.defaultBranch main &&
  git config --global pull.rebase false

# prep fnm
echo "Installing Node.js runtimes via fnm..."
fnm install --lts

# prep npm and yarn
echo "Installing npm, yarn, and various packages..."
npm -g i npm yarn && yarn_update_globals

# prep neovim
echo "Installing vim-plug for neovim..."
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# prep pip packages
echo "Installing pip packages..."
pip install --upgrade pip &&
  pip install neovim virtualenv watchdog

# prep virtualenv
echo "Installing 'main' virtualenv..."
mkdir -p ~/.virtualenvs && virtualenv ~/.virtualenvs/main

# trigger ssh-agent
eval "$(ssh-agent -s)"

echo "Done! ✨"
