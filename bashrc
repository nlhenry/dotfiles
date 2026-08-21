# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability.
# force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt fiorce_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Bash prompt configuration
#
# PS1 is the primary command prompt shown before each command.
# General structure:
#   [TIME]USER@HOSTNAME:CURRENT_DIRECTORY$
#
# The escape sequences \[ and \] tell Bash that the enclosed characters
# do not take up visible space. They are important around color codes so
# cursor positioning and line editing work correctly.
#

# PS1="\
# [\[\e[34m\]\t\[\e[0m\]]\
# \[\e[38;5;208m\]\u\[\e[0m\]\
# @\
# \[\e[38;5;129m\]\h\[\e[0m\]\
# :\
# \[\e[32m\]\w\[\e[0m\]\
# \$ "

#
# Part-by-part breakdown:
#
# PS1=
#   Sets Bash's primary command prompt.
#
# "
#   Starts a double-quoted string. Double quotes are needed so Bash can
#   interpret the prompt escapes correctly.
#
# \[
#   Begins a section containing invisible/non-printing characters.
#
# \e[34m
#   Starts blue text.
#
# \t
#   Displays the current time in 24-hour format, such as 14:37:05.
#
# \e[0m
#   Resets text formatting and color back to normal.
#
# \]
#   Ends the invisible/non-printing section.
#
# [
# ]
#   Literal square brackets displayed around the time.
#
# \e[38;5;208m
#   Starts 256-color text using color number 208, usually orange.
#
# \u
#   Displays the current username.
#
# \e[0m
#   Resets the color.
#
# @
#   Literal at-sign separating the username and hostname.
#
# \e[38;5;129m
#   Starts 256-color text using color number 129, usually purple.
#
# \h
#   Displays the hostname, usually without the domain name.
#
# \e[0m
#   Resets the color.
#
# :
#   Literal colon separating the hostname and directory.
#
# \e[32m
#   Starts green text.
#
# \w
#   Displays the current working directory.
#   For example: /home/alex/projects
#
# \e[0m
#   Resets the color.
#
# \$
#   Displays:
#     $ for a regular user
#     # for root
#
# The final space adds a space after the prompt symbol.
#
# Result example:
# [14:37:05]alex@computer:/home/alex/projects$
#
#-------------------------------------------------------------------------------------------#
#
# Custom two-line Bash prompt
# First line: time, username, hostname, and current directory
# Second line: prompt symbol
#
PS1="\
\[\e[38;5;39m\][\t]\[\e[0m\] \
\[\e[38;5;208m\]\u\[\e[0m\]\
\[\e[38;5;245m\]@\[\e[0m\]\
\[\e[38;5;129m\]\h\[\e[0m\] \
\[\e[38;5;70m\]\w\[\e[0m\]\n\
\[\e[38;5;208m\]>\[\e[0m\] "
#
# Configuration File System Breakdown
#
files() {
	echo ".bashrc"
	echo ".bash_aliases"
	echo ".config"
	echo "   |_.tmux"
	echo "   |_.nvim"
	echo "Archive"
	echo "Inbox"
	echo "Projects"
	echo "Media"
	echo "Resources"
	echo "Routines"
	echo ""
}
