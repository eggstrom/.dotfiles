# Source .zshenv if it exists
[[ -f ~/.zshenv ]] && . ~/.zshenv

# Append paths to PATH variable
typeset -U path PATH
path+="$HOME/.cargo/bin"

# Aliases
alias aria2c='aria2c -d Downloads'
alias grep='grep --color=auto'
alias ll='ls -lh'
alias ls='ls -a --color=auto'
alias pacman='pacman --color=auto'
alias rm='rm -i'
alias sudo='sudo '
alias yay='yay --color=auto'

# The following lines were added by compinstall
zstyle :compinstall filename '/home/eggstrom/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Plugins
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
. /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

[[ -f ~/.config/zsh/.p10k.zsh ]] && . ~/.config/zsh/.p10k.zsh
