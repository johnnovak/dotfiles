##############################################################################
# GENERAL
##############################################################################

# disable Ctrl-S
stty stop undef

# disable Ctrl-Q
stty start undef

#export PATH=$PATH:$HOME/bin
export EDITOR=/usr/bin/editor
export LESS='-R'
eval `lesspipe`

# History settings
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=1000
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"

# Append to history rather than overwrite
shopt -s histappend

# Tab completion for sudo
complete -cf sudo

##############################################################################
# COLOR DEFINITIONS
##############################################################################

RED=$'\e[01;31m'
GREEN=$'\e[01;32m'
YELLOW=$'\e[01;33m'
BLUE=$'\e[01;34m'
PURPLE=$'\e[01;35m'
CYAN=$'\e[01;36m'
WHITE=$'\e[01;37m'

DARKRED=$'\e[00;31m'
DARKGREEN=$'\e[00;32m'
DARKYELLOW=$'\e[00;33m'
DARKBLUE=$'\e[00;34m'
DARKPURPLE=$'\e[00;35m'
DARKCYAN=$'\e[00;36m'
GREY=$'\e[00;37m'

RESET=$'\e[00m'

##############################################################################
# PROMPT
##############################################################################

# Show git branch in prompt
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/[\1]/"
}

PS1="\n\[$DARKCYAN\]\u@\h \[$YELLOW\]\w \[$GREEN\]\$(parse_git_branch)\n"\
"\[$PURPLE\]\$\[$RESET\] "

##############################################################################
# COLORS
##############################################################################

# Use 16 colors in OS X Terminal.app, 256 colors on other platforms
if [[ "$OSTYPE" == 'darwin'* ]]; then
    export TERM=xterm
else
    export TERM=xterm-256color
fi

# Enable terminal colors
export CLICOLOR=1

# ls colors
export LS_OPTIONS='--color=auto -CF'
#export LSCOLORS='Bxgxfxfxcxdxdxhbadbxbx'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'

# grep colors
export GREP_OPTIONS='--color=auto'

# less colors
export LESS_TERMCAP_mb=$RED         # begin blinking
export LESS_TERMCAP_md=$DARKBLUE    # begin bold
export LESS_TERMCAP_me=$RESET       # end mode
export LESS_TERMCAP_se=$RESET       # end standout-mode
export LESS_TERMCAP_so=$CYAN        # begin standout-mode - info box
export LESS_TERMCAP_ue=$RESET       # end underline
export LESS_TERMCAP_us=$GREEN       # begin underline

##############################################################################
# ALIASES
##############################################################################

alias l='ls -hl'
alias la='ls -Ahl'
alias lsl='ll --color=always | less'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias mkdir='mkdir -pv'

alias fhere='find . -name'

alias info='info --vi-keys'

alias df='df -Tha --total'
alias du='du -ach | sort -h'
alias free='free -mt'

alias gaa='git add -u .'
alias gcom='git commit'
alias gst='git status'
alias gps='git pull --summary'
alias gch='git show --pretty="format:" --name-only'
alias gco='git checkout'
alias gbr='git branch'
alias ghst='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'

alias oo='open .'
alias sqp='rlwrap sqlplus'

alias wget='wget -c'

##############################################################################
# FUNCTIONS
##############################################################################

mcd() {
  mkdir -p $1
  cd $1
}

# Grep for process
psgrep() {
  if [ ! -z $1 ] ; then
    echo "Grepping for processes matching $1..."
    ps aux | grep $1 | grep -v grep
  else
    echo "ERROR: need name to grep for"
  fi
}

# Recursive delete functions
rm-vimbackup() {
  echo -n "Recursively deleting vim backup files from "
  pwd
  find ./ -name '*~' -exec rm '{}' \; -print -or -name ".*~" -exec rm {} \; -print
}

rm-dsstore() {
  echo -n "Recursively deleting .DS_Store files from "
  pwd
  find ./ -name '.DS_Store' -exec rm -rf '{}' \; -print
}

rm-pyc() {
  echo -n "Recursively deleting .pyc files from "
  pwd
  find ./ -name '*.pyc' -exec rm -rf '{}' \; -print
}

function extract {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ] ; then
      # NAME=${1%.*}
      # mkdir $NAME && cd $NAME
      case $1 in
        *.tar.bz2) tar xvjf ../$1    ;;
        *.tar.gz)  tar xvzf ../$1    ;;
        *.tar.xz)  tar xvJf ../$1    ;;
        *.lzma)    unlzma ../$1      ;;
        *.bz2)     bunzip2 ../$1     ;;
        *.rar)     unrar x -ad ../$1 ;;
        *.gz)      gunzip ../$1      ;;
        *.tar)     tar xvf ../$1     ;;
        *.tbz2)    tar xvjf ../$1    ;;
        *.tgz)     tar xvzf ../$1    ;;
        *.zip)     unzip ../$1       ;;
        *.Z)       uncompress ../$1  ;;
        *.7z)      7z x ../$1        ;;
        *.xz)      unxz ../$1        ;;
        *.exe)     cabextract ../$1  ;;
        *)         echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

##############################################################################
# Source machine specific bashrc
##############################################################################
. ~/.bashrc.user
