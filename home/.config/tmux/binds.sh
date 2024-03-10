bind_() {
	tmux bind "$1" "$2"
	tmux bind "C-$1" "$2"
}

bind_r() {
	tmux bind -r "$1" "$2"
}

tmux set -g prefix C-Space
tmux unbind -a

# Panes
bind_ s 'split-window -c "#{pane_current_path}"'
bind_ v 'split-window -hc "#{pane_current_path}"'
bind_ Left 'select-pane -L'
bind_ Down 'select-pane -D'
bind_ Up 'select-pane -U'
bind_ Right 'select-pane -R'
bind_ h 'select-pane -L'
bind_ j 'select-pane -D'
bind_ k 'select-pane -U'
bind_ l 'select-pane -R'
bind_r S-Left 'resize-pane -L'
bind_r S-Down 'resize-pane -D'
bind_r S-Up 'resize-pane -U'
bind_r S-Right 'resize-pane -R'
bind_r H 'resize-pane -L'
bind_r J 'resize-pane -D'
bind_r K 'resize-pane -U'
bind_r L 'resize-pane -R'
bind_ f 'resize-pane -Z'

# Windows
bind_ w 'new-window -c "#{pane_current_path}"'
bind_ n 'next-window'
bind_ p 'previous-window'
bind_ Space 'last-window'
bind_ 1 'select-window -t :1'
bind_ 2 'select-window -t :2'
bind_ 3 'select-window -t :3'
bind_ 4 'select-window -t :4'
bind_ 5 'select-window -t :5'
bind_ 6 'select-window -t :6'
bind_ 7 'select-window -t :7'
bind_ 8 'select-window -t :8'
bind_ 9 'select-window -t :9'
bind_ 0 'select-window -t :10'

# Sessions
bind_ d 'detach-client'
bind_ t 'choose-tree'

# Miscellaneous
bind_ : 'command-prompt'
bind_ r "source-file $HOME/.config/tmux/tmux.conf"

# TODO: Consider adding all of these
#
# bind-key        C-b send-prefix
# bind-key          z suspend-client
# bind-key        C-o rotate-window
# bind-key      Space next-layout
# bind-key          ! break-pane
# bind-key          # list-buffers
# bind-key          $ command-prompt -I #S "rename-session '%%'"
# bind-key          & confirm-before -p "kill-window #W? (y/n)" kill-window
# bind-key          ' command-prompt -p index "select-window -t ':%%'"
# bind-key          ( switch-client -p
# bind-key          ) switch-client -n
# bind-key          , command-prompt -I #W "rename-window '%%'"
# bind-key          - delete-buffer
# bind-key          . command-prompt "move-window -t '%%'"
# bind-key          ; last-pane
# bind-key          = choose-buffer
# bind-key          ? list-keys
# bind-key          D choose-client
# bind-key          L switch-client -l
# bind-key          [ copy-mode
# bind-key          ] paste-buffer
# bind-key          f command-prompt "find-window '%%'"
# bind-key          i display-message
# bind-key          l last-window
# bind-key          o select-pane -t :.+
# bind-key          q display-panes
# bind-key          r refresh-client
# bind-key          w choose-window
# bind-key          x confirm-before -p "kill-pane #P? (y/n)" kill-pane
# bind-key          { swap-pane -U
# bind-key          } swap-pane -D
# bind-key          ~ show-messages
# bind-key      PPage copy-mode -u
# bind-key        M-1 select-layout even-horizontal
# bind-key        M-2 select-layout even-vertical
# bind-key        M-3 select-layout main-horizontal
# bind-key        M-4 select-layout main-vertical
# bind-key        M-5 select-layout tiled
# bind-key        M-n next-window -a
# bind-key        M-o rotate-window -D
# bind-key        M-p previous-window -a
