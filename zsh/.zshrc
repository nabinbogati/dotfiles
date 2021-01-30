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
		z
	)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


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

alias gote="cd /media/nb/Projects"

export EDITOR=vi

# pyenv setups
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
source "$HOME/.local/bin/virtualenvwrapper.sh"

eval "$(pyenv init -)"
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
pyenv virtualenvwrapper_lazy


### FZF and Z
#like normal z when used with arguments but displays an fzf prompt when used without.
# unalias z 2> /dev/null
zf() {
    [ $# -gt 0 ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

export FZF_DEFAULT_COMMAND="fd
			    --type file             \
			    --follow                \
			    --hidden                \
			    --exclude .git"


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

# Git diff with fzf
fd() {
 preview="git diff $@ --color=always -- {-1}"
 git diff $@ --name-only | fzf -m --ansi --preview $preview
}

### Auto run `workon` when there's a .workon file in current or any parent dirs
#   And deactivates when there's no .workon file in current or all parent dirs
function cd() {
	builtin cd "$@" || return

	# save pwd because we need it later below
	pwd="$(pwd)"
	workon_file_check_at="$pwd"

	# echo $workon_file_check_at

	check_upto="/"
	current_virtualenv=$(basename "$VIRTUAL_ENV")

	while [[ $workon_file_check_at != $check_upto ]] ; do

		# echo "checking at $workon_file_check_at"

		workon_file=$workon_file_check_at/.workon

		if [[ -f $workon_file ]] ; then
			workon_project=$(cat $workon_file)

			if [[ $workon_project == $current_virtualenv ]] ; then
				# echo "already working on $workon_project"
				return
			fi

			echo "workon $workon_project (set by $workon_file)"
			workon $workon_project

			# workon changes the dir to one set by setvirtualenvproject
			# so go again to the previously saved pwd
			builtin cd $pwd
			return
		fi

		workon_file_check_at=$(dirname $workon_file_check_at)
	done

	# No .workon file found at any of the ancestors, deactivates if working on
	if [[ "$VIRTUAL_ENV" ]] ; then
		echo "deactivating $current_virtualenv"
		deactivate
	fi
}
cd . >/dev/null
