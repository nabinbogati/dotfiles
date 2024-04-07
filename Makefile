target:
	make basic-setup

basic-setup:
	# setup dev env to compile pyenv
	sudo apt-get install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev -y	
	
	# install pip for python3
	sudo apt-get install python3-pip -y
	sudo apt install zoxide exa -y # for jump around and colordirs
	sudo apt install fd-find -y
	sudo apt install fzf -y
	sudo apt install ripgrep -y
	sudo apt install unzip -y

zsh-setup: zsh-shell zsh-plugin-manager

zsh-shell:
	sudo apt install zsh  # install zsh shell
	ln -sf $(PWD)/zsh/zshrc ~/.zshrc # copy config file to home directory
	chsh -s '/usr/bin/zsh' # change default shell to zsh

zsh-plugin-manager:
	git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote # install antidote plugin manager
	ln -sf $(PWD)/zsh/zsh_plugins.txt ~/.zsh_plugins.txt

tmux-setup: tmux-plugin-manager
	ln -sf $(PWD)/tmux/tmux.conf ~/.tmux.conf

tmux-plugin-manager:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # install tpm

neovim-setup: install-neovim install-lazynvim

install-neovim:
	wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz -O /tmp/nvim.tar.gz
	tar xzvf /tmp/nvim.tar.gz --directory /tmp/
	mv /tmp/nvim-linux64 ~/.nvim
	ln -sf ~/.nvim/bin/nvim ~/.local/bin/nvim

install-nvchad:
	git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

install-lazynvim:
	git clone https://github.com/LazyVim/starter ~/.config/nvim

setup-pyenv:
	bash zsh/pyenv.sh

setup-git:
	sudo apt install git -y
	sudo apt install tig -y

	### Link configuration files from dotfiles to system location
	ln -sf `pwd`/git/.gitignore_global ~/

	### configure git
	make gitconfig

gitconfig:
	### git aliases
	git config --global alias.s status
	git config --global alias.st status
	git config --global alias.co checkout
	git config --global alias.ap 'add -p'
	git config --global alias.f fetch
	git config --global alias.fe fetch
	git config --global alias.b branch
	git config --global alias.br 'branch -r'
	git config --global alias.cm 'commit -m'
	git config --global alias.d diff
	git config --global alias.di diff
	git config --global alias.dc 'diff --cached'
	git config --global alias.cop 'checkout -p'
	git config --global alias.pl pull
	git config --global alias.ps push
	git config --global alias.reba rebase
	git config --global alias.rese reset
	git config --global alias.rest restore
	git config --global alias.m merge
	git config --global alias.a add
	git config --global alias.ls ls-files
	git config --global core.excludesfile '~/.gitignore_global'
	git config --global pull.ff only


clean-zsh:
	rm -rf ${ZDOTDIR:-~}/.antidote
	rm ~/.zshrc
	rm ~/.zsh_plugins.txt

clean-neovim:
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim
	rm -rf ~/.local/state/nvim

clean-tmux:
	rm -rf ~/.tmux/
	rm -rf ~/.tmux.conf

clean-tools:
	sudo apt remove exa zoxide
