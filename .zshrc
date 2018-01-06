source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# POWERLVEL9K config
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_PROMPT_ON_NEWLINE=false

POWERLEVEL9K_SHORTEN_DIR_LENGTH=9
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"

# Elementos de la barra
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(background_jobs context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
POWERLEVEL9K_STATUS_VERBOSE=true

POWERLEVEL9K_DIR_HOME_BACKGROUND='09'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='09'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='009'
POWERLEVEL9K_DIR_HOME_FOREGROUND='236'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='236'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='236'

# `git hub colors`
#POWERLEVEL9K_VCS_CLEAN_BACKGROUND='236'
#POWERLEVEL9K_VCS_CLEAN_BACKGROUND='214'
#POWERLEVEL9K_VCS_CLEAN_FOREGROUND='236'
#POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='214'
#POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='236'
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='196'
#POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='236'

DEFAULT_USER="$USER"

source ~/.zsh/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip

antigen bundle command-not-found
antigen bundle colored-man-pages
antigen bundle $HOME/.zsh/docker
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

#SYNTAX HIGHLIGHTING CONFIG
