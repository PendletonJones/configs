# this script is called when a login shell is created. 
# (if it didn't exist, bash checks .bash_login, hten .profile)
# put single login type stuff in here, like MOTD

# execute the nonlogin script if it exists. 





# From Profile 
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


