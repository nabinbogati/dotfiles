set clipboard+=unnamedplus

" Change Leader
let mapleader = ' '

" plugin list
call plug#begin('~/nvim/plugged')
    Plug 'tpope/vim-fugitive'               "  git tools
    Plug 'tpope/vim-commentary'             "  commenting options
    Plug 'preservim/nerdtree'               "  filesystem explorer
    Plug 'Xuyuanp/nerdtree-git-plugin'      "  git status on filesystem
    Plug 'vim-syntastic/syntastic'          "  syntax checker
    Plug 'mattn/emmet-vim'                  "  html/css/js rich plugin
    Plug 'vim-airline/vim-airline'          "  theme for statusline
    Plug 'tpope/vim-surround'               "  change sorroundings
    Plug 'dracula/vim'                      "  dracula theme
    Plug 'ryanoasis/vim-devicons'           "  devicons on nerdtree
    Plug 'junegunn/fzf.vim'                 "  fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" airline statusbar theme
let g:airline_theme='cool'
let g:airline_section_a='%{coc#status()}'

" show syntax hightlighting
syntax enable

" editor colorscheme
colorscheme gruvbox

" left padding
set foldcolumn=1

" disable arrow_keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" save file
nmap <Leader>w :w <cr>
nmap <Leader>W :wq<cr>

" exit vim
nmap <Leader>q :q <cr>
nmap <Leader>Q :q!<cr>

" fzf with ripgrep
nmap <Leader>f :Files<cr>
nmap <Leader>F :Rg<cr>

" Buffers, History and Registers
nmap <Leader>b :Buffers<cr>
nmap <Leader>h :History<cr>
nmap <Leader>r :registers<cr>

" automatically write file while changing buffer
set autowriteall

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
nmap <Leader>ts :NERDTreeToggle<cr>

" set background transparency
hi Normal ctermbg=None guibg=None

" coc.vim
so ~/.config/nvim/coc.vim

"source on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost ~/.config/nvim/init.vim source %
augroup END
