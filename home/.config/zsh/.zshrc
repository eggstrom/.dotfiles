# Source .zshenv
[[ -f ~/.zshenv ]] && . ~/.zshenv

# Aliases
alias aria2c="aria2c -d $HOME/Downloads"
alias cat='bat'
alias fcd='cd "$(fd -Ht d | fzf)"'
alias d='eval cd "$(dirs -p | fzf)"'
alias diff='diff --color=auto'
alias e='$EDITOR'
alias f='lf'
alias grep='grep --color=auto'
alias l='eza -al'
alias lf='cd "$(\lf -print-last-dir)"'
alias ls='ls --color=auto'
alias pacman='pacman --color=auto'
alias rm='rm -i'
alias sudo='sudo '
alias yay='yay --color=auto'

# Pass expression to Python
c() {
    local result="$(python <<< "from math import *; print($*)")" 2> /dev/null
    [[ -n "$result" ]] &&
        echo "$result" ||
        echo '¯\_(ツ)_/¯'
}
alias c='noglob c'

# Fuzzy find man pages
fman() {
    local result="$(man -k . | cut -d ' ' -f '1-2' | fzf)"
    man \
        "${"$(echo "$result" | cut -d ' ' -f '2')":1:-1}" \
        "$(echo "$result" | cut -d ' ' -f '1')"
}

# Directory options
setopt AUTO_CD           # Change directory without cd
setopt AUTO_PUSHD        # Push directory onto stack when changing it
setopt PUSHD_IGNORE_DUPS # Don't put duplicates in directory stack

# History options
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

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

# Enable Starship
eval "$(starship init zsh)"
