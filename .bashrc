#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.cargo/env ]] && . ~/.cargo/env

export BROWSER=firefox
export EDITOR=nvim

alias aria2c='aria2c -d Downloads'
alias grep='grep --color=auto'
alias ll='ls -lh'
alias ls='ls -a --color=auto'
alias pacman='pacman --color=auto'
alias rm='rm -i'

PS1='[\u@\h \W]\$ '
