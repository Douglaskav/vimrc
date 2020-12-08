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

call plug#end()
filetype plugin indent on 

" -----------------------------------

" Key biddings
nmap <C-n> :NERDTreeToggle<CR>

nmap <C-s> :w<CR>
nmap <C-q> :quit<CR>

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

" Make a suspense menu
set wildmenu

" Background in help bar
set laststatus=2

" Cool menu for quit without save
set confirm

"Setting the colorscheme
colorscheme AuraDark

" Open NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

" Disable unmatched folder and file icons having the same color as their labels
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" Mitigating lag issues
let g:NERDTreeLimitedSyntax = 1
