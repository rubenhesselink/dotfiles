#! /usr/bin/env bash

session=$(find ~/.dotfiles/.config ~/projects ~/Documents/Obsidian -mindepth 1 -maxdepth 1 -type d | fzf)

# Exit the script if no session is selected (fzf canceled)
if [[ -z "$session" ]]; then
	echo "No session selected. Exiting."
	exit 1
fi

session_name=$(basename "$session" | tr . _)

if ! tmux has-session -t "=$session_name" 2>/dev/null; then
	tmux new-session -s "$session_name" -c "$session" -n "code" -d
	tmux send-keys -t "$session_name:1" "nvim" Enter
	tmux new-window -n "scratch" -c "$session" -t "$session_name"

	tmux select-window -t "$session_name:1"
fi

tmux switch-client -t "$session_name"
