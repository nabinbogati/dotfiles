# Dotfiles 
[![Project Status](https://img.shields.io/badge/status-active-success.svg)]()
 [![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE) 
 ****This project aims to bundle all my needs for managing dotfiles of vairous tools required for development. The purpose of maintaining this repository is to use a set of config files to manage the behaviour of the tools that I use on day to day basis like zsh, neovim, and tmux. It also provides an easy way to install all those tools and it's configurations using a Makefile. So that after switching to a new system it's easir to setup my previous development setup.****
### Tools
1. zsh
    - Prompt  `[powerlevel10k]`
    - Plugin Manager  `[antidote]`
    - Plugins
    	1. zsh-users/zsh-syntax-hightlighting
    	2. zsh-users/zsh-autosuggestions
    	3. zsh-users/zsh-completions
    	4. zsh-users/zsh-history-substring-search
        5. romkatv/powerlevel10k
    - Extras
    	1. exa
        2. zoxide
2. tmux
    - Plugin Manager -> `[TPM]`
    - Plugins
        1. tmux-plugins/tpm'  `plugin manager`
        2. catppuccin/tmux'  `default theme`
        3. tmux-plugins/tmux-sensible' `basic settings like scape-time, history-limit, status -interval etc`
        4. tmux-plugins/tmux-yank' `copy to system clippboard`
        5. tmux-plugins/tmux-resurrect' `restore env after system restart`
        6. tmux-plugins/tmux-continuum' `automatic save env on specified intervals`
        7. tmux-plugins/tmux-pain-control' `vim like pane control`
        8. tmux-plugins/tmux-sessionist' `easier way to manage sessions`
3. neovim
    - NvChad

### Installation
```
Requirements:
1. make
2. git
```
```
Install Using make
$ make all
```

### Contact
- nabin31bogati@gmail.com
- https://linktr.ee/nabinbogati
