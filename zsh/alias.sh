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
alias g="git"

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
	if [[ "$module" ]]; then
		module_path=$(python -c"import $module; print($module.__file__)" 2>/dev/null)
		if [[ -f "$module_path" ]]; then
			echo vi $module_path
			vi "$module_path"
		else
			VENV=$(basename "$VIRTUAL_ENV")
			if [[ "$VENV" ]]; then
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

# FZF [ https://github.com/catppuccin/fzf ]
# Latte
# --color="preview-bg:#223344,border:#778899"
# --color="preview-bg:#223344,border:#778899"
# --color="bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39"
# --color="fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78"
# --color="marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"
# Macchiato
# --color="bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796"
# --color="fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6"
# --color="marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

# exports
export EDITOR=nvim

# Emacs mode
bindkey -e

# Control + [PN] finds any command beginning with the exact typed command.
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# UP or DOWN searches typed command in any part of history commands.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export PATH="$PATH:~/.local/bin/"
