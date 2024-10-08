#! /usr/bin/env bash

session=$(find ~ ~/projects -mindepth 1 -maxdepth 1 -type d | fzf)
session_name=$(basename "$session" | tr . _)

if ! tmux has-session -t "$session_name" 2> /dev/null; then
	tmux new-session -s "$session_name" -c "$session" -n "neovim" -d
	tmux send-keys -t "$session_name:1" "nvim ." Enter
	tmux new-window -n "terminal" -c "$session" -t "$session_name"
	tmux new-window -n "4d" -c "$session" -t "$session_name"

	tmux select-window -t "$session_name:1"
fi

tmux switch-client -t "$session_name"
