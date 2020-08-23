set termguicolors
set clipboard+=unnamedplus

" neovim python bindings
let g:python_host_prog="~/.virtualenvs/pynvim2/bin/python"
let g:python3_host_prog="~/.virtualenvs/pynvim3/bin/python"


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


" you complete me disable preview
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 0
autocmd FileType vim let b:vcm_tab_complete = 'vim'


" airline statusbar theme, remove statusbar filetype, seperators
let g:airline_theme='cool'
let g:airline_section_a=''
let g:airline_skip_empty_sections = 1


" " themes, custom colors
syntax enable
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark='low'



" disable arrow_keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


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


" enable dev icons, ignore files/folders, open on start, close on exit
let g:webdevicons_enable = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__','.vscode', '_DS_Store']                                      " ignore files and folder in nerd tree
autocmd StdinReadPre * let s:std_in=1 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
autocmd VimEnter * NERDTree


" quote words mapping
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
nnoremap wq :silent! normal mpeld bhd `ph<CR>


" emmet mappings for autocomplete with tab
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
