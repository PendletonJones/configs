# this script is called when a login shell is created. 
# (if it didn't exist, bash checks .bash_login, hten .profile)
# put single login type stuff in here, like MOTD

# execute the nonlogin script if it exists. 
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

