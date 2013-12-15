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

Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'walm/jshint.vim'

autocmd! BufWritePost *.js JSHint
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\t/  /g

set colorcolumn=80 
set number 
set smartindent 
set tabstop=2 
set shiftwidth=2 
set expandtab

filetype plugin indent on  

let g:UltiSnipsExpandTrigger="<c-tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<c-tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 

colorscheme seoul256
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

set wildmenu
set wildmode=list:longest,full

map <Down> <C-W>j
map <Up> <C-W>k
map <Left> <C-W>h
map <Right> <C-W>l
