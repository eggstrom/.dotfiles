#!/usr/bin/env bash

# Create a bind for both key and Ctrl + key
bind_() {
    local key="$1"
    shift
    tmux bind "$key" "$@"
    tmux bind "C-$key" "$@"
}

# Create a repeating bind
bind_r() {
    local key="$1"
    shift
    tmux bind -r "$key" "$@"
}

tmux unbind -a

# Pane navigation
bind_ Left  selectp -L
bind_ Down  selectp -D
bind_ Up    selectp -U
bind_ Right selectp -R
bind_ h     selectp -L
bind_ j     selectp -D
bind_ k     selectp -U
bind_ l     selectp -R
bind_ Space run-shell 'tmux last || true'

# Pane moving, creation and deletion
bind_ m selectp -m
bind_ s run-shell 'tmux joinp || tmux splitw -c "#{pane_current_path}"'
bind_ v run-shell 'tmux joinp -h || tmux splitw -hc "#{pane_current_path}"'
bind_ b breakp -d
bind_ q killp

# Pane resizing
bind_r S-Left  resizep -L
bind_r S-Down  resizep -D
bind_r S-Up    resizep -U
bind_r S-Right resizep -R
bind_r H       resizep -L
bind_r J       resizep -D
bind_r K       resizep -U
bind_r L       resizep -R
bind_  f       resizep -Z

# Windows
bind_ w neww -c "#{pane_current_path}"
bind_ n next
bind_ p prev
bind_ 1 selectw -t :1
bind_ 2 selectw -t :2
bind_ 3 selectw -t :3
bind_ 4 selectw -t :4
bind_ 5 selectw -t :5
bind_ 6 selectw -t :6
bind_ 7 selectw -t :7
bind_ 8 selectw -t :8
bind_ 9 selectw -t :9
bind_ 0 selectw -t :10

# Sessions
bind_ d detach
bind_ a choose-session

# Miscellaneous
bind_ c clearhist
bind_ r source ~/.config/tmux/tmux.conf
bind_ : command-prompt
