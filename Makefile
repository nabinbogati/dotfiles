SHELL := /bin/zsh

target:
	make install-zsh
	make install-git


hacker-env:
	make install-alacritty
	make install-tmux
	make install-neovim
	make install-python


install-zsh:
	sudo apt-get install zsh
	ln -sf `pwd`/zsh/.zshrc ~/
	ln -sf `pwd`/zsh/.zshenv ~/
	ln -sf `pwd`/zsh/.p10k.zsh ~/

	### Install antibody, my zsh plugin manager
	sudo apt-get install antibody
	
	### Install ripgrep, my alternative to grep
	sudo apt-get install ripgrep

	### Install fd, my alternative to find
	sudo apt-get install fd-find

	### Install fzf, my file interactor
	sudo apt-get install fzf

	### Install ranger, my file explorer
	sudo apt-get install ranger
	mkdir -p ~/.config/ranger/
	ln -sf `pwd`/ranger/rc.conf ~/.config/ranger/

	### Install tree, as in linux
	sudo apt-get install tree

install-git:
	### Install newer version of git, my version control
	sudo apt-get install git
	ln -sf `pwd`/git/.gitignore_global ~/
	make gitconfig

	### Install tig, my alternative to git-log
	sudo apt-get install tig

	### Install git-filter-repo, my alternative to git-filter-branch
	sudo apt-get install git-filter-repo

	### Install git-sizer, my alternative to `du -sh .git`
	sudo apt-get install git-sizer


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

	git config --global core.excludesfile '~/.gitignore_global'
	git config --global pull.ff only


install-alacritty:
	sudo apt-get install alacritty
	mkdir -p ~/.config/alacritty/
	ln -sf `pwd`/alacritty/alacritty.yml ~/.config/alacritty/


install-tmux:
	sudo apt-get install tmux

	### Install tpm, my tmux plugin manager
ifeq (,$(wildcard ~/.tmux/plugins/tpm))
	# ~/.tmux/plugins/tpm doesn't exist
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	cd ~/.tmux/plugins/tpm && git reset --hard HEAD
endif

	ln -sf `pwd`/tmux/.tmux.conf ~/
	### Initialized installation of tmux plugins
	~/.tmux/plugins/tpm/bin/install_plugins


install-neovim:
	sudo apt-get install neovim

	### Install vim-plug, my neovim plugin manager
ifeq (,$(wildcard ~/.local/share/nvim/site/autoload/plug.vim))
	# ~/.local/share/nvim/site/autoload/plug.vim doesn't exist
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

	mkdir -p ~/.config/nvim/
	ln -sf `pwd`/neovim/init.vim ~/.config/nvim/

	make install-python
	pip install pynvim

	### Initialized installation of vim plugins
	nvim +PlugInstall +qall


install-python:
	### Install pyenv, my python version manager
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv

	### Install dependencies
	sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
	echo 'export PYENV_ROOT="~/.pyenv"' >> ~/.zshrc
        echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
	

	### virtualenv wrapper for pyenv
	git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git
	### Load pyenv enviroment
	eval "$$(pyenv init -)" && \
	export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

	### Install python
	pyenv install 3.9.1
	pyenv global 3.9.1


misc:
	### Install nginx, my web server
	sudo apt-get install nginx

	### Install node, my js console
	sudo apt-get install node

	### Install openjdk, my java
	sudo apt-get install openjdk-11-jdk
	sudo apt-get install openjdk-11-jre

	### Install gh, my github cli
        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
	sudo apt-add-repository https://cli.github.com/packages
	sudo apt-get update
	sudo apt-get install gh

	### Install bat, my alternative to cat
	sudo apt-get install bat


clean:
	rm -rf ~/.tmux/plugins/
	rm -rf ~/.vim/plugged/
	rm -r ~/.local/share/nvim/site/autoload/plug.vim
	rm -r ~/.zshrc
	rm -r ~/.p10k.zsh
	rm -r ~/.tmux.conf
	rm -r ~/.gitignore_global
	rm -r ~/.config/nvim/init.vim
	rm -r ~/.config/alacritty/alacritty.yml
	rm -r ~/.config/ranger/rc.conf
