eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by OrbStack: command-line tools and integration
# Comment this line if you don't want it to be added again.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

bindkey -s ^f "tmux-sessionizer.sh\n"
bindkey -s ^w "tmux-worktree-switch.sh\n"
