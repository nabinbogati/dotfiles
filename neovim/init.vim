"scroll deoplete completion suggestion words
let g:deoplete#enable_at_startup = 1
let g:jedi#completions_enabled = 0
let g:python3_host_prog = '~/.pyenv/versions/3.9.1/bin/python'
let g:python2_host_prog = '~/.pyenv/versions/2.1.18/bin/python'

let g:UltiSnipsJumpBackwardTrigger="<c-z>"
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ deoplete#manual_complete()
	function! s:check_back_space() abort "{{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
	endfunction"}}}

inoremap <silent><expr> <S-TAB>
	\ pumvisible() ? "\<C-p>" : "\<TAB>"

source ~/.config/nvim/plugins.vim

""" color scheme
colorscheme gruvbox

""" show syntax hightlighting
syntax enable

""" Show line numbers
set nu

""" Let mouse-drag select only text not line numbers
set mouse+=a


""" reload file if changed from elsewhere (TODO test if working)
set autoread


""" Preserves undo history upon writing and changing buffer.
""" This has no effect on history between sessions.
set hidden


""" Search using smartcase. Both are needed for normal behavior!
set ignorecase
set smartcase

""" Searching stops at the end of file set nowrapscan


""" Confirm whether to save when deleting or quitting a changed buffer
set confirm


""" Automatically save undo history between sessions.
set undofile


""" set a directory to store the undo history
set undodir=~/.vim/undo/


""" Elect ; to be a leader
let mapleader = ";"


""" Removes ranger default key-binding of ;f.
""" btw, ;r is used for ranger and ;f for :Files [== :FZF]
let g:ranger_map_keys = 0


"""" Reloads vi with ;R or ;RR
""" R is consistent with tmux also, where C-b R is used for reloading config
nnoremap <leader>R :source $MYVIMRC<cr>
nnoremap <leader>RR :source $MYVIMRC<cr>


""" Open ranger with ;r
nnoremap <leader>r :Ranger<cr>

""" Buffer search with ;b
nnoremap <leader>b :Buffers<cr>
nnoremap <leader><leader> :GitFiles<cr>

""" Search in Git files with ;g
nnoremap <leader>g :GFiles<cr>

""" FZF files search with ;f
nnoremap <leader>f :Files<cr>

""" Rg search with ;Rg
nnoremap <leader>Rg :Rg<cr>

""" ;hh for searching file history
nnoremap <leader>hh :History<cr>

""" ;hh for searching vim command history
nnoremap <leader>h; :History:<cr>

""" ;hh for searching find history
nnoremap <leader>h/ :History/<cr>


""" Removes bclose map of deleting buffer with ;bd
let g:bclose_no_plugin_maps = 1

""" Deletes current buffer with ;w
nnoremap <leader>w :bd<cr>

""" Goto last buffer with ;Tab
nnoremap <leader><Tab> :b#<cr>

""" Removes all highlights from matched chars
nnoremap <leader>/ :noh<cr>


""" C-s to save in vi.  Alacritty will convert Command-s to C-s.
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>

""" C-q to quit in vi.
nnoremap <C-q> :q<cr>

""" Removes trailing space by "; "
nnoremap <leader><space> :%s/\s\+$//e<cr>

"""" In visual mode, Y to copy to clipboard
nnoremap Y "*y

""" Hide doc preview window jedi
autocmd FileType python setlocal completeopt-=preview

""" Upon saving a file, this code saves current buffer state so that
""" next vi will restore current buffers.
""" Note: Default behavior in vim-auto-session was to also autosave session
""" upon quitting, that feature is disabled in their source code.
autocmd BufWritePost * call session#MakeSession()

