# Overview

This repo contains my universal dotfiles for OS X, Linux and Cygwin.
The general idea is that a core set functionality should be available on all
platforms (e.g. shell behaviour, system clipboard and mouse support in Vim and
tmux, unified colourscheme etc.) and there are also platform specific
tweaks and configurations for each platform.

Tested on:

* Latest cygwin on Windows 7
* OS X El Capitan (10.11)
* Crunchbang 11 (Waldorf) (distupgraded to Debian Jessie)


# Requirements

- bash 3.2.57
- git 2.6.4
- GNU grep 2.22
- tmux 2.1
- vim 7.3.855 (Lua support is required for neocomplete)
- zsh 5.1.1


# Installation

```
cd $DOTFILES
./install.sh
```

This will create symlinks in your home folder to the config files in
`$DOTFILES`. This defaults to `~/.dotfiles` if not set.


## OS X

Many of the configs require GNU coreutils. To install them with MacPorts:

```
sudo port install grep
sudo port install coreutils +with_default_names
```


# Features

## Common

### bash

* Same colorscheme on all platforms

### tmux

TODO

### vim

Feature highlights:

* Seamless navigation between Vim and tmux splits with `Ctrl+jkl;`

**Installing Vim**

You'll need Vim compiled with Lua, Python and mouse support (among others) for all the features to
work:

On Linux:

```
sudo apt-get install vim-nox
```

On OS X:

```
sudo port install vim +huge+lua+python27
```

The Vim config is [Vundle](https://github.com/gmarik/Vundle.vim) based.
Install Vundle as described on the project page, then start Vim and do a
`:PluginInstall`.

[neocomplete](https://github.com/Shougo/neocomplete.vim) requires **Vim
7.3.885+** with **Lua enabled**.

Alternatively, [neocomplcache](https://github.com/Shougo/neocomplcache.vim)
can be used (much slower), or just disable neocomplete in `vimrc`.

If you want nice [airline](https://github.com/bling/vim-airline) symbols on
your status line, you will need to install a powerline patched font (for
example, from [here](https://github.com/Lokaltog/powerline-fonts)). The config
assumes you have such a font installed.

#### Using the same vimrc file for vim/Cygwin and native gVim under Windows

The easiest way to do this to create an NTFS junction in your Windows user
directory that points point to the **actual** `.vimrc` file in your Cygwin
home directory (pointing to the symlink won't work, e.g. to `~/.vimrc`).

To do this, issue the following command from the Windows command line (you
will probably need admin privileges for this):

```
mklink C:\Users\<user_name>\_vimrc C:\<cygwin_path>\home\<user_name>\.dotfiles\common\_vimrc
```

There's some logic in `vimrc` to make Vundle work with this kind of setup;
doing it any other way is not guaranteed to work.


### zsh

TODO


## OS X



## Linux

### OpenBox

TODO

### Terminator

TODO

### urxvt (Xdefaults)

TODO

### Xmodmap


## Cygwin

### minttyrc

TODO


## Misc

### Vrapper

TODO

