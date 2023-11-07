# Aliases
alias aria2c='aria2c -d Downloads'
alias grep='grep --color=auto'
alias ll='ls -lh'
alias ls='ls -a --color=auto'
alias pacman='pacman --color=auto'
alias rm='rm -i'
alias sudo='sudo '
alias yay='yay --color=auto'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/eggstrom/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
   echo -ne '\e[5 q'
}

# Plugins
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Source theme if it exists
[[ -f ~/.config/zsh/.p10k.zsh ]] && . ~/.config/zsh/.p10k.zsh
