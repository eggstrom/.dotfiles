#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

udiskie &
exec startx; exit
