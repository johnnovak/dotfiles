# Overview

This repo contains my universal dotfiles for OS X, Linux (native and WSL2) and
Cygwin.  The general idea is that a core set of functionality should be
available on all platforms (e.g. shell behaviour, system clipboard, mouse
support in Vim and tmux, unified colourscheme etc.), and there are also
platform specific tweaks and configurations for each platform.

Tested with:

* Crunchbang++ 10 (based on Debian 10 Buster)
* OS X El Capitan (10.11)
* Debian 10 with WSL2 on Windows 10
* Latest cygwin on Windows 7 (I'm not using Cygwin nowadays, so expect breakages)


# Requirements

- bash
- git 2.6+
- GNU grep 2+
- tmux 2.1
- vim 7.3.855 (Lua support is required for neocomplete)
- zsh 5.1.1

For Linux there's also some additional configs that turn a vanilla
Crunchbang++ 1.0 install into a Vim friendly desktop environment. See [this
blog post] for details.


# Installation

## Installing the dependencies

### Linux

```
sudo apt install zsh tmux git curl vim-nox
```

Optionally, if you want to use rxvt in X:

```
sudo apt install rxvt-unicode-256color
```


### OS X

Many of the configs require GNU coreutils. To install them with MacPorts:

```
sudo port install grep
sudo port install coreutils +with_default_names
```

Then proceed to install the rest:

```
sudo port install zsh tmux git curl
sudo port install vim +huge+lua+python27
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
set `DOTFILES` to point to your desired location in `~/.bashrc-pre` and
`~/.zshrc-pre` after the installation.


# Notes

## vim

### Installing Vim

You'll need Vim compiled with Lua, Python, and mouse support for all the
features to work.

[neocomplete](https://github.com/Shougo/neocomplete.vim) requires **Vim
7.3.885+** with **Lua enabled**.

On Linux:

```
sudo apt-get install vim-nox
```

On OS X:

```
sudo port install vim +huge+lua+python27
```


### Installing Vundle

The Vim config is [Vundle](https://github.com/VundleVim/Vundle.vim) based.
Install Vundle as described on the project page, then start Vim and do a
`:VundleInstall`.


### Airline

If you want nice [airline](https://github.com/bling/vim-airline) symbols in
your status line, you will need to install a [powerline patched
font](https://github.com/Lokaltog/powerline-fonts).


### Using the same vimrc file for vim/Cygwin and native gVim under Windows

The easiest way to do this to create an NTFS junction in your Windows user
directory that points point to the **actual** `.vimrc` file in your Cygwin
home directory (pointing to the symlink won't work, e.g. to `~/.vimrc`).

To do this, issue the following command from the Windows command line (you
will probably need admin privileges for this):

```
mklink C:\Users\<user_name>\_vimrc C:\<cygwin_path>\home\<user_name>\.dotfiles\common\_vimrc
```

There's some logic in `vimrc` to make Vundle work with this setup.

