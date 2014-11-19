##############################################################################
# GENERAL
##############################################################################

export PATH=$PATH:$HOME/bin
export EDITOR=vim
export LESS='-R'

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
# PROMPT
##############################################################################

# Show git branch in prompt
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/[\1]/"
}

RED=$'\e[01;31m'
GREEN=$'\e[01;32m'
YELLOW=$'\e[01;33m'
BLUE=$'\e[01;34m'
PURPLE=$'\e[01;35m'
CYAN=$'\e[01;36m'
WHITE=$'\e[01;37m'
RESET=$'\e[00m'

PS1="\n\[$BLUE\]\u@\h \[$YELLOW\]\w \[$GREEN\]\$(parse_git_branch)\n"\
"\[$RED\]\$\[$RESET\] "

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
if [[ "$OSTYPE" == 'cygwin' ]]; then
    alias ls='ls --color=auto'
fi

export LS_OPTIONS='--color=auto'
export LSCOLORS='Bxgxfxfxcxdxdxhbadbxbx'

# grep colors
export GREP_OPTIONS='--color=auto'

# less colors
export LESS_TERMCAP_mb=$GREEN
export LESS_TERMCAP_md=$RED
export LESS_TERMCAP_me=$RESET
export LESS_TERMCAP_se=$RESET
export LESS_TERMCAP_so=$PURPLE
export LESS_TERMCAP_ue=$RESET
export LESS_TERMCAP_us=$GREEN

##############################################################################
# ALIASES
##############################################################################

alias l='ls -ahl'
alias ..='cd ..'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias mkdir='mkdir -p -v'
alias df='df -h'
alias du='du -h -c'

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

##############################################################################
# FUNCTIONS
##############################################################################

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

# Extract files
ex() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjvf $1    ;;
      *.tar.gz)    tar xzvf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       rar x $1       ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xjvf $1    ;;
      *.tgz)       tar xzvf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

##############################################################################
# Source machine specific bashrc
##############################################################################
. ~/.bashrc.user
