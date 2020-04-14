set termguicolors
set clipboard+=unnamedplus

let g:python_host_prog="/home/nb/.virtualenvs/pynvim2/bin/python"
let g:python3_host_prog="/home/nb/.virtualenvs/pynvim3/bin/python"


"Plugin call
call plug#begin('~/nvim/plugged')
	Plug 'tpope/vim-fugitive'
	Plug 'preservim/nerdtree'
	Plug 'tpope/vim-commentary'
 	Plug 'ycm-core/YouCompleteMe'
	Plug 'tpope/vim-obsession'
   	Plug 'Raimondi/delimitMate'
   	Plug 'honza/vim-snippets'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'kien/ctrlp.vim'
	Plug 'vim-syntastic/syntastic'
   	Plug 'mattn/emmet-vim'
   	Plug 'Yggdroot/indentLine'
	Plug 'vim-airline/vim-airline'
   	Plug 'vim-airline/vim-airline-themes'
   	Plug 'tpope/vim-surround'
	Plug 'dracula/vim', { 'name': 'dracula' }
   	Plug 'ryanoasis/vim-devicons'
call plug#end()
" Plugin end


" airline fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'


" devicons:
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'


"  themes
syntax enable
set background=dark

" solarized
let g:solarized_termcolors=256 "256
let g:solarized_termtrans = 0
let g:solarized_degrade = 1
let g:solarized_bold = 1
let g:solarized_underline = 1        
let g:solarized_italic = 1          
let g:solarized_contrast = "low"   " high or low
let g:solarized_visibility= "low"  " high or low 

" gruvbox
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_light='hard' " medium, hard
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_improved_strings=1
let g:gruvbox_improved_strings=1
colorscheme solarized8 "dracula gruvbox


" Disable arrow_keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


" vim config
syntax on                       " show syntax hightlighting
set encoding=utf-8              " document encoding type
set nu rnu                      " set line number and relative number is hybrid
set ruler                       " set ruler
set showmode                    " Display the current mode
set mouse=a                     " Automatically enable mouse usage
set mousehide                   " Hide the mouse cursor while typing
set spell                       " Spell checking on
set showmatch                   " Show matching brackets/parenthesis
set shiftwidth=4                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every fourcolumns


" NerdTree Ignore Files and Folders
let NERDTreeIgnore = ['\.pyc$', '__pycache__','.vscode', '_DS_Store']                                      " ignore files and folder in nerd tree

autocmd StdinReadPre * let s:std_in=1 "start nerd-tree on vim startup
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " exit nerd-tree if user exists last vim window
autocmd VimEnter * NERDTree


" autosave on focuslost
au FocusLost * :wa

" autosave on buffer change
set autowriteall


" 'quote' a word
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
" double "quote" a word
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
" remove quotes from a word
nnoremap wq :silent! normal mpeld bhd `ph<CR>


"Emmet mappings
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

