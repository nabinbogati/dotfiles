set termguicolors
set clipboard+=unnamedplus

" plugin list
call plug#begin('~/nvim/plugged')
    Plug 'tpope/vim-fugitive'               "  git tools
    Plug 'tpope/vim-commentary'             "  commenting options
    Plug 'ycm-core/YouCompleteMe'           "  autosuggestion for codes
    Plug 'preservim/nerdtree'               "  filesystem explorer
    Plug 'Xuyuanp/nerdtree-git-plugin'      "  git status on filesystem
    Plug 'kien/ctrlp.vim'                   "  faster file access ctrl+p
    Plug 'vim-syntastic/syntastic'          "  syntax checker
    Plug 'mattn/emmet-vim'                  "  html/css/js rich plugin
    Plug 'vim-airline/vim-airline'          "  theme for statusline
    Plug 'tpope/vim-surround'               "  change sorroundings
    Plug 'dracula/vim'                      "  dracula theme
    Plug 'ryanoasis/vim-devicons'           "  devicons on nerdtree
call plug#end()

" airline statusbar theme, remove statusbar filetype, seperators
let g:airline_theme='cool'
let g:airline_section_a=''
let g:webdevicons_enable = 1

" themes, custom colors
syntax enable
colorscheme gruvbox

" disable arrow_keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

syntax on                       " show syntax hightlighting
set encoding=utf-8              " document encoding type
set nu rnu                      " set line number and relative number is hybrid
set showmode                    " Display the current mode
set mousehide                   " Hide the mouse cursor while typing
set spell                       " Spell checking on
set list                        " shows whitespaces characters 
set showmatch                   " Show matching brackets/parenthesis
set shiftwidth=4                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every fourcolumns
set cursorline                  " hightlight line with cursor

" nerdtree open on start, close on exit 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |q| endif
autocmd VimEnter * NERDTree

" set background transparency
hi Normal ctermbg=None guibg=None 
