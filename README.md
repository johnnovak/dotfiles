Notes
-----

Vim
===

The Vim config is [Vundle](https://github.com/gmarik/Vundle.vim) based.
Install Vundle as described on the project page, then start vim and do a
`:PluginInstall`.

Requires **Vim 7.3.885+** with **Lua enabled** for
[neocomplete](https://github.com/Shougo/neocomplete.vim) to work (see the
[project page](https://github.com/Shougo/neocomplete.vim) for details).
Alternatively, you can use
[neocomplcache](https://github.com/Shougo/neocomplcache.vim) with vanilla
Vim (much slower), or disable neocomplete altogether in `vimrc`.

If you want nice [airline](https://github.com/bling/vim-airline) symbols on
your status line, you will need to install a powerline patched font (for
example, from [here](https://github.com/Lokaltog/powerline-fonts)). The config
assumes you have such a font installed.

