# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/nb/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
		zsh-autosuggestions
		zsh-syntax-highlighting
		history-substring-search
		zsh-completions
		z
	)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=250'
### cd by just typing the directory's name
setopt autocd

### Auto run `workon` when there's .workon file at `pwd`
[[ ! -f .workon ]] || workon $(cat .workon)


### Emacs mode
## zdharma/history-search-multi-word broke emacs mode, so removed that plugin.
bindkey -e


#### Control + [PN] finds any command beginning with the exact typed command.
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search


#### UP or DOWN searches typed command in any part of history commands.
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

alias vi='nvim'
alias pbcopy="xclip -sel clip"
alias g='git'

alias rg.='rg --hidden'
alias fd.='fd --hidden --exclude .git'

alias pv='echo -n "which python      : " && which python
	  echo -n "python --version  : " && python --version
	  echo -n "which pip         : " && which pip
	  echo -n "pip --version     : " && pip --version
	  echo -n "which ipython     : " && which ipython
	  echo -n "ipython --version : " && ipython --version'

alias vim=nvim
alias vi=nvim

alias god="cd /media/nb/MyFiles/Projects"

export EDITOR=vi

# pyenv setups
export PATH="$HOME/.local/bin:$PATH"
export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3.9"
source "$HOME/.local/bin/virtualenvwrapper.sh"

#PUT THIS IN .zprofile file
export PYTHON_CONFIGURE_OPTS="--enable-shared"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
pyenv virtualenvwrapper_lazy

# flutter sdk path
#export PATH="$PATH:$HOME/flutter/bin"

# cmdline tools path
export PATH="$PATH:$HOME/Android/Sdk/cmdline-tools/tools"
export PATH="$PATH:$HOME/Android/Sdk/cmdline-tools/tools/bin/"

# android configurations
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

### FZF and Z
#like normal z when used with arguments but displays an fzf prompt when used without.
# unalias z 2> /dev/null
zf() {
    [ $# -gt 0 ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

export FZF_DEFAULT_OPTS="
			--layout=reverse
			--info=inline
			--height=100%
			--multi
			--preview '([[ -f {} ]] && (bat -n --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
			--bind '?:toggle-preview'
			--bind 'ctrl-a:select-all'
			--bind 'ctrl-y:execute-silent(echo {+} | xclip -sel clip)'
			--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
			--bind 'ctrl-v:execute(code {+})'"
                        #
# Git diff with fzf
fd() {
    preview="git diff $@ --color=always -- {-1}"
    git diff $@ --name-only | fzf -m --ansi --preview $preview
}
