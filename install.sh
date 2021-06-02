#!/usr/bin/env bash

# ----------------------------------------------------------------------------
# Script to install the dotfiles into the current users's home directory as
# symlinks.
#
# If a destination file already exists, a backup will be created first with
# the .bak extension. If the backup file exists too, *.bak2, *.bak3 etc. will
# be tried until a non-existing filename is found.
# ----------------------------------------------------------------------------

YELLOW=$'\e[01;35m'
NC=$'\e[00m'

# $1  - filename
# OUT - unique filename with a number appended starting from 2 if the file
#       already exists
unique_name() {
  if [ ! -e "$1" ]; then
    echo $1
  else
    N=2
    until [ ! -e "$1$N" ]; do
      ((N++))
    done
    echo "$1$N"
  fi
}

# $1 - OS type (osx|linux|cygwin)
# $2 - dest path prefix
# $3 - max depth
create_symlinks() {
  for FNAME in $(find $1 -maxdepth $3 -name _\*); do
    TARGET=$(echo "$FNAME" | sed 's#\(.*/\)_\(.*\)#'$PWD/'\1_\2#')
    LINK_NAME=$(echo "$FNAME" | sed 's#\(.*/\)_\(.*\)#'$2'\2#')

    if [ -e "$LINK_NAME" ]; then
      BACKUP_NAME=$(unique_name "$LINK_NAME.bak")
      if [ ! $DRY_RUN ]; then
        mv "$LINK_NAME" "$BACKUP_NAME"
      fi
      echo "${YELLOW}Backed up $LINK_NAME as $BACKUP_NAME$NC"
    fi

    if [ ! $DRY_RUN ]; then
      ln -s "$TARGET" "$LINK_NAME"
    fi
    echo "Created symlink: $LINK_NAME -> $TARGET"
  done
}

create_platform_symlinks() {
  create_symlinks "$1" "$HOME/." 1

  if [ ! $dry_run ]; then
    mkdir -p "$HOME/.config"
  fi
  create_symlinks "$1/config" "$HOME/.config/" 1
}

create_if_not_exist() {
  if [ ! -e "$1" ]; then
    if [ ! $DRY_RUN ]; then
      touch $1
    fi
    echo "Created empty file: $1"
  fi
}

detect_os() {
  if [ $WSL_DISTRO_NAME ]; then
    echo "wsl"
  else
    case "$OSTYPE" in
      darwin*) echo "osx"     ;;
      linux*)  echo "linux"   ;;
      cygwin*) echo "cygwin"  ;;
      *)       echo "unknown" ;;
    esac
  fi
}

run() {
  PWD=`pwd`

  OS=$(detect_os)
  case $OS in
    osx)    create_platform_symlinks osx    ;;
    linux)  create_platform_symlinks linux  ;;
    wsl)    create_platform_symlinks wsl    ;;
    cygwin) create_platform_symlinks cygwin ;;
    *)      echo "ERROR: unsupported platform"
            exit 1 ;;
  esac

  create_platform_symlinks common

  create_if_not_exist "$HOME/.bashrc-pre"
  create_if_not_exist "$HOME/.bashrc-post"
  create_if_not_exist "$HOME/.zshrc-pre"
  create_if_not_exist "$HOME/.zshrc-post"
}

#=== START ===================================================================

if [ "$1" == "-d" ]; then
  DRY_RUN=1
fi

cat << EOF

This script will install the dotfiles into your home directory.
Only symlinks will be created; existing files will be backed up.

Start with -d for a dry-run.

EOF

read -p "Proceed? (y/n) " CHOICE
if [ "$CHOICE" == "y" ]; then
  echo
  run
fi

