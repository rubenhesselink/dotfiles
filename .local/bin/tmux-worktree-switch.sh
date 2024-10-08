#! /usr/bin/env bash

session_name=$(tmux display-message -p "#S" | tr _ .)

if [[ -d ~/projects/"$session_name" ]]; then
    session_folder=~/projects/"$session_name"
else
    echo "No folder matching session name found in ~/projects"
fi

echo "$session_folder"

worktree=$(find "$session_folder" -maxdepth 2 -type f -name ".git" -exec dirname {} \; | fzf)

if [ -z "$worktree" ]; then
    echo "No worktree selected."
    exit 1
fi

window_count=$(tmux list-windows -t "$session_name" | wc -l)
for ((i=1; i<=window_count; i++)); do
    tmux send-keys -t "$session_name:$i" C-c

    if tmux display-message -p -t "$session_name:$i" "#{pane_current_command}" | grep -q 'nvim'; then
	tmux send-keys -t "$session_name:$i" ":q!" Enter
	sleep 0.5
    fi
done

for ((i=1; i<=window_count; i++)); do
    tmux send-keys -t "$session_name:$i" "cd $worktree" Enter
done

tmux send-keys -t "$session_name:1" "nvim ." Enter
