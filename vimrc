" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
  call plug#begin('~/.vim/plugged')

" " Gruvbox-Material Theme
Plug 'sainnhe/gruvbox-material'

" Vim-airline
Plug 'vim-airline/vim-airline'

" JSX files support
Plug 'mxw/vim-jsx'

" TS support
Plug 'leafgarland/typescript-vim'

" JS support
Plug 'pangloss/vim-javascript'

" Prettier
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Nerdtree
Plug 'preservim/nerdtree'

" Nerdtree syntax highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Nerdtree dev icons
Plug 'ryanoasis/vim-devicons'

" He complete the pairs () {} []
Plug 'jiangmiao/auto-pairs'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Emmet.vim
Plug 'mattn/emmet-vim'

" Initialize plugin system
call plug#end()

" ===============================================
" Some configs
" ===============================================
" Some things
" Settings encode to UTF-8
set encoding=UTF-8
" Set to wrap the line
set wrap
"  Show the numbers
set nu
" Put the tab with 2
set tabstop=2
set shiftwidth=2
" Use spaces when pressing <tab> key
set expandtab

" Keybinds
" map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>
" map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>0i
" map CTRL-S to save the file
imap <C-s> <Esc>:w<CR>a
map <c-s> :w<CR>
" map CTRL-Q to quit the vim
map <c-q> :q<CR>
map <S-q> :q!<CR>

" typescript-vim
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" gruvbox-material
set background=dark

let g:gruvbox_materia_Background = 'medium'
colorscheme gruvbox-material

" Nerdtree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using
" exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
"
" " Buffer keybindings
map <C-K> :bnext<CR>
map <C-J> :bprev<CR>
map <C-D> :bdelete<CR>

" Terminal inside vim
map <C-m> :term<CR>
set splitbelow
set termwinsize=10x0
