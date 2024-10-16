#! /usr/bin/env bash

notes="~/notes/vault/"
session=$(find ~ ~/projects -mindepth 1 -maxdepth 1 -type d | fzf)

# Exit the script if no session is selected (fzf canceled)
if [[ -z "$session" ]]; then
    echo "No session selected. Exiting."
    exit 1
fi

session_name=$(basename "$session" | tr . _)

if ! tmux has-session -t "=$session_name" 2> /dev/null; then
	tmux new-session -s "$session_name" -c "$session" -n "neovim" -d
	tmux send-keys -t "$session_name:1" "nvim ." Enter
	tmux new-window -n "terminal" -c "$session" -t "$session_name"
	tmux new-window -n "4d" -c "$session" -t "$session_name"
	tmux new-window -n "notes" -c "$notes" -t "$session_name"

	tmux select-window -t "$session_name:1"
fi

tmux switch-client -t "$session_name"
