set nocompatible               
filetype off                  
set term=xterm-256color
set t_Co=256
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'walm/jshint.vim'

Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'FuzzyFinder'
Bundle 'noah/vim256-color'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'flazz/vim-colorschemes'
Bundle 'junegunn/seoul256.vim'

autocmd! BufWritePost *.js JSHint
autocmd BufWritePre *.py :%s/\s\+$//e

colorscheme seoul256
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
set colorcolumn=80 
set number 
set smartindent 
set tabstop=2 
set shiftwidth=2 
set expandtab
filetype plugin indent on     

syntax on
set wildmenu
set wildmode=list:longest,full

