# exa alias
alias ls='exa --icons'
alias ll='exa -alF --icons'
alias la='exa -a --icons'
alias l='exa -F --icons'
alias tree='exa -T --icons'

# nvim alias
alias vi=nvim
alias vim=nvim

# fdfind 
alias fd=fdfind

# git
g="git"

# details about current python env
alias pv='echo -n "which python      : " && which python
          echo -n "python --version  : " && python --version
          echo -n "which pip         : " && which pip
          echo -n "pip --version     : " && pip --version
          echo -n "which ipython     : " && which ipython
          echo -n "ipython --version : " && ipython --version'

# `vip os` will open python os module with vi
function vip() {
	module="$1"
	if [[ "$module" ]] ; then
		module_path=$(python -c"import $module; print($module.__file__)" 2>/dev/null)
		if [[ -f "$module_path" ]] ; then
			echo vi $module_path
			vi "$module_path"
		else
                        VENV=$(basename "$VIRTUAL_ENV")
			if [[ "$VENV" ]] ; then
			else
				VENV=$(pyenv version)
			fi
			echo \"$module\" not found in \"$VENV\"
		fi
	fi
}

# fzf settings
export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'
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

# exports
export EDITOR=nvim
