TERM="xterm-256color"
# Path to your oh-my-zsh installation.
#export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export ZSH="/home/nb/.oh-my-zsh"


# Shell Theme
ZSH_THEME="spaceship" #"jovial" # typewritten

# Add wisely, as too many plugins slow down shell startup.dd wisely, as too many plugins slow down shell startup.

# SPACESHIP_DIR_COLOR="cyan"
# SPACESHIP_PROMPT_ADD_NEWLINE=true
# SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always
SPACESHIP_CHAR_SYMBOL="→ "
# SPACESHIP_CHAR_SUFFIX=" "
# SPACESHIP_HG_SHOW=false
# SPACESHIP_PACKAGE_SHOW=false
# SPACESHIP_NODE_SHOW=false
# SPACESHIP_RUBY_SHOW=false
# SPACESHIP_ELM_SHOW=false
# SPACESHIP_ELIXIR_SHOW=false
# SPACESHIP_XCODE_SHOW_LOCAL=false
# SPACESHIP_SWIFT_SHOW_LOCAL=false
# SPACESHIP_GOLANG_SHOW=false
# SPACESHIP_PHP_SHOW=false
# SPACESHIP_RUST_SHOW=false
# SPACESHIP_JULIA_SHOW=false
# SPACESHIP_DOCKER_SHOW=false
# SPACESHIP_DOCKER_CONTEXT_SHOW=false
# SPACESHIP_AWS_SHOW=false
# SPACESHIP_CONDA_SHOW=false
# SPACESHIP_VENV_SHOW=true
# SPACESHIP_PYENV_SHOW=false
# SPACESHIP_DOTNET_SHOW=false
# SPACESHIP_EMBER_SHOW=false
# SPACESHIP_KUBECONTEXT_SHOW=false
# SPACESHIP_TERRAFORM_SHOW=false
# SPACESHIP_TERRAFORM_SHOW=false
# SPACESHIP_VI_MODE_SHOW=false
# SPACESHIP_JOBS_SHOW=false


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
alias vconfig="vim ~/.config/nvim/init.vim"
alias zconfig="vim ~/.zshrc"
alias tconfig="vim ~/.tmux.conf"

alias ll='colorls -lA --sd --group-directories-first'
alias ls='colorls --group-directories-first'
alias corep='colorls --report'
alias cogs='colorls --gs'

LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=36:*.rpm=90:*.py=33'
export LS_COLORS
