##############################################################################
# GENERAL
##############################################################################
# disable loading global configs to fix cursor-not-at-the-end-of-line history
# bug on Debian
unsetopt global_rcs

# load color definitions
autoload -U colors && colors

# enable autocomplete
autoload -U compinit && compinit

# zmv for mass renaming
autoload -Uz zmv

# vi mode
bindkey -v
KEYTIMEOUT=1

# default editor
export EDITOR=vim

# history settings
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=HISTSIZE
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

##############################################################################
# KEY BINDINGS
##############################################################################

bindkey "^R" history-incremental-search-backward
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey "^X" vi-kill-eol

# fix for cursor position
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# prevent protected characters
zle -A kill-whole-line vi-kill-line
zle -A backward-kill-word vi-backward-kill-word
zle -A backward-delete-char vi-backward-delete-char

# Debian / Ubuntu sets these to vi-up-line-or-history etc,
# which places the cursor at the start of line, not end of line.
# See: http://www.zsh.org/mla/users/2009/msg00878.html
bindkey -M viins "\e[A" up-line-or-history
bindkey -M viins "\e[B" down-line-or-history
bindkey -M viins "\eOA" up-line-or-history
bindkey -M viins "\eOB" down-line-or-history

##############################################################################
# PROMPT
##############################################################################

# enable variable subtitution in PROMPT
setopt PROMPT_SUBST

# parse name of the git branch in the current directory
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/[\1]/"
}

# 2-line prompt displaying user@host, current dir and the git branch name:
# john@stark ~/.dotfiles [master]
# %
PROMPT="%{$fg[cyan]%}%n@%m %{$fg_bold[yellow]%}%~ %{$fg_bold[green]%}\$(parse_git_branch)%{$reset_color%}
%{$fg_bold[magenta]%}%% %{$reset_color%}"

# print empty line before the prompt
precmd() { print "" }

vim_ins_mode=""
vim_cmd_mode="%{$fg_bold[yellow]%}[cmd]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode
# indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the
# SIGINT, so if anything else depends on it, we will not break it
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}

RPROMPT='${vim_mode}'

##############################################################################
# COLORS
##############################################################################

# use 16 colors in OS X Terminal.app, 256 colors on other platforms
if [[ "$OSTYPE" == 'darwin'* ]]; then
    export TERM=xterm
else
    export TERM=xterm-256color
fi

# enable terminal colors
export CLICOLOR=1

# ls colors
alias ls='ls --color=auto -CF'
eval "`dircolors`"

# grep colors
alias grep='grep --color=auto'

# less colors
export LESS_TERMCAP_mb=${fg_bold[red]}      # begin blinking
export LESS_TERMCAP_md=${fg[blue]}          # begin bold
export LESS_TERMCAP_me=${reset_color}       # end mode
export LESS_TERMCAP_se=${reset_color}       # end standout-mode
export LESS_TERMCAP_so=${fg_bold[cyan]}     # begin standout-mode - info box
export LESS_TERMCAP_ue=${reset_color}       # end underline
export LESS_TERMCAP_us=${fg_bold[green]}    # begin underline

##############################################################################
# ALIASES
##############################################################################

# clear terminal
alias c='clear'

# ls variations
alias l='ls -hl'
alias la='ls -Ahl'
alias lsl='la --color=always | less'

# jump to n-th parent directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# always ask before deleting/overwriting stuff
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# create nested paths
alias mkdir='mkdir -pv'

# find from current dir
alias fhere='find . -name'

# enable vi mode in info
alias info='info --vi-keys'

# disk usage
alias df='df -Tha --total'
alias du='du -ach | sort -h'
alias free='free -mt'

# git shortcuts
alias gaa='git add -u .'
alias gcom='git commit'
alias gst='git status'
alias gps='git pull --summary'
alias gch='git show --pretty="format:" --name-only'
alias gco='git checkout'
alias gbr='git branch'
alias ghst='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'

# used on OS X
alias oo='open .'

# history support for sqlplus
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

# Source machine-specific settings
. ~/.bashrc.user
