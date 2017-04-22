" Enable default settings.
filetype plugin indent on
set ruler
set number
set textwidth=80
set wildmenu
set t_Co=256
 syntax enable
  
" Reload the current buffer if changed externally.
au BufEnter * checktime
set autoread

" Auto indent with 2 spaces.
set smartindent
set shiftwidth=2
set tabstop=2
set expandtab

" Use ^o to togger insert (paste) mode.
set pastetoggle=<C-o>

" Map ^hjkl to move between window panes.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Map ^e to close pane if there are no changes.
map <C-e> :q<cr>

" Map <> to change indentation with re-highlight in visual mode.
vmap > >gv
vmap < <gv

" Map jk to command mode.
inoremap jk <ESC>

" Add non-standard extensions.
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Add filetype local behavior.
autocmd FileType css setlocal iskeyword+=-
autocmd FileType gitcommit,markdown setlocal spell
autocmd FileType go setlocal noexpandtab
autocmd FileType html setlocal textwidth=0

" Add a git blame command.
if !exists(':Blame')
  command Blame !cd "%:p:h" && git blame "%:t"
endif

" Switch 0 and ^ in normal mode
nnoremap 0 ^
nnoremap ^ 0

" Insert without exit normal mode
:nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
:nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

" End of line normal mode with E
:nnoremap E $

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Copy and paste from clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>
