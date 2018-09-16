# my aliases

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ls
alias la='ls -a'
alias ll='ls -l'

# apt commands
alias aptsearch='apt search'
alias aptshow='apt show'
alias aptinstall='sudo apt install'
alias aptreinstall='sudo apt install --reinstall'
alias aptlist='apt list --installed'
alias aptremove='sudo apt remove'
alias aptautoremove='sudo apt autoremove'
alias aptpurge='sudo apt-get remove --purge'
alias aptupdate='sudo apt update'
alias aptupgrade='sudo apt upgrade'
alias aptdistupgrade='sudo apt-get dist-upgrade'
alias aptdepends='apt-cache depends'
alias aptrdepends='apt-cache rdepends'
alias aptbuilddep='sudo apt-get build-dep'
alias aptsource='sudo apt-get source'
alias aptclean='sudo apt-get clean && sudo apt-get autoclean'

# man
alias man='man -a'
