<!-- markdownlint-disable MD036 -->

# ~/.dotfiles

Dotfiles for my Linux, macOS, and Windows workstations when I'm having a bad day (read: reinstalling from scratch) 🏖️

---

**Table of contents**

- [Linux](#linux)
- [macOS](#macos)
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

- Run `compaudit | xargs chmod g-w,o-w` on an `oh-my-zsh`-enabled `zsh` session

## Windows

**Install scripts**

TODO

**Extra steps**

TODO
