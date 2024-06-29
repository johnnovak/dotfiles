# Overview

This repo contains my universal dotfiles for macOS and Linux.

Tested on:

* macOS Sonoma (14.2.1)
* Debian 10 on WSL2 (Windows 10)


# Requirements

## Common

- bash 5.2+
- git 2.39.3+
- GNU grep 3.1+
- neovim 0.10+
- tmux 3.4+
- zsh 5.9+

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

    sudo apt install zsh tmux git curl tig

Optionally, if you want to use rxvt on X:

    sudo apt install rxvt-unicode-256color

See [this blog post](https://blog.johnnovak.net/2016/11/13/a-minimalist-openbox-desktop-for-vim-freaks/)
for instructions on setting up a Vim-friendly desktop environment on
Crunchbang++.


### macOS

Using MacPorts:

    sudo port install grep coreutils tmux tig

The system-provided **bash**, **zsh** and **git** versions are usually fine.

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


## Installing NeoVim

It's best to download the latest binaries directly from the [NeoVim releases
page](https://github.com/neovim/neovim/releases) on GitHub, then install it
into `~/bin/`.


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
# Manually installed binaries
export PATH="$HOME/bin:$PATH"

# Make GNU sed the default
export PATH="/opt/local/libexec/gnubin/:$PATH"

# Aliases
alias grep=ggrep
alias vim=nvim
alias dircolors=gdircolors

# Use nvim when editing git commits
EDITOR=nvim
```
