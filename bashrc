# Default editor
export EDITOR=/opt/local/bin/vim

# Show git branch name in prompt
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

# Command prompt
NO_COLOR="\[\033[m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BYELLOW="\[\033[1;33m\]"

PS1="$YELLOW\u@\h$NO_COLOR $BYELLOW\w$NO_COLOR$GREEN\$(parse_git_branch)$NO_COLOR $RED\$$NO_COLOR "

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
alias l='ls -ahl'
alias ..='cd ..'
alias oo='open .'

alias gst='git status'

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
  echo -n "Recursively removing vim backup files from "
  pwd
  find ./ -name '*~' -exec rm '{}' \; -print -or -name ".*~" -exec rm {} \; -print
}

rm-dsstore() {
  echo -n "Recursively removing .DS_Store files from "
  pwd
  find ./ -name '.DS_Store' -exec rm -rf '{}' \; -print
}

rm-pyc() {
  echo -n "Recursively removing .pyc files from "
  pwd
  find ./ -name '*.pyc' -exec rm '{}' \; -print
}


rm-pyc() {
  echo -n "Recursively removing .svn files from"
  pwd
  find ./ -name '.svn' -exec rm -rf '{}' \; -print
}

