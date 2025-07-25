#!/usr/bin/env zsh

sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

DF_HOSTNAME="${DF_HOSTNAME:=dotfiles.nibras.co}"

CODE_USER_PATH="$HOME/Library/Application Support/Code/User"
CURSOR_USER_PATH="$HOME/Library/Application Support/Cursor/User"
WINDSURF_USER_PATH="$HOME/Library/Application Support/Windsurf/User"
VOID_USER_PATH="$HOME/Library/Application Support/Void/User"

cd $HOME

MKDIR_PATHS=(
  ".cursor"
  "$CODE_USER_PATH/snippets"
  "$CURSOR_USER_PATH/snippets"
  "$WINDSURF_USER_PATH/snippets"
  "$VOID_USER_PATH/snippets"
)
for MKDIR_PATH in "${MKDIR_PATHS[@]}"; do
  echo "Creating '$MKDIR_PATH' directory ..."
  mkdir -p "$MKDIR_PATH"
done

SYMLINK_PATHS=(
  ".void-editor"
  ".vscode-oss"
  ".vscode"
  ".windsurf"
)

echo "Setup symlinks ..."
for SYMLINK_PATH in "${SYMLINK_PATHS[@]}"; do
  echo "Creating $SYMLINK_PATH symlink ..."
  ln -s "$HOME/.cursor" "$SYMLINK_PATH"
done

echo "Setup configuration files ..."
mkdir -p $CURSOR_USER_PATH
curl -fsSL https://$DF_HOSTNAME/cursor/keybindings.json >"$CURSOR_USER_PATH/keybindings.json"
curl -fsSL https://$DF_HOSTNAME/cursor/settings.json >"$CURSOR_USER_PATH/settings.json"

SNIPPET_PATHS=(
  "javascript.json"
  "javascriptreact.json"
  "typescript.json"
  "typescriptreact.json"
)

echo "Setup snippets ..."
mkdir -p $CURSOR_USER_PATH/snippets
for SNIPPET_PATH in "${SNIPPET_PATHS[@]}"; do
  curl -fsSL https://$DF_HOSTNAME/cursor-snippets/$SNIPPET_PATH >$CURSOR_USER_PATH/snippets/$SNIPPET_PATH
done

SYMLINK_PATHS=(
  "$CODE_USER_PATH"
  "$VOID_USER_PATH"
  "$WINDSURF_USER_PATH"
)

echo "Setup cross editor symlinks ..."
for SYMLINK_PATH in "${SYMLINK_PATHS[@]}"; do
  cd $SYMLINK_PATH
  rm -rf "$SYMLINK_PATH/snippets" && ln -sf "$CURSOR_USER_PATH/snippets"
  rm -f "$SYMLINK_PATH/keybindings.json" && ln -sf "$CURSOR_USER_PATH/keybindings.json"
  rm -f "$SYMLINK_PATH/settings.json" && ln -sf "$CURSOR_USER_PATH/settings.json"
done

EXTENSIONS=(
  1password.op-vscode
  aaron-bond.better-comments
  adpyke.vscode-userscript
  anysphere.cursorpyright
  anysphere.remote-containers
  anysphere.remote-ssh
  bierner.comment-tagged-templates
  bierner.folder-source-actions
  bierner.github-markdown-preview
  bierner.markdown-checkbox
  bierner.markdown-emoji
  bierner.markdown-footnotes
  bierner.markdown-mermaid
  bierner.markdown-preview-github-styles
  bierner.markdown-yaml-preamble
  biomejs.biome
  bradlc.vscode-tailwindcss
  cardinal90.multi-cursor-case-preserve
  charliermarsh.ruff
  christian-kohler.path-intellisense
  codezombiech.gitignore
  dakara.transformer
  dbaeumer.vscode-eslint
  denoland.vscode-deno
  dnicolson.binary-plist
  drknoxy.eslint-disable-snippets
  eamodio.gitlens
  editorconfig.editorconfig
  esbenp.prettier-vscode
  foxundermoon.shell-format
  github.codespaces
  github.copilot
  github.copilot-chat
  github.github-vscode-theme
  github.remotehub
  github.vscode-github-actions
  github.vscode-pull-request-github
  golang.go
  jock.svg
  llvm-vs-code-extensions.vscode-clangd
  loriscro.super
  mateocerquetella.xcode-12-theme
  mikestead.dotenv
  mkhl.shfmt
  ms-azuretools.vscode-containers
  ms-python.debugpy
  ms-python.python
  ms-python.vscode-pylance
  ms-python.vscode-python-envs
  ms-vscode-remote.remote-ssh
  ms-vscode-remote.remote-ssh-edit
  ms-vscode.cmake-tools
  ms-vscode.cpptools
  ms-vscode.makefile-tools
  ms-vscode.remote-explorer
  ms-vscode.remote-repositories
  ms-vscode.remote-server
  ms-vscode.wasm-wasi-core
  ms-vsliveshare.vsliveshare
  mylesmurphy.prettify-ts
  orta.vscode-twoslash-queries
  oven.bun-vscode
  pbkit.vscode-pbkit
  pustelto.bracketeer
  pveyes.aperture
  redhat.vscode-commons
  redhat.vscode-xml
  redhat.vscode-yaml
  rust-lang.rust-analyzer
  sburg.vscode-javascript-booster
  tamasfe.even-better-toml
  tauri-apps.tauri-vscode
  tldraw-org.tldraw-vscode
  tlent.jest-snapshot-language-support
  twxs.cmake
  unifiedjs.vscode-mdx
  unifiedjs.vscode-remark
  vitest.explorer
  wallabyjs.quokka-vscode
  wmaurer.change-case
  yoavbls.pretty-ts-errors
  yunduo.color-highlight-css-color-4
  zachhardesty.convert-object-to-jsx-vscode
  zengxingxin.sort-js-object-keys
)

if [ -z "${SKIP_EXTENSIONS}" ]; then
  echo "Installing extensions ..."
  for EXTENSION in $EXTENSIONS; do
    if [ -n "$USE_CODE" ]; then
      code --install-extension $EXTENSION --force
    else
      cursor --install-extension $EXTENSION --force
    fi
  done
else
  echo "Skipping extensions installation ..."
fi

echo "Done! ✨"
