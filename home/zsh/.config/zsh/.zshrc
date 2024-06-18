# Source .zshenv
[[ -f ~/.zshenv ]] && . ~/.zshenv

# Aliases
alias aria2c="aria2c -d $HOME/Downloads"
alias fcd='cd "$(fd -Ht d | fzf)"'
alias d='eval cd "$(dirs -p | fzf)"'
alias diff='diff --color=auto'
alias e='$EDITOR'
alias f='lf'
alias grep='grep --color=auto'
alias l='eza -al --icons --git'
alias lf='cd "$(\lf -print-last-dir)"'
alias ls='ls --color=auto'
alias pacman='pacman --color=auto'
alias rm='rm -i'
alias sudo='sudo '
alias yay='yay --color=auto'

# Quickly evaluate a Python expression
py() {
    local result="$(python <<< "from math import *; from random import *; print($*)")"
    [[ -n "$result" ]] &&
        echo "$result"
}
alias py='noglob py'

# Fuzzy find man pages
fman() {
    local result="$(man -k . | cut -d ' ' -f '1-2' | fzf)"
    man \
        "${"$(echo "$result" | cut -d ' ' -f '2')":1:-1}" \
        "$(echo "$result" | cut -d ' ' -f '1')"
}

# Directory options
setopt auto_cd           # Change directory without cd
setopt auto_pushd        # Push directory onto stack when changing it
setopt pushd_ignore_dups # Don't put duplicates in directory stack

# History options
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt share_history

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
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select                      # Enable highlight on selected item
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Enable file colors

# Source plugins
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable Starship
eval "$(starship init zsh)"
