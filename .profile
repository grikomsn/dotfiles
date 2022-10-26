# ./check-arch.sh
ARCH_NAME="$(uname -m)"
if [ "${ARCH_NAME}" = "x86_64" ]; then
  BREW_PREFIX="/usr/local"
elif [ "${ARCH_NAME}" = "arm64" ]; then
  BREW_PREFIX="/opt/homebrew"
fi

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export DENO_INSTALL=$HOME/.deno
export PATH=$DENO_INSTALL/bin:$PATH

export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

export OPENJDK_INSTALL=$BREW_PREFIX/opt/openjdk
export PATH=$OPENJDK_INSTALL/bin:$PATH

export PNPM_HOME=$HOME/Library/pnpm
export PATH=$PNPM_HOME:$PATH

export RUST_INSTALL=$HOME/.cargo
export PATH=$RUST_INSTALL/bin:$PATH

export PATH=$HOME/.fnm:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH

export PATH=$BREW_PREFIX/opt/curl/bin:$PATH
export PATH=$BREW_PREFIX/opt/openjdk/bin:$PATH

. "$HOME/.cargo/env"
