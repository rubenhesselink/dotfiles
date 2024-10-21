eval "$(/opt/homebrew/bin/brew shellenv)"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# Define where zinit and it's plugins will live.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add snippets
zinit snippet OMZP::git
zinit snippet OMZP::command-not-found

autoload -U compinit && compinit

zinit cdreplay -q

# History
HISTSIZE=15000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUPE=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Aliasses
alias cfdn="sshuttle @/Users/rubenhesselink/.ssh/sshuttle.conf"

unalias g

# Zoxide
eval "$(zoxide init zsh)"

# Fourdigits CLI
 # eval "$(_4D_COMPLETE=zsh_source 4d)"
 # eval "$(_FOURDIGITS_COMPLETE=zsh_source fourdigits)"

# Fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# Fzf
eval "$(fzf --zsh)"
source <(fzf --zsh)

eval "$(starship init zsh)"

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi

[ -s "${HOME}/.g/env" ] && \. "${HOME}/.g/env"  # g shell setup

