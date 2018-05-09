DEFAULT_USER="$USER"

# Start full autocomplete
autoload -Uz compinit
compinit

zstyle -e ':completion:*:(ssh|scp|sftp|rsh):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select

# Powerlevel9k config

POWERLEVEL9K_MODE='awesome-fontconfig'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

# dir config
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

# status config
POWERLEVEL9K_STATUS_OK=false

#aliases

alias vim-nasm='vim -c "set filetype=nasm"'


# Source antigen module
source ~/.zsh/antigen/antigen.zsh

export EDITOR=$(which vim)

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

antigen bundle command-not-found
antigen bundle colored-man-pages
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# must be loaded after zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply
export GPG_TTY=$(tty)
