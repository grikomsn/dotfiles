# ~/.dotfiles

Dotfiles for my workstations when I'm having a bad day (read: reinstalling from scratch) 🏖️

## Install scripts

```sh
sh -c "$(curl -fsSL https://dotfiles.nibras.co/sysprefs.sh)"
```

```sh
sh -c "$(curl -fsSL https://dotfiles.nibras.co/core.sh)"
```

```sh
zsh -c "$(curl -fsSL https://dotfiles.nibras.co/extra.sh)"
```

```sh
zsh -c "$(curl -fsSL https://dotfiles.nibras.co/neovim.sh)"
```

```sh
zsh -c "$(curl -fsSL https://dotfiles.nibras.co/vscode.sh)"
```

## Extra steps

- If `xcode-select --install` does not work, download manually at <https://developer.apple.com/download/more/?=xcode>
- Remember to `eval "$(ssh-agent -s)"` and `ssh-add -K`
