# ./check-arch.sh
ARCH_NAME="$(uname -m)"
if [ "${ARCH_NAME}" = "x86_64" ]; then
  BREW_PREFIX="/usr/local"
elif [ "${ARCH_NAME}" = "arm64" ]; then
  BREW_PREFIX="/opt/homebrew"
fi

eval "$($BREW_PREFIX/bin/brew shellenv)"
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
source $HOME/.orbstack/shell/init.zsh 2>/dev/null || :
