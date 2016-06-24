#! /usr/bin/env bash
# vim: set filetype=sh :


# pure convenience stuff
alias mkdir="mkdir -pv"
alias py3="python3.4"
alias py2="python"
alias breload="source ~/.bashrc"
alias show_path="echo $PATH | awk -v RS=: '1'"
alias vbm="vboxmanage"
alias mv="mv -vn"



# make grep nice and stuff
alias g='grep'
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -a'
alias lf='ls -pal | grep -v /'
alias lsd="ls -dl */"



# docker shorcuts
alias dmm="docker-machine"
alias dcc="docker-compose"

# tmux shortcuts
alias tmux="TERM=screen-256color-bce tmux"
tatt(){
	tmux a -t $1
}
