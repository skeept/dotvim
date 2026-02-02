#!/usr/bin/env bash

# Create a secure temp file
dest=$(mktemp /tmp/tmux_scrollback.XXXXXX)

# Capture the entire scrollback (-S for start of history to the end)
tmux capture-pane -pS - >"$dest"

# Open nvim in a NEW tmux window, then delete the file after nvim closes
tmux new-window -n "scrollback" "nvim +$ '$dest' && rm '$dest'"
