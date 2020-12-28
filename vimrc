call plug#begin('~/.vim/plugged')
  " Smart autocomplete as VSCode
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " Auto Pairs () [] 
  Plug 'jiangmiao/auto-pairs'

  " A collection of language packs for Vim.
  Plug 'sheerun/vim-polyglot'  

  " File system explorer
  Plug 'preservim/nerdtree'

  " Add icons to NERDTree, vir-airline e ect.
  Plug 'ryanoasis/vim-devicons'

  " Add colors to NERDtree Icons
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  " Add lightline
  Plug 'itchyny/lightline.vim'

call plug#end()
filetype plugin indent on 

" -----------------------------------

" Lightline theme
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" Colors
let g:onedark_termcolors=256

" Showing br
set laststatus=2

" Key biddings
nmap <C-n> :NERDTreeToggle<CR>

nmap <C-s> :w<CR>
nmap <C-q> :quit<CR>

" Make a new empty tab.
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
" move to the previous/next tabpage.
nnoremap <C-j> gT
nnoremap <C-k> gt
" Go to last active tab 
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <C-x> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <C-x> :EXE "TABN ".G:LASTTAB<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" UTF-8
set encoding=UTF-8

" Using Tabs to indent
set smarttab

set cindent
set tabstop=2
set shiftwidth=2

" always uses spaces instead of tab characters
set expandtab

" always put line.
set number

" AutoIndent
set autoindent

" Turning search automatically
set incsearch

" Cool menu for quit without save
set confirm

"Setting the colorscheme
colorscheme onedark 

" Open NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

" Disable unmatched folder and file icons having the same color as their labels
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" Mitigating lag issues
let g:NERDTreeLimitedSyntax = 1

" Vertical Lines
nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction
