TERM="xterm-256color"
# Path to your oh-my-zsh installation.
#export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export ZSH="/home/nb/.oh-my-zsh"

# Shell Theme
ZSH_THEME="" #	"spaceship" "jovial" "typewritten"

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
	    python              		# pyclean, pyfind pygrep
        node
        npm
        systemd
        debian
	    urltools
	)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan" # bg=cyan,bold,underline
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions

 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# alias to other drives
alias backupfiles="cd /media/nb/BackupFiles"

# xclip pbcopy
alias pbcopy="xclip -sel clip"

# emulator and adbmanager
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


# workon and virtualenv wrapper nb@viper
export PATH=/home/nb/.local/bin/:$PATH
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=/media/nb/BackupFiles/Projects
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /home/nb/.local/bin/virtualenvwrapper.sh

# change power settings
alias use_nvidia="sudo system76-power graphics nvidia"
alias use_intel="sudo system76-power graphics intel"
alias use_hybrid="sudo system76-power graphics hybrid"

# change alias for nautilus
alias open="nautilus"

# reload zshrc
alias reload="source ~/.zshrc"
# alias to edit config file
alias vconfig="sudo vim ~/dotfiles/init.vim"
alias zconfig="sudo vim ~/dotfiles/.zshrc"
alias tconfig="sudo vim ~/dotfiles/.tmux.conf"

alias sudo="sudo "
alias syu="sudo apt-get update -y"
alias syi="sudo apt-get install '$*' -y"
alias syyu="sudo apt-get upgrade -y"
alias syau="sudo apt-get autoremove '$*' -y"
alias sypau="sudo apt-get --purge autoremove'$*' -y" 

alias ll='colorls -lA --sd --group-directories-first'
alias ls='colorls --group-directories-first'
alias corep='colorls --report'
alias cogs='colorls --gs'

LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=36:*.rpm=90:*.py=33'
export LS_COLORS

# use starship shell prompt
export STARSHIP_CONFIG=~/.starship.toml
eval "$(starship init zsh)"
