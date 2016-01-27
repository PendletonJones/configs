#! /usr/bin/env bash




# USER CREATED / ADDED FUNCTIONALITY 

function mcd(){
	mkdir -p $1
	cd $1
}

function extract(){
	if [ -z "$1" ]; then
		# display usage if no parameters given 
		echo "Usage: extract <path/file_path>.<zip|rar|bz2|qz|tar|tbz2|tgz|Z\7Z\xz|ex|tar.bz2|tar.gz|tar.xz>"
	else
		if [-f $1 ]; then
			# NAME=${1%.*}
			# mkdir $NAME && cd $NAME
			case $1 in 
			  *.tar.bz2)   tar xvjf ../$1    ;;
			  *.tar.gz)    tar xvzf ../$1    ;;
			  *.tar.xz)    tar xvJf ../$1    ;;
			  *.lzma)      unlzma ../$1      ;;
			  *.bz2)       bunzip2 ../$1     ;;
			  *.rar)       unrar x -ad ../$1 ;;
			  *.gz)        gunzip ../$1      ;;
			  *.tar)       tar xvf ../$1     ;;
			  *.tbz2)      tar xvjf ../$1    ;;
			  *.tgz)       tar xvzf ../$1    ;;
			  *.zip)       unzip ../$1       ;;
			  *.Z)         uncompress ../$1  ;;
			  *.7z)        7z x ../$1        ;;
			  *.xz)        unxz ../$1        ;;
			  *.exe)       cabextract ../$1  ;;
			  *)           echo "extract: '$1' - unknown archive method" ;;
			esac
		else
			echo "$1 - the file does not exist"
		fi
	fi
}

# function to move up several directories at once, copied off internet. 
function up()
{
    dir=""
    if [ -z "$1" ]; then
        dir=..
    elif [[ $1 =~ ^[0-9]+$ ]]; then
        x=0
        while [ $x -lt ${1:-1} ]; do
            dir=${dir}../
            x=$(($x+1))
        done
    else
        dir=${PWD%/$1/*}/$1
    fi
    cd "$dir";
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

function add_dock_space {
    defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
}

export -f mcd
export -f up
export -f extract
export -f parse_git_branch
export -f parse_git_dirty
export -f add_dock_space
