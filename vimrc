"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               

" GENERAL CONFIGS{{{
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file is use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to the file.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Set shift width to 4 spaces.
set shiftwidth=2

" Set tab width to 4 columns.
set tabstop=2

" Do not save backup files.
set nobackup
set nowritebackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set wrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Without it the vim will say 'save the file before change the buffer'
set hidden

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Set unicode characters 
set encoding=utf-8

" Enable auto completion menu after pressing TAB.  set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" automatically enable JavaScript to auto-complete 
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"}}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin()
	
	" NerdTree File Manager
  	Plug 'preservim/nerdtree'

	" Statusline airline
	Plug 'vim-airline/vim-airline'

	" Add syntax suport
	Plug 'sheerun/vim-polyglot'	

	" post install (yarn install | npm install) then load plugin only for editing supported files
	Plug 'prettier/vim-prettier', {
  	\ 'do': 'yarn install --frozen-lockfile --production',
  	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

	" Show open buffers on top screen
	Plug 'ap/vim-buftabline'

	" Edge colorschme
	Plug 'morhetz/gruvbox'

	" Increment completion
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Install fzf fuzzy files searcher
	Plug 'junegunn/fzf.vim'

call plug#end()

" }}}

" COLORSCHEME{{{

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme gruvbox
	
"}}}

" MAPPINGS --------------------------------------------------------------- {{{

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Press the space bar totype the : character in command mode.
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" Map the F5 key to run a Python script inside Vim.
" We map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!node % <CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" " Buffer keybindings
map <C-O> :bnext<CR>
map <C-I> :bprev<CR>
map <C-D> :bdelete<CR>

nnoremap <A-n> :bnext <CR>
nnoremap <A-d> :bdelete <CR>
nnoremap <A-p> :bprev <CR>

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <C-t> :NERDTreeToggle<cr>

" Searching files with Fzf
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>

" Ctrl+s to save the file
nnoremap <silent><c-s> :<c-u>update<cr>"}}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" }}}

let g:NERDTreeWinPos = "right"
