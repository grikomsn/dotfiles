# ./check-arch.sh
ARCH_NAME="$(uname -m)"
if [ "$(uname -m)" = "x86_64" ]; then
  BREW_PREFIX="/usr/local"
elif [ "${ARCH_NAME}" = "arm64" ]; then
  BREW_PREFIX="/opt/homebrew"
fi

eval "$($BREW_PREFIX/bin/brew shellenv)"
