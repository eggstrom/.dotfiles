#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export BROWSER='firefox'
export EDITOR='nvim'
export GTK_THEME='Catppuccin-Mocha-Standard-Red-Dark'
export QT_QPA_PLATFORMTHEME='qt5ct'
export VISUAL='nvim'
export XCURSOR_THEME='Catppuccin-Mocha-Dark-Cursors'
export XCURSOR_SIZE=48
export XINITRC="$HOME/.config/xinitrc"

alias aria2c='aria2c -d Downloads'
alias grep='grep --color=auto'
alias ll='ls -lh'
alias ls='ls -a --color=auto'
alias pacman='pacman --color=auto'
alias rm='rm -i'
alias sudo='sudo '
alias yay='yay --color=auto'

PS1='[\u@\h \W]\$ '
