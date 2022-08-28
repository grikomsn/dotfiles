#!/usr/bin/env zsh

# https://indiespark.top/software/detecting-apple-silicon-shell-script/
ARCH_NAME="$(uname -m)"
if [ "${ARCH_NAME}" = "x86_64" ]; then
  echo "/usr/local"
elif [ "${ARCH_NAME}" = "arm64" ]; then
  echo "/opt/homebrew"
fi
