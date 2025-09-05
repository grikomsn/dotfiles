set -l ARCH_NAME (uname -m)
if test $ARCH_NAME = arm64
    set -gx HOMEBREW_PREFIX /opt/homebrew
else
    set -gx HOMEBREW_PREFIX /usr/local
end

# https://github.com/orgs/Homebrew/discussions/4412#discussioncomment-8651316
if test -d $HOMEBREW_PREFIX
    set -gx HOMEBREW_CELLAR "$HOMEBREW_PREFIX/Cellar"
    set -gx HOMEBREW_REPOSITORY "$HOMEBREW_PREFIX/homebrew"
    fish_add_path -gP "$HOMEBREW_PREFIX/bin" "$HOMEBREW_PREFIX/sbin"
    ! set -q MANPATH; and set MANPATH ''
    set -gx MANPATH "$HOMEBREW_PREFIX/share/man" $MANPATH
    ! set -q INFOPATH; and set INFOPATH ''
    set -gx INFOPATH "$HOMEBREW_PREFIX/share/info" $INFOPATH
    $HOMEBREW_PREFIX/bin/brew shellenv | source

    # bin extras
    set -gx PATH $HOMEBREW_PREFIX/opt/curl/bin $PATH
end
