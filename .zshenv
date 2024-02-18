# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Home decluttering
# .config/
export XINITRC="$XDG_CONFIG_HOME/xinitrc" # .xinitrc
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"     # .zlogin, .zshrc, ...
# .cache/
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node_repl_history" # .node_repl_history
export PYTHON_HISTORY="$XDG_CACHE_HOME/python_history"       # .python_history
# .local/share/
export CARGO_HOME="$XDG_DATA_HOME/cargo"        # .cargo/
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle" # .gradle/
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"      # .rustup/
export WINEPREFIX="$XDG_DATA_HOME/wine"         # .wine/

# Zsh history
export HISTFILE="$HOME/.cache/zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000

# Default programs
export EDITOR='nvim'
export SUDO_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
export TERM='wezterm'
export BROWSER='firefox'

# Theming
export XCURSOR_THEME='Catppuccin-Mocha-Dark-Cursors'
export XCURSOR_SIZE=48
export GTK_THEME='Catppuccin-Mocha-Standard-Red-Dark'
export QT_QPA_PLATFORMTHEME='qt5ct'
