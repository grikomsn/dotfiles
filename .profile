# ./check-arch.sh
ARCH_NAME="$(uname -m)"
if [ "$(uname -m)" = "x86_64" ]; then
  BREW_PREFIX="/usr/local"
elif [ "${ARCH_NAME}" = "arm64" ]; then
  BREW_PREFIX="/opt/homebrew"
fi

export GOPATH=$HOME/.go

export DENO_INSTALL=$HOME/.deno
export OPENJDK_INSTALL=$BREW_PREFIX/opt/openjdk
export PNPM_HOME=$HOME/Library/pnpm
export RUST_INSTALL=$HOME/.cargo

export PATH=$GOPATH/bin:$PATH
export PATH=$DENO_INSTALL/bin:$OPENJDK_INSTALL/bin:$PNPM_HOME:$RUST_INSTALL/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/.fnm:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$ARCH_NAME/opt/curl/bin:$PATH
export PATH=$ARCH_NAME/opt/openjdk/bin:$PATH

. "$HOME/.cargo/env"
