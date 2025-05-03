# ./check-arch.sh
ARCH_NAME="$(uname -m)"
if [ "${ARCH_NAME}" = "x86_64" ]; then
  BREW_PREFIX="/usr/local"
elif [ "${ARCH_NAME}" = "arm64" ]; then
  BREW_PREFIX="/opt/homebrew"
fi

eval "$($BREW_PREFIX/bin/brew shellenv)"

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export BUN_INSTALL=$HOME/.bun
export PATH=$BUN_INSTALL/bin:$PATH

export CHATWISE_INSTALL=/Applications/ChatWise.app/Contents/MacOS
export PATH=$CHATWISE_INSTALL:$PATH

export COMPOSER_INSTALL="$HOME/.config/composer/vendor/bin"
export PATH=$COMPOSER_INSTALL:$PATH

export DENO_INSTALL=$HOME/.deno
export PATH=$DENO_INSTALL/bin:$PATH

export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

# export OPENJDK_INSTALL=$BREW_PREFIX/opt/openjdk
# export PATH=$OPENJDK_INSTALL/bin:$PATH

export PNPM_HOME=$HOME/Library/pnpm
export PATH=$PNPM_HOME:$PATH

export TOOLBOX_INSTALL="$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
export PATH=$TOOLBOX_INSTALL:$PATH

export RUST_INSTALL=$HOME/.cargo
export PATH=$RUST_INSTALL/bin:$PATH

export PATH=$HOME/.fnm:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH

export PATH=$BREW_PREFIX/opt/curl/bin:$PATH
export PATH=$BREW_PREFIX/opt/openjdk/bin:$PATH

source $HOME/.cargo/env
source $HOME/.orbstack/shell/init.zsh 2>/dev/null || :
