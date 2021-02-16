<!-- markdownlint-disable MD036 -->

# ~/.dotfiles

Dotfiles for my Linux, macOS, and Windows workstations when I'm having a bad day (read: reinstalling from scratch) 🏖️

---

**Table of contents**

- [Linux](#linux)
- [macOS](#macos)
- [macOS (lite)](#macos-lite)
- [Windows](#windows)

---

## Linux

**Install scripts**

TODO

**Extra steps**

TODO

## macOS

**Install scripts**

```sh
sh -c "$(curl -fsSL https://df.griko.id/macos/core.sh)"
zsh -c "$(curl -fsSL https://df.griko.id/macos/extra.sh)"
```

**Extra steps**

- If `xcode-select --install` does not work, download manually at <https://developer.apple.com/download/more/?=xcode>
- Run `compaudit | xargs chmod g-w,o-w` on an `oh-my-zsh`-enabled `zsh` session

## macOS (lite)

**Install scripts**

```sh
sh -c "$(curl -fsSL https://df.griko.id/macos-lite/core.sh)"
zsh -c "$(curl -fsSL https://df.griko.id/macos-lite/extra.sh)"
```

**Extra steps**

[Same as macOS, see above.](#macos)

## Windows

**Install scripts**

TODO

**Extra steps**

TODO
