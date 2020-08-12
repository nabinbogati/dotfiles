export ZSH="/home/nb/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="mm/dd/yyyy"


plugins=(   
            colorize
            git
            tig
            python
            tmux
            virtualenv
            virtualenvwrapper
            vi-mode
            zsh-autosuggestions
            zsh-syntax-highlighting
            z
        )
source $ZSH/oh-my-zsh.sh

ZSH_COLORIZE_TOOL=pygmentize
ZSH_COLORIZE_STYLE="colorful"
# accept current suggestion
bindkey '^ ' autosuggest-accept

export STARSHIP_CONFIG=~/.starship.toml
eval "$(starship init bash)"
source ~/.shell.conf
