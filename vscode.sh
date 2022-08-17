#!/usr/bin/env zsh

local VSCODE_EXTENSIONS=(
  aaron-bond.better-comments
  artdiniz.quitcontrol-vscode
  astro-build.astro-vscode
  be5invis.toml
  bierner.comment-tagged-templates
  bierner.emojisense
  bierner.folder-source-actions
  bierner.github-markdown-preview
  bierner.markdown-checkbox
  bierner.markdown-emoji
  bierner.markdown-footnotes
  bierner.markdown-mermaid
  bierner.markdown-preview-github-styles
  bierner.markdown-yaml-preamble
  bradlc.vscode-tailwindcss
  chenglou92.rescript-vscode
  christian-kohler.path-intellisense
  codezombiech.gitignore
  dakara.transformer
  DavidAnson.vscode-markdownlint
  dbaeumer.vscode-eslint
  denoland.vscode-deno
  Divlo.vscode-styled-jsx-languageserver
  Divlo.vscode-styled-jsx-syntax
  drKnoxy.eslint-disable-snippets
  eamodio.gitlens
  EditorConfig.EditorConfig
  esbenp.prettier-vscode
  foxundermoon.shell-format
  GitHub.codespaces
  GitHub.github-vscode-theme
  golang.go
  GraphQL.vscode-graphql
  GraphQL.vscode-graphql-syntax
  Gruntfuggly.todo-tree
  jock.svg
  marp-team.marp-vscode
  mikestead.dotenv
  ms-azuretools.vscode-docker
  ms-python.python
  ms-python.vscode-pylance
  ms-vscode-remote.remote-containers
  ms-vscode-remote.remote-ssh
  ms-vscode-remote.remote-ssh-edit
  ms-vscode-remote.remote-wsl
  ms-vscode.makefile-tools
  ms-vsliveshare.vsliveshare
  naumovs.color-highlight
  piotrpalarz.vscode-gitignore-generator
  Prisma.prisma-insider
  pustelto.bracketeer
  redhat.vscode-commons
  redhat.vscode-xml
  redhat.vscode-yaml
  richie5um2.vscode-sort-json
  sburg.vscode-javascript-booster
  teabyii.ayu
  tldraw-org.tldraw-vscode
  tombonnike.vscode-status-bar-format-toggle
  VisualStudioExptTeam.vscodeintellicode
  WallabyJs.quokka-vscode
  will-stone.plastic
  wmaurer.change-case
  yzhang.markdown-all-in-one
)
echo "Installing vscode extensions..." &&
  for EXTENSION in $VSCODE_EXTENSIONS; do
    code --install-extension $EXTENSION --force
  done

echo "Done! ✨"
