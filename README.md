# Overview

This repo contains my universal dotfiles for OS X, Linux (native and WSL2),
and Cygwin.

Tested on:

* OS X Mojave (10.14)
* Debian 10 on WSL2 (Windows 10)
* Latest cygwin on Windows 10


# Requirements

## Common

- bash 5.0+
- zsh 5.7+
- git 2.20+
- GNU grep 3.3+
- tmux 2.8+
- neovim 0.5.0-dev (latest)

## Platform specific

### OS X

- [kitty](https://sw.kovidgoyal.net/kitty/)

### WSL2

- [wsltty](https://github.com/mintty/wsltty)
- [win32yank](https://github.com/equalsraf/win32yank) for clipboard
support in Neovim


# Installation

## Installing the dependencies

### Linux

```
sudo apt install zsh tmux git curl
```

Optionally, if you want to use rxvt on X:

```
sudo apt install rxvt-unicode-256color
```

See [this blog post](https://blog.johnnovak.net/2016/11/13/a-minimalist-openbox-desktop-for-vim-freaks/)
for instructions on setting up a Vim-friendly desktop environment on
Crunchbang++.


### OS X

GNU coreutils are required. To install them on MacPorts:

```
sudo port install grep
sudo port install coreutils +with_default_names
```

Then proceed to install the rest:

```
sudo port install zsh tmux git curl
```


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

