# bun
if test -d $HOME/.bun
    set -gx BUN_INSTALL $HOME/.bun
    set -gx PATH $BUN_INSTALL/bin $PATH
end

# chatwise
if test -d /Applications/ChatWise.app
    set -gx CHATWISE_INSTALL /Applications/ChatWise.app/Contents/MacOS
    set -gx PATH $CHATWISE_INSTALL $PATH
end

# deno
if test -d $HOME/.deno
    set -gx DENO_INSTALL $HOME/.deno
    set -gx PATH $DENO_INSTALL/bin $PATH
end

# fnm
fnm env --use-on-cd | source

# fzf
fzf --fish | source

# go
if test -d $HOME/.go
    set -gx GOPATH $HOME/.go
    set -gx PATH $GOPATH/bin $PATH
end

# lmstudio
if test -d $HOME/.lmstudio
    set -gx LM_STUDIO_INSTALL $HOME/.lmstudio
    set -gx PATH $LM_STUDIO_INSTALL/bin $PATH
end

# mkcert
set -gx NODE_EXTRA_CA_CERTS "$(mkcert -CAROOT)/rootCA.pem"

# orbstack
if test -f $HOME/.orbstack/shell/init2.fish
    source $HOME/.orbstack/shell/init2.fish 2>/dev/null || :
end

# pnpm
set -gx PNPM_HOME $HOME/Library/pnpm
set -gx PATH $PNPM_HOME $PATH

# rust
if test -d $HOME/.cargo
    set -gx RUST_INSTALL $HOME/.cargo
    set -gx PATH $RUST_INSTALL/bin $PATH
end

# yarn
set -gx PATH $HOME/.yarn/bin $PATH
