export DENO_INSTALL=$HOME/.deno
export OPENJDK_INSTALL=/usr/local/opt/openjdk
export PNPM_HOME=$HOME/Library/pnpm
export RUST_INSTALL=$HOME/.cargo

export PATH=$DENO_INSTALL/bin:$OPENJDK_INSTALL/bin:$PNPM_HOME:$RUST_INSTALL/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/.fnm:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=/opt/homebrew/opt/curl/bin:$PATH
export PATH=/opt/homebrew/opt/openjdk/bin:$PATH

. "$HOME/.cargo/env"
