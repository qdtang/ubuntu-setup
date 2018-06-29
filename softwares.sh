#!/bin/sh

apt-get update
apt-get upgrade 

apt-get install build-essential
apt-get install vim
apt-get install vim-gtk3
apt-get install g++
apt-get install libboost-all-dev
apt-get install git
apt-get install terminator
apt-get install ddd
apt-get install flex
apt-get install bison
apt-get install cmake

# install from official websites
#vs code
#SmartGit
#anaconda3

##################################################################
#OPTIONAL
##################################################################
# install vm tools if automatic fullscreen does not work well
#apt-get install open-vm-tools-desktop


#apt-get install zeal
#apt-get install valgrind

# qt5 and qtcreator
#apt-get install qt5-default qttools5-dev-tools
#apt-get install qtcreator
#download linux manual for QtCreator Help from http://trunk.shinnok.com/qt/manpages.qch.gz

# install pip
#apt-get install python-pip python-dev
#pip install --upgrade pip
#pip install --upgrade virtualenv

#apt-get install octave
