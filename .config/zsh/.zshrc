# Source .zshenv
[[ -f ~/.zshenv ]] && . ~/.zshenv

# Append paths to PATH variable
typeset -U path PATH
path+="$HOME/.cargo/bin"

# Aliases
alias aria2c="aria2c -d $HOME/Downloads"
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ll='ls -lh'
alias ls='ls -a --color=auto'
alias pacman='pacman --color=auto'
alias rm='rm -i'
alias sudo='sudo '
alias yay='yay --color=auto'

# Options
setopt autocd # CD by just typing directory

# Key binds
bindkey '^?'      backward-delete-char  # Backspace
bindkey '^[[3~'   delete-char           # Delete
bindkey '^[[H'    beginning-of-line     # Home
bindkey '^[[F'    end-of-line           # End
bindkey '^[[1;5C' forward-word          # Ctrl + Right
bindkey '^[[1;5D' backward-word         # Ctrl + Left
bindkey '^H'      backward-kill-word    # Ctrl + Backspace
bindkey '^[[3;5~' kill-word             # Ctrl + Delete
bindkey '^[[Z'    reverse-menu-complete # Shift + Tab

# Vi mode
bindkey -v   # Enable Vi mode
KEYTIMEOUT=1 # Disable mode switching delay

# Change default cursor
zle-line-init() {
    echo -ne '\e[6 q'
}
zle -N zle-line-init

# Change cursor in Vi mode
zle-keymap-select() {
    if [[ ${KEYMAP} == vicmd ]] ||
        [[ $1 = 'block' ]]; then
        echo -ne '\e[2 q'
    elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} = '' ]] ||
        [[ $1 = 'beam' ]]; then
        echo -ne '\e[6 q'
    fi
}
zle -N zle-keymap-select

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select # Enable highlight on selected item

# Source plugins
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Source Powerlevel10k config
[[ -f "$ZDOTDIR/.p10k.zsh" ]] && . "$ZDOTDIR/.p10k.zsh"
