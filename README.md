# Overview

This repo contains my universal dotfiles for OS X, Linux (native and WSL2),
and Cygwin.

Tested on:

* macOS Monterey (12.5.1)
* Debian 10 on WSL2 (Windows 10)
* Latest cygwin on Windows 10


# Requirements

## Common

- bash 5.0+
- zsh 5.7+
- git 2.20+
- GNU grep 3.3+
- tmux 2.8+
- neovim 0.8.0+

## Platform specific

### macOS

- [kitty](https://sw.kovidgoyal.net/kitty/)

### WSL2

- [wsltty](https://github.com/mintty/wsltty)
- [win32yank](https://github.com/equalsraf/win32yank) for clipboard
support in Neovim


# Installation

## Installing the dependencies

### Linux

    sudo apt install zsh tmux git curl

Optionally, if you want to use rxvt on X:

    sudo apt install rxvt-unicode-256color

See [this blog post](https://blog.johnnovak.net/2016/11/13/a-minimalist-openbox-desktop-for-vim-freaks/)
for instructions on setting up a Vim-friendly desktop environment on
Crunchbang++.


### macOS

    sudo port install grep coreutils zsh tmux git

To set the MacPorts `zsh` as the default shell:

    sudo chpass -s '/opt/local/bin/zsh' $USER


## Installing the dotfiles

Clone this repo somewhere (e.g. `~/.dotfiles`) and then do the following:

```
cd ~/.dotfiles
./install.sh
```

The script only creates symlinks and is completely non-destructive; it creates
backups of any existing files. You can also start it with `-d` for a dry-run.

If you are using a different location than `~/.dotfiles`, you must manually
set `DOTFILES` to point to the cloned repo in `~/.bashrc-pre` and
`~/.zshrc-pre` after the installation.


## Installing NeoVim plugins

1. Execute the following:

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ &&
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2. Start NeoVim, then execute `:PackerSync`

Refer to the [packer instructions](https://github.com/wbthomason/packer.nvim)
for further details


## .zshrc-pre suggestions

### macOS

```zsh
# Aliases
alias grep=ggrep
alias vim=nvim
alias dircolors=gdircolors

# Use nvim when editing git commits
EDITOR=nvim
```
