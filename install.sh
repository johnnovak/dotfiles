#/usr/bin/env bash

PWD=`pwd`

create_symlinks() {
  find $1 -maxdepth $2 -name _\* | sed 's#\(.*/\)_\(.*\)#'$PWD/'\1_\2 '$3'\2#' | xargs -n 2 ln -s -f
}

create_platform_symlinks() {
  create_symlinks $1 1 $HOME/.
  create_symlinks $1/config 1 $HOME/.config/
}

create_symlinks common 2 $HOME/.

mkdir -p $HOME/.config

if [[ "$OSTYPE" == 'darwin'* ]]; then
  create_platform_symlinks osx

elif [[ "$OSTYPE" == 'linux'* ]]; then
  create_platform_symlinks linux

elif [[ "$OSTYPE" == 'cygwin'* ]]; then
  create_platform_symlinks cygwin
fi

