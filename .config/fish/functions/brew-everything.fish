function brew-everything --description 'upgrade bun deno fnm rustup brew etc.'
    bun upgrade
    deno upgrade
    fnm install --lts
    rustup upgrade
    brew update -vvv
    brew upgrade -vvv
    brew cleanup -vvv
    brew doctor -vvv
    brew autoremove -vvv
end
