#! /bin/bash

ln -s .vimrc ~/.vimrc
ln -s .bashrc ~/.bashrc
ln -s .bash_profile ~/.bash_profile
ln -s .profile ~/.profile


# add in .bash_prompt.sh
# add in .bashrc2

ln -s .tmux.conf ~/.tmux.conf
ln -s .vimrc ~/.vimrc


# its a start.
sudo apt-get -y install git vim python3.4 
sudo apt-get -y install libjpeg-dev build-essential libpq-dev
sudo apt-get -y install python-pip
sudo apt-get -y install python-setuptools

sudo apt-get -y install tree libreoffice virtualbox vagrant nmap
sudo apt-get -y install irssi nodejs chrome firefox tmux
sudo apt-get -y install ruby-full
sudo apt-get -y install postgresql
sudo apt-get -y isntall postgresql-contrib


sudo pip install --update pip
sudo npm install -g npm