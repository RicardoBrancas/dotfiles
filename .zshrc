#using different caches for diferent $TERMs
ANTIGEN_CACHE=$HOME/.antigen/init-${TERM}.zsh

DEFAULT_USER="$USER"

# Start full autocomplete
autoload -Uz compinit
compinit

zstyle -e ':completion:*:(ssh|scp|sftp|rsh):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select

# Spaceship config


PATH=$PATH:~/bin/
export EDITOR=$(which vim)

#aliases

alias vim-nasm='vim -c "set filetype=nasm"'
alias gdb='gdb -q'

source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle colored-man-pages
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# must be loaded after zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

if [ "$TERM" = "xterm-256color" ]
then
	antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship
fi

antigen apply
export GPG_TTY=$(tty)
