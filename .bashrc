# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Set some colors
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color

# don't put duplicate lines in the history. See bash(1) for more options
export EDITOR=/usr/bin/vim    # the one and only editor
export HISTFILESIZE=300000    # save 300000 commands
export HISTCONTROL=ignoredups    # no duplicate lines in the history.
export HISTSIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s histappend
export PROMPT_COMMAND='history -a'


# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
eval `dircolors -b`
alias ls='ls --color=auto'
#alias dir='ls --color=auto --format=vertical'
#alias vdir='ls --color=auto --format=long'
fi

alias ls="ls -FHG"

. /home/will/.aliases
. /home/will/.functions

# export PATH=/opt/openoffice.org3/program:/home/will/bin:$PATH

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in
    if [ -z "$debian_chroot" -a -r /etc/debian_chroot ]; then
debian_chroot=$(cat /etc/debian_chroot)
    fi

# A color and a non-color prompt:    
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w \$ '

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '

# If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
    *)
    ;;
    esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi


# This line was appended by KDE
# Make sure our customised gtkrc file is loaded.
    export GTK2_RC_FILES=$HOME/.gtkrc-2.0

#------------------------------------------
#------WELCOME MESSAGE---------------------
# customize this first message with a message of your choice.
# this will display the username, date, time, a calendar, the amount of users, and the up time.
    clear
# Gotta love ASCII art with figlet
    alias figlet=/usr/local/bin/figlet
    figlet "Welcome, Poorna!";
    echo -e ""
    echo -ne "Today is "; date
    echo -e ""; cal ;
    echo "";

#------------------------------------------
#------ENCRYPTION/DECRYPTION--------------
# requires gpg
# the proper way to use these functions is simply to enter "encrypt filename" or "decrypt filename"
encrypt ()
{
    gpg -ac --no-options "$1"
}

decrypt ()
{
    gpg --no-options "$1"
}
#------------------------------------------
#------Extraction of compressed files--------------
# from ARCH Wiki

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
    *.tar.gz)    tar xvzf $1    ;;
    *.bz2)       bunzip2 $1     ;;
    *.rar)       rar x $1       ;;
    *.gz)        gunzip $1      ;;
    *.tar)       tar xvf $1     ;;
    *.tbz2)      tar xvjf $1    ;;
    *.tgz)       tar xvzf $1    ;;
    *.zip)       unzip $1       ;;
    *.Z)         uncompress $1  ;;
    *.7z)        7z x $1        ;;
    *)           echo "don't know how to extract '$1'..." ;;
    esac
    else
        echo "'$1' is not a valid file!"
            fi }

 export PATH=/Applications/MATLAB_R2013a.app/bin:$PATH
 alias matlab=/Applications/MATLAB_R2013a.app/bin/matlab
