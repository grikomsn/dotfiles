# ~/.dotfiles

Dotfiles for my workstations when I'm having a bad day (read: reinstalling from scratch) 🏖️

## Install scripts

```sh
sh -c "$(curl -fsSL https://df.griko.id/sysprefs.sh)"
```

```sh
sh -c "$(curl -fsSL https://df.griko.id/core.sh)"
```

```sh
zsh -c "$(curl -fsSL https://df.griko.id/extra.sh)"
```

```sh
zsh -c "$(curl -fsSL https://df.griko.id/neovim.sh)"
```

```sh
zsh -c "$(curl -fsSL https://df.griko.id/vscode.sh)"
```

## Extra steps

- If `xcode-select --install` does not work, download manually at <https://developer.apple.com/download/more/?=xcode>
- Remember to `eval "$(ssh-agent -s)"` and `ssh-add -K`
