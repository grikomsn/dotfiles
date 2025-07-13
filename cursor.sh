#!/usr/bin/env zsh

sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

DF_HOSTNAME="${DF_HOSTNAME:=dotfiles.nibras.co}"

CURSOR_USER_PATH="$HOME/Library/Application Support/Cursor/User"
WINDSURF_USER_PATH="$HOME/Library/Application Support/Windsurf/User"
VOID_USER_PATH="$HOME/Library/Application Support/Void/User"

cd $HOME

MKDIR_PATHS=(
  ".cursor"
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
curl -fsSL https://$DF_HOSTNAME/cursor-keybindings.jsonc >"$CURSOR_USER_PATH/keybindings.json"
curl -fsSL https://$DF_HOSTNAME/cursor-settings.jsonc >"$CURSOR_USER_PATH/settings.json"

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
  anysphere.pyright
  asciidoctor.asciidoctor-vscode
  astro-build.astro-vscode
  aykutsarac.jsoncrack-vscode
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
  bmewburn.vscode-intelephense-client
  bradlc.vscode-tailwindcss
  bufbuild.vscode-buf
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
  graphql.vscode-graphql
  graphql.vscode-graphql-execution
  graphql.vscode-graphql-syntax
  jamief.vscode-ssh-config-enhanced
  jock.svg
  laravel.vscode-laravel
  llvm-vs-code-extensions.vscode-clangd
  loriscro.super
  mikestead.dotenv
  ms-azuretools.vscode-docker
  ms-python.debugpy
  ms-python.python
  ms-python.vscode-pylance
  ms-vscode-remote.remote-ssh
  ms-vscode-remote.remote-ssh-edit
  ms-vscode.azure-repos
  ms-vscode.cmake-tools
  ms-vscode.cpptools
  ms-vscode.makefile-tools
  ms-vscode.remote-explorer
  ms-vscode.remote-repositories
  ms-vscode.remote-server
  ms-vscode.wasm-wasi-core
  ms-vsliveshare.vsliveshare
  mtxr.sqltools
  mtxr.sqltools-driver-mysql
  mtxr.sqltools-driver-pg
  mtxr.sqltools-driver-sqlite
  mylesmurphy.prettify-ts
  orta.vscode-twoslash-queries
  oven.bun-vscode
  pbkit.vscode-pbkit
  pulumi.pulumi-lsp-client
  pulumi.pulumi-vscode-tools
  pustelto.bracketeer
  redhat.vscode-commons
  redhat.vscode-xml
  redhat.vscode-yaml
  rust-lang.rust-analyzer
  sburg.vscode-javascript-booster
  tamasfe.even-better-toml
  tanvir.ollama-modelfile
  tauri-apps.tauri-vscode
  tldraw-org.tldraw-vscode
  tlent.jest-snapshot-language-support
  twxs.cmake
  unifiedjs.vscode-mdx
  unifiedjs.vscode-remark
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
    code --install-extension $EXTENSION --force
  done
else
  echo "Skipping extensions installation ..."
fi

echo "Done! ✨"
