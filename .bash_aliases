#! /usr/bin/env bash
# vim: set filetype=sh :

alias mkdir="mkdir -pv"
alias lsd="ls -dl */"
alias py3="python3.4"
alias py2="python"


tatt(){
	tmux a -t $1
}

. "$HOME/configs/cd_func.sh"


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

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# show only files, not directories.
alias lf='ls -pal | grep -v /'
alias g='grep'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias show_path="echo $PATH | awk -v RS=: '1'"
alias tmux="TERM=screen-256color-bce tmux"


alias m_show_status="/usr/local/show_status"

alias vbm="vboxmanage"
