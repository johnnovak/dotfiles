# Overview

This repo contains my universal dotfiles for OS X, Debian on WSL2/Window 10,
Linux, and Cygwin.

Tested on:

* OS X Mojave (10.14)
* Debian 10 on WSL2 (Windows 10)
* Latest cygwin on Windows 10


# Requirements

- bash 5.0+
- zsh 5.7+
- git 2.20+
- GNU grep 3.3+
- tmux 2.8+
- neovim 0.5.0-dev (latest)

For Linux, there's also some additional configs that turn a vanilla
Crunchbang++ 1.0 install into a Vim friendly desktop environment. See [this
blog post] for details.


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


### OS X

Many of the configs require GNU coreutils. To install them on MacPorts:

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

