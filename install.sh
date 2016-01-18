#/usr/bin/env bash

PWD=`pwd`

create_symlinks() {
  find $1 -name _\* -maxdepth 2 | sed 's#\(.*/\)_\(.*\)#'$PWD/'\1_\2 '$HOME'/.\2#' | xargs -n 2 ln -s -f
}

create_symlinks common

if [[ "$OSTYPE" == 'darwin'* ]]; then
  create_symlinks osx

elif [[ "$OSTYPE" == 'linux'* ]]; then
  create_symlinks linux

elif [[ "$OSTYPE" == 'cygwin'* ]]; then
  create_symlinks cygwin
fi

