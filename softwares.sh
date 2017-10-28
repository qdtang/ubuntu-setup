#!/bin/sh

##################################################################
# put "sudo" ahead of this script when you run it.
##################################################################

apt-get update
apt-get upgrade 

apt-get install build-essentail
apt-get install terminator
apt-get install vim
apt-get install g++
apt-get install libboost-all-dev
apt-get install git
apt-get install zeal
apt-get install code
apt-get install valgrind
apt-get install qtcreator

# install pip
apt-get install python-pip python-dev
pip install --upgrade pip
pip install --upgrade virtualenv

apt-get install spyder
#apt-get install spyder3
#apt-get install octave
