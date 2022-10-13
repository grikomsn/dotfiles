# ~/.dotfiles

Dotfiles for my workstations when I'm having a bad day (read: reinstalling from scratch) 🏖️

## Install scripts

```sh
sh -c "$(curl -fsSL https://dotfiles.griko.id/sysprefs.sh)"
```

```sh
sh -c "$(curl -fsSL https://dotfiles.griko.id/core.sh)"
```

```sh
zsh -c "$(curl -fsSL https://dotfiles.griko.id/extra.sh)"
```

```sh
zsh -c "$(curl -fsSL https://dotfiles.griko.id/neovim.sh)"
```

```sh
zsh -c "$(curl -fsSL https://dotfiles.griko.id/vscode.sh)"
```

## Alternative hostnames

Dotfils are mirrored on all hostnames below. Override the `DF_HOSTNAME` variable to change the script internal downloads. Example usage:

```sh
export DF_HOSTNAME=df2.griko.id
sh -c "$(curl -fsSL https://df2.griko.id/check-hostname.sh)"
```

Available hostnames:

- `dotfiles.griko.id`
- `df1.griko.id`
- `df2.griko.id`

## Extra steps

- If `xcode-select --install` does not work, download manually at <https://developer.apple.com/download/more/?=xcode>
- Remember to `eval "$(ssh-agent -s)"` and `ssh-add -K`
