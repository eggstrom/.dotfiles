# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Home decluttering
# .config/
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"        # .docker
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npmrc" # .npmrc
export XINITRC="$XDG_CONFIG_HOME/xinitrc"             # .xinitrc
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"                 # .zlogin, .zshrc, ...
# .local/share/
export CARGO_HOME="$XDG_DATA_HOME/cargo"        # .cargo/
export GOPATH="$XDG_DATA_HOME/go"               # go/
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle" # .gradle/
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"      # .rustup/
export WINEPREFIX="$XDG_DATA_HOME/wine"         # .wine/
# .local/state/
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history" # .node_repl_history
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"       # .python_history

# Bash and Zsh history
export HISTFILE="$XDG_STATE_HOME/histfile"
export HISTSIZE=1000
export SAVEHIST="$HISTSIZE"
export HISTCONTROL='ignoreboth:erasedups'

# Consistent colors between terminal and terminal programs
export BAT_THEME='base16-256'
export FZF_DEFAULT_OPTS='--color=16'
eval "$(dircolors)"

# Theming
export XCURSOR_THEME='catppuccin-mocha-dark-cursors'
export XCURSOR_SIZE=48
export GTK_THEME='catppuccin-mocha-red-standard+default'
export QT_QPA_PLATFORMTHEME='qt5ct'

# Default programs
export EDITOR='nvim'
export SUDO_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
export TERMINAL='wezterm'

# Add paths to $PATH if they're not already present
add_path() {
    [[ ":$PATH:" != *":$1:"* ]] && PATH="$PATH:$1"
}

add_path "$CARGO_HOME/bin"
add_path "$GOPATH/bin"

unset -f add_path