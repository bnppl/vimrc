set nocompatible               
filetype off                  
set term=xterm-256color
syntax on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'junegunn/seoul256.vim'
Bundle 'SirVer/ultisnips'
Bundle 'matthewsimo/angular-vim-snippets'

Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'walm/jshint.vim'

autocmd! BufWritePost *.js JSHint
autocmd BufWritePre *.js :%s/\s\+$//e

set colorcolumn=80 
set number 
set smartindent 
set tabstop=2 
set shiftwidth=2 
set expandtab

filetype plugin indent on  

let mapleader = ","

let g:SuperTabDefaultCompletionType = "context"
" NERDTree
let NERDTreeDirArrows=1
let NERDTreeIgnore=[
            \ '\(lib\|vendor\|node_modules\|bower_components\|deps\|package\|trigger_package\)$[[dir]]',
            \ '\(build\|ebin\|target\)$[[dir]]',
            \ '\.py[co]$[[file]]',
            \ '\~$[[file]]',
            \ '\.\(class\|beam\|o\)$[[file]]',
            \ '\.\(jpg\|png\|gif\|pdf\|ico\|JPG\|PNG\|GIF\|PDF\|ICO\)$[[file]]'
            \]
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>b :NERDTreeFromBookmark<space>

" Snippets plugin
let g:snip_start_tag = "@"
let g:snip_end_tag = "@"

colorscheme seoul256
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

set wildmenu
set wildmode=list:longest,full

map <Down> <C-W>j
map <Up> <C-W>k
map <Left> <C-W>h
map <Right> <C-W>l
