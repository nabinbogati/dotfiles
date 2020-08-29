export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(
            git
            zsh-autosuggestions
            z
        )
source $ZSH/oh-my-zsh.sh

# accept and execute current suggestion
bindkey '^ ' autosuggest-execute

source ~/.shell.conf
