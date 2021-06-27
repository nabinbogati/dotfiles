call plug#begin()


""" Easy file navigation with fzf
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

""" Easy commenting lines in normal and visual mode
Plug 'tpope/vim-commentary'

""" gruvbox theme
Plug 'morhetz/gruvbox'

""" solarized theme
Plug 'altercation/vim-colors-solarized'

""" Easy navigation to tmux pane with C-[hjkl]
Plug 'christoomey/vim-tmux-navigator'

""" Distracting free coding
Plug 'junegunn/goyo.vim'

""" Smooth scrolling
Plug 'psliwka/vim-smoothie'

""" Emmet for vim
Plug 'mattn/emmet-vim'

""" Autocomplete Engine
Plug 'ycm-core/YouCompleteMe'

""" Makes git command available from vim console
Plug 'https://tpope.io/vim/fugitive.git'

""" Shows git modifications inline
Plug 'airblade/vim-gitgutter'

""" Used mainly for buffer switching
Plug 'https://tpope.io/vim/unimpaired.git'

""" Opens ranger gui
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

""" Show various info on statusbar
Plug 'vim-airline/vim-airline'

""" Shows open buffer as tab in tabline
Plug 'ap/vim-buftabline'


Plug 'davidhalter/jedi-vim'

""" Automatically save vim session
""" saves vim-session on VimLeave and loads session on VimEnter
Plug 'wilon/vim-auto-session'

""" Automatically mkdir when saving buffer
Plug 'pbrisbin/vim-mkdir'

""" Godot syntax and runner
""" Plug 'habamax/vim-godot'

""" AsyncRun for running godot executable
Plug 'skywind3000/asyncrun.vim'

""" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'


call plug#end()
