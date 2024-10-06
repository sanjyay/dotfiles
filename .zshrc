# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# List of plugins used
plugins=( sudo zsh-autosuggestions zsh-syntax-highlighting zsh-256color )
source $ZSH/oh-my-zsh.sh
# Helpful aliases
alias  c='clear' # clear terminal
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias e=evince
#alias vc='code' # gui code editor

# Custom alias
alias pf="fzf ${FZF_CTRL_T_OPTS}"
alias rm='trash -v'
alias e=evince
 
# Handy change dir shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'


# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# Fixes "Error opening terminal: xterm-kitty" when using the default kitty term to open some programs through ssh
alias ssh='kitten ssh'
#tldr
alias tl="tldr --list | fzf --preview 'tldr {} --color always' | xargs tldr"

# ohmyposh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

#zoxide
eval "$(zoxide init zsh)"

# Configure FZF
export FZF_CTRL_T_OPTS="--preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

if [ -x "$(command -v fzf)"  ]
then
    source /usr/share/fzf/key-bindings.zsh
fi


# Load aliases if they exist.
[ -f "${XDG_CONFIG_HOME}/zsh/.aliases" ] && . "${XDG_CONFIG_HOME}/zsh/.aliases"
[ -f "${XDG_CONFIG_HOME}/zsh/.aliases.local" ] && . "${XDG_CONFIG_HOME}/zsh/.aliases.local"

export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

alias vim=nvim
alias q=exit
