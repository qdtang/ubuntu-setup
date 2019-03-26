#!/bin/sh

# execute this script with 'sudo'

# update packages
apt-get update
apt-get --yes upgrade 

# softwares
apt-get --yes install build-essential
apt-get --yes install vim-gtk3
apt-get --yes install libboost-all-dev
apt-get --yes install git
apt-get --yes install terminator
apt-get --yes install cmake
apt-get --yes install valgrind
apt-get --yes install zeal
apt-get --yes install ddd

apt-get --yes install qt5-default qttools5-dev-tools qtcreator
# download linux manual for QtCreator Help from http://trunk.shinnok.com/qt/manpages.qch.gz

# install from official websites
#SmartGit
#anaconda3
#vs code

# install vm tools if automatic fullscreen does not work well
#apt-get install open-vm-tools-desktop

# install pip
#apt-get install python-pip python-dev
#pip install --upgrade pip
#pip install --upgrade virtualenv

#apt-get install flex
#apt-get install bison
#apt-get install octave

# end of softwares

# configurations

# .bash_aliases & .vimrc, will be downloaded to working directory
wget https://raw.githubusercontent.com/qdtang/ubuntu-setup/master/.bash_aliases
wget https://raw.githubusercontent.com/qdtang/ubuntu-setup/master/.vimrc

# make tab auto-completion case-insensitive
echo "set completion-ignore-case on" >> /etc/inputrc
# disable beep on terminal
echo "set bell-style none" >> /etc/inputrc
