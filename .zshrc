export ZSH="/home/nb/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="mm/dd/yyyy"


plugins=(   
            git
            python
            tmux
            vi-mode
            zsh-autosuggestions
            zsh-syntax-highlighting
            z
        )
source $ZSH/oh-my-zsh.sh

# accept and execute current suggestion
bindkey '^ ' autosuggest-execute

export STARSHIP_CONFIG=~/.starship.toml
eval "$(starship init bash)"
source ~/.shell.conf
