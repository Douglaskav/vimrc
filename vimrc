" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Gruvbox-Material Theme
Plug 'sainnhe/gruvbox-material'

" Vim-airline
Plug 'vim-airline/vim-airline'

" JSX files support
Plug 'mxw/vim-jsx'

" TS support
Plug 'leafgarland/typescript-vim'

" JS support
Plug 'pangloss/vim-javascript'

" Nerdtree
Plug 'preservim/nerdtree'

" Nerdtree syntax highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Nerdtree dev icons
Plug 'ryanoasis/vim-devicons'

" He complete the pairs () {} []
Plug 'jiangmiao/auto-pairs'

" He complete you <3
Plug 'Valloric/YouCompleteMe'

" Syntax checking
Plug 'vim-syntastic/syntastic'

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
" Show the numbers
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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" gruvbox-material
set background=dark

let g:gruvbox_materia_Background = 'medium'
colorscheme gruvbox-material
" YouCompleteMe
" This will remove the window info on top of file.
let g:ycm_add_preview_to_completeopt="popup"

" g:ycm_autoclose_preview_window_after_completion=1
" g:ycm_autoclose_preview_window_after_insertion=1

" Nerdtree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" Buffer keybindings
map <C-K> :bnext<CR>
map <C-J> :bprev<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>
map <C-D> :bdelete<CR>


