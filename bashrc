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

# Show git branch name in prompt
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

# Command prompt
NO_COLOR="\[\033[m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BOLD_YELLOW="\[\033[1;33m\]"

PS1="$YELLOW\u@\h$NO_COLOR $BOLD_YELLOW\w$NO_COLOR$GREEN\$(parse_git_branch)$NO_COLOR $RED\$$NO_COLOR "

# Enable terminal colors
export CLICOLOR=1

# ls colors
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
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
alias l='ls -hl'
alias ll='ls -ahl'
alias ..='cd ..'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias mkdir='mkdir -p -v'
alias df='df -h'
alias du='du -h -c'
alias oo='open .'

alias gst='git status'

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

# A little clock that appeares in the terminal window
clock() {
  while true;do clear;echo "===========";date +"%r";echo "===========";sleep 1;done
}

# Show the current IP address if connected to the internet
showip() {
  lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'
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
  find ./ -name '*.pyc' -exec rm '{}' \; -print
}


rm-pyc() {
  echo -n "Recursively deleting .svn files from"
  pwd
  find ./ -name '.svn' -exec rm -rf '{}' \; -print
}

# Extract files
ex() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       rar x $1       ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

