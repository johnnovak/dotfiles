# Overview

This repo contains my universal dotfiles for macOS and Linux.

Tested on:

* macOS Sequoia 15.2
* Debian 10 on WSL2 (Windows 10)


# Requirements

## Common

- bash 5.2+
- git 2.39.3+
- GNU grep 3.1+
- neovim 0.11+
- tmux 3.5a+
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

### Linux / WSL2

    sudo apt install zsh tmux git curl tig

Optionally, if you want to use rxvt on X:

    sudo apt install rxvt-unicode-256color

See [this blog post](https://blog.johnnovak.net/2016/11/13/a-minimalist-openbox-desktop-for-vim-freaks/)
for instructions on setting up a Vim-friendly desktop environment on
Crunchbang++.


### macOS

Using MacPorts:

    sudo port install grep coreutils tmux tig neovim

The system-provided **bash**, **zsh** and **git** versions are usually fine.


## Installing the dotfiles

Clone this repo to `~/.dotfiles` and then do the following:

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

On macOS, MacPorts usually has the latest NeoVim version.

On Linux, download the latest binaries directly from the [NeoVim releases
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
for further details.


## Installing special font for NeoVim (optional)

To get nice icons in NERDTree in NeoVim on Linux, install **JetBrainsMono Nerd
Font** from [here](https://www.nerdfonts.com/font-downloads).

This step is not necessary in Kitty on macOS as Kitty implements NERDFont
glyph fallback out-of-the-box.


## Windows / WSL2 setup

### wsltty

Copy the contents of `wsl/wsltty/` to
`C:\Users\<USER>\AppData\Roaming\wsltty\`, restart WSL2, then set the `lux`
theme in the settings.


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
