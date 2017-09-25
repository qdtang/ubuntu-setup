# my aliases

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# apt commands
alias aptsearch='apt-cache search'
alias aptshow='apt-cache show'
alias aptinstall='sudo apt-get install'
alias aptreinstall='sudo apt-get install --reinstall'
alias aptremove='sudo apt-get remove'
alias aptautoremove='sudo apt-get autoremove'
alias aptpurge='sudo apt-get remove --purge'
alias aptupdate='sudo apt-get update'
alias aptupgrade='sudo apt-get upgrade'
alias aptdistupgrade='sudo apt-get dist-upgrade'
alias aptdepends='apt-cache depends'
alias aptrdepends='apt-cache rdepends'
alias aptbuilddep='sudo apt-get build-dep'
alias aptsource='sudo apt-get source'
alias aptclean='sudo apt-get clean && sudo apt-get autoclean'
