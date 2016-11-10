#/usr/bin/env bash

# ----------------------------------------------------------------------------
# Script to install the dotfiles into the current users's home directory as
# symlinks.
#
# If a destination file already exists, a backup will be created first with
# the .bak extension. If the backup file exists too, *.bak2, *.bak3 etc. will
# be tried until a non-existing filename is found.
# ----------------------------------------------------------------------------

YELLOW="\033[1;33m"
NC="\033[0m"

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
# $2 - max search depth
# $3 - dest path prefix
create_symlinks() {
  for FNAME in $(find $1 -maxdepth $2 -name _\*); do
    TARGET=$(echo "$FNAME" | sed 's#\(.*/\)_\(.*\)#'$PWD/'\1_\2#')
    LINK_NAME=$(echo "$FNAME" | sed 's#\(.*/\)_\(.*\)#'$3'\2#')

    if [ -e "$LINK_NAME" ]; then
      BACKUP_NAME=$(unique_name "$LINK_NAME.bak")
      mv "$LINK_NAME" "$BACKUP_NAME"
      echo "${YELLOW}Backed up $LINK_NAME as $BACKUP_NAME$NC"
    fi

    ln -s "$TARGET" "$LINK_NAME"
    echo "Created symlink: $LINK_NAME -> $TARGET"
  done
}

create_platform_symlinks() {
  create_symlinks "$1" 1 "$HOME/."

  mkdir -p "$HOME/.config"
  create_symlinks "$1/config" 1 "$HOME/.config/"
}

run() {
  PWD=`pwd`

  case "$OSTYPE" in
    darwin*) create_platform_symlinks osx    ;;
    linux*)  create_platform_symlinks linux  ;;
    cygwin*) create_platform_symlinks cygwin ;;
    *)       echo "ERROR: unsupported platform: $OSTYPE"
             exit 1 ;;
  esac

  create_symlinks common 2 "$HOME/."
}

#=== START ===================================================================

cat << EOF
This script will install the dotfiles into your home directory.
Only symlinks will be created that will point the config files in this
directory. If a destination file already exists, a backup will be created
first with the .bak extension. If the backup file exists too, *.bak2, *.bak3
etc. will be tried until a non-existing filename is found.

EOF

read -p "Do you wish to proceed? (yes/no) " CHOICE
if [ "$CHOICE" == "yes" ]; then
  echo
  run
fi

