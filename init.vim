set clipboard+=unnamedplus

" plugin list
call plug#begin('~/nvim/plugged')
    Plug 'tpope/vim-fugitive'               "  git tools
    Plug 'tpope/vim-commentary'             "  commenting options
    Plug 'preservim/nerdtree'               "  filesystem explorer
    Plug 'Xuyuanp/nerdtree-git-plugin'      "  git status on filesystem
    Plug 'ctrlp/ctrlp.vim'                   "  faster file access ctrl+p
    Plug 'vim-syntastic/syntastic'          "  syntax checker
    Plug 'mattn/emmet-vim'                  "  html/css/js rich plugin
    Plug 'vim-airline/vim-airline'          "  theme for statusline
    Plug 'tpope/vim-surround'               "  change sorroundings
    Plug 'dracula/vim'                      "  dracula theme
    Plug 'ryanoasis/vim-devicons'           "  devicons on nerdtree
call plug#end()

" airline statusbar theme
let g:airline_theme='cool'
let g:airline_section_a=''

" show syntax hightlighting
syntax enable

" editor colorscheme
colorscheme gruvbox

" disable arrow_keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set nu rnu                      " set line number and relative number is hybrid
set mouse=a                     " Hide the mouse cursor while typing
set list                        " shows whitespaces characters 
set shiftwidth=4                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every fourcolumns
set cursorline                  " hightlight line with cursor

" nerdtree open on start, close on exit 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |q| endif
autocmd VimEnter * NERDTree

" set background transparency
hi Normal ctermbg=None guibg=None 
