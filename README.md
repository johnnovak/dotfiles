Notes
-----

This is a collection of my current set of dotfiles. Most of them are
configured in a way that they retain their functionality across different
platforms (Linux, Cygwin, OS X) without any changes (e.g. copy/pasting using
the system clipboard in Vim, mouse support in terminal etc.).

Vim
---

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

OS X
----

Tested on OS X El Capitan (10.11).

tmux 2.1 and GNU grep are required.


```
$ sudo port install tmux tmux-pasteboard grep
```
