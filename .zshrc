# Start tmux only if not already inide a tmux session
#if [[ $- == *i* ]] && command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ]; then
  # Attach to existing session or create a new one
#  if tmux has-session -t auto 2>/dev/null; then
#    exec tmux attach-session -t auto
#  else
#    exec tmux new-session -s auto
#  fi
#fi
# Set the directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if it doesn't exists
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Source Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Initializing oh-my-posh
eval "$(~/.local/bin/oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -U compinit && compinit

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q


# History 
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
# history gets appended instead of overwriting 
setopt appendhistory 
# share history across sessions 
setopt sharehistory
# doesn't add to history if started with space
setopt hist_ignore_space
# Ignores duplicates in history
setopt hist_ignore_all_dups 
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# Aliases
alias ls='ls --color'
alias ll='ls -a'
alias rm='trash -v'
alias jup='sudo docker run -it --rm -p 8889:8888 \
  -v "$PWD":/home/jovyan/work \
  jupyter-latex'
#alias vim='bash ~/.config/kitty/kitty.sh' # or your custom path
alias vim='nvim'
alias conda-init='eval "$(/home/goblin/build/miniconda3/bin/conda shell.zsh hook)"'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

#unalias yayf 2>/dev/null

yayf() {
  yay -Slq | fzf --multi \
    --preview 'script -q -c "yay -Sii {1}" /dev/null' \
    --preview-window=down:75% | xargs -ro yay -S
}
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
