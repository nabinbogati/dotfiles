export TERM="xterm-256color"
export ZSH="/home/nb/.oh-my-zsh"

# Shell Theme
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Add wisely, as too many plugins slow down shell startup.dd wisely, as too many plugins slow down shell startup.

plugins=(
	sudo
        git                 		# git wrapper for zsh
        zsh-syntax-highlighting 	# terminal syntax highlighting
        zsh-autosuggestions 		# terminal auto suggestions
        zsh-completions
        z                   		# easier navigation to directories
        tig                 		# tig alias tis, til, tib
        tmux                		# tmux manager ts, ta etc
        history             		# history alternative his h
        copyfile           		    # copy contents of file copyfile <filename>
        copydir             		# copydir location
        colorize           	     	# colorize textfiles and languages
        colored-man-pages   		# colored man pages
        virtualenvwrapper   		# activate virtualenvs 
     	virtualenv
	    python             		# pyclean, pyfind pygrep
        node
        npm
        systemd
        debian
	   urltools
	)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan" # bg=cyan,bold,underline
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

zle -N autosuggest-fetch _zsh_autosuggest_widget_fetch
zle -N autosuggest-suggest _zsh_autosuggest_widget_suggest
zle -N autosuggest-accept _zsh_autosuggest_widget_accept
zle -N autosuggest-clear _zsh_autosuggest_widget_clear
zle -N autosuggest-execute _zsh_autosuggest_widget_execute
zle -N autosuggest-enable _zsh_autosuggest_widget_enable
zle -N autosuggest-disable _zsh_autosuggest_widget_disable
zle -N autosuggest-toggle _zsh_autosuggest_widget_toggle

ZSH_AUTOSUGGEST_USE_ASYNC=''
bindkey '^ ' autosuggest-execute

#bindkey '' autosuggest-accept:  # Accepts the current suggestion.
#bindkey '' autosuggest-execute: # Accepts and executes the current suggestion.
#bindkey '' autosuggest-clear:   # Clears the current suggestion.
#bindkey '' autosuggest-fetch:   # Fetches a suggestion (works even when suggestions are disabled).
#bindkey '' autosuggest-disable: # Disables suggestions.
#bindkey '' autosuggest-enable:  # Re-enables suggestions.
#bindkey '' autosuggest-toggle:  # Toggles between enabled/disabled suggestions.


# alias to other drives
alias gbackup="cd /media/nb/BackupFiles"

# xclip pbcopy
alias pbcopy="xclip -sel clip"

# emulator and adbmanager
export REPO_OS_OVERRIDE="linux"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


# workon and virtualenv wrapper nb@viper
export PATH=/home/nb/.local/bin:$PATH
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=/media/nb/BackupFiles/Projects
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /home/nb/.local/bin/virtualenvwrapper_lazy.sh

# change power settings
alias use_nvidia="sudo system76-power graphics nvidia"
alias use_intel="sudo system76-power graphics intel"
alias use_hybrid="sudo system76-power graphics hybrid"

# change alias for nautilus
alias open="nautilus . & disown"

# reload zshrc
alias reload="source ~/.zshrc"
# alias to edit config file
alias vconfig="vim ~/dotfiles/init.vim"
alias zconfig="vim ~/dotfiles/.zshrc"
alias tconfig="vim ~/dotfiles/.tmux.conf"
alias bconfig="vim ~/dotfiles/.bashrc"

alias sudo="sudo "
alias sup="sudo apt-get update -y"
alias sin="sudo apt-get install '$*' -y"
alias sug="sudo apt-get upgrade -y"
alias sap="sudo apt-get autoremove --purge '$*' -y"

alias ll='colorls -lA --sd --group-directories-first'
alias ls='colorls --group-directories-first'
alias corep='colorls --report'
alias cogs='colorls --gs'

LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=36:*.rpm=90:*.py=33'
export LS_COLORS

# history timeformat
HISTTIMEFORMAT="%F %T "

# use starship shell prompt
export STARSHIP_CONFIG=~/.starship.toml
eval "$(starship init /usr/bin/zsh)"


# go programming
export PATH=$PATH:/usr/local/go/bin

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi

# virtualenv fix inside tmux
if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate;
fi

# mount onedrives
alias onedrivep="rclone --vfs-cache-mode writes mount onedrive: your_onedrive_setup_here & disown"
alias onedriveb="rclone --vfs-cache-mode writes mount onedrive_organization: your_onedrive_setup_here & disown"
