export TERM=xterm-256color
export EDITOR=vim
export PATH=$PATH:$HOME/bin
export LESS='-R'
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=1000
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"

# Tab completion for sudo
complete -cf sudo

# Append to history rather than overwrite
shopt -s histappend

# Show git branch in prompt
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/[\1]/"
}

RED="\[\033[01;31m\]"
GREEN="\[\033[01;32m\]"
YELLOW="\[\033[01;33m\]"
BLUE="\[\033[01;34m\]"
WHITE="\[\033[00m\]"

PS1="\n$BLUE\u@\h $YELLOW\w $GREEN\$(parse_git_branch)\n$RED\$$WHITE "

# Enable terminal colors
export CLICOLOR=1

# ls colors
alias ls='ls --color=auto'      # for Cygwin
export LS_OPTIONS='--color=auto'
export LSCOLORS='Bxgxfxfxcxdxdxhbadbxbx'

# grep colors
export GREP_OPTIONS='--color=auto'

# less colors
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;35m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Aliases
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
alias gco='git checkout'
alias gbr='git branch'
alias ghst='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'

alias sqp='rlwrap sqlplus'

###############################################################################
# FUNCTIONS
###############################################################################

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

###############################################################################
# CCLAS
###############################################################################

alias cdcclas='cd /cygdrive/c/work/cclas/'
alias cdtools='cd /cygdrive/c/work/cclas/msd-cclas/appServices/jsc/tools'
alias cdmsdcclas='cd /cygdrive/c/work/cclas/msd-cclas/'
alias cddatamig='cd /cygdrive/c/work/cclas/cclas-data-migration/'
alias cdjboss='cd /cygdrive/c/work/jboss7-1.4/bin'

export ORACLE_SID=orcl

#export ANT_OPTS="-Dhttp.proxyHost=aubne-s-vwprx01.ventyx.au.abb.com -Dhttp.proxyPort=8080 -Dhttp.nonProxyHosts=*.ventyx.abb.com,*.mincom.com,localhost"
#export ANT_OPTS="-Dhttp.nonProxyHosts=*.ventyx.abb.com,*.mincom.com,localhost"


###############################################################################
# OS SPECIFIC STUFF
###############################################################################
case "$OSTYPE" in
  linux*)  ;;
  darwin*) echo 'OS X' ;;
  cygwin)  echo 'Cygwin' ;;
  *bsd)    ;;
  *)       ;;
esac

