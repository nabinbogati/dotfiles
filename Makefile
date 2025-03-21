target:
	make basic-setup
	make zsh-setup
	make tmux-setup
	make neovim-setup

basic-setup:
	# setup dev env to compile pyenv
	sudo apt-get install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev -y

	# install pip for python3
	sudo apt-get install python3-pip -y
	sudo apt install zoxide eza -y # for jump around and colordirs
	sudo apt install fd-find -y
	sudo apt install fzf -y
	sudo apt install ripgrep -y
	sudo apt install unzip -y
	sudo apt install tmux git tig -y
	sudo apt install tldr

zsh-setup: zsh-shell zsh-plugin-manager

zsh-shell:
	sudo apt install zsh  # install zsh shell
	ln -sf $(PWD)/zsh/zshrc ~/.zshrc # copy config file to home directory
	chsh -s '/usr/bin/zsh' # change default shell to zsh

zsh-plugin-manager:
	git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote # install antidote plugin manager
	ln -sf $(PWD)/zsh/zsh_plugins.txt ~/.zsh_plugins.txt
	ln -sf $(PWD)/zsh/p10k.zsh ~/.p10k.zsh

tmux-setup: tmux-plugin-manager
	ln -sf $(PWD)/tmux/tmux.conf ~/.tmux.conf

tmux-plugin-manager:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # install tpm

neovim-setup: install-neovim install-lazynvim

install-neovim:
	#fetch the latest available neovim
	wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz -O /tmp/nvim.tar.gz

	tar xzvf /tmp/nvim.tar.gz --directory /tmp/
	mv /tmp/nvim-linux-x86_64 ~/.nvim
	ln -sf ~/.nvim/bin/nvim ~/.local/bin/nvim

install-lazynvim:
	git clone https://github.com/LazyVim/starter ~/.config/nvim

setup-alacritty:
	sudo apt install alacritty -y
	ln -sf $(PWD)/alacritty/ ~/.config/

setup-pyenv:
	bash zsh/pyenv.sh

setup-git:
	sudo apt install git -y
	sudo apt install tig -y

	### Link configuration files from dotfiles to system location
	ln -sf `pwd`/git/.gitignore_global ~/

	### configure git
	make gitconfig

setup-android:
	# install java
	# sudo apt install openjdk-17-jdk -y

	# install command-line tools
	# wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O ~/Downloads/cmdlinetools.zip
	# unzip -q ~/Downloads/cmdlinetools.zip -d ~/Downloads

	mkdir -p ~/Android/Sdk/cmdline-tools/latest

	mv ~/Downloads/cmdline-tools/* ~/Android/Sdk/cmdline-tools/latest


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
	sudo apt remove eza zoxide
