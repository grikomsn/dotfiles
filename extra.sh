#!/usr/bin/env bash

sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

ARCH_NAME="$(uname -m)"
if [ "${ARCH_NAME}" = "x86_64" ]; then
  HOMEBREW_PREFIX="/usr/local"
elif [ "${ARCH_NAME}" = "arm64" ]; then
  HOMEBREW_PREFIX="/opt/homebrew"
fi

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

echo "Setting up git lfs ..."
sudo git lfs install --system

echo "Setting up mkcert ..."
mkcert -install

# echo "Setting up openjdk ..."
# sudo ln -sfn $HOMEBREW_PREFIX/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

echo "Setting up ssh agent ..."
eval "$(ssh-agent -s)"

echo "Done! ✨"
