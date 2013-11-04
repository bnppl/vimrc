 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 
 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'tpope/vim-rails.git'
 Bundle 'walm/jshint.vim'

 Bundle 'jelera/vim-javascript-syntax'
 " vim-scripts repos
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (ie. when working on your own plugin)
 Bundle 'file:///Users/gmarik/path/to/plugin'
 " ...
 Bundle 'noah/vim256-color'
 Bundle 'jonathanfilip/vim-lucius'
 Bundle 'flazz/vim-colorschemes'
 Bundle 'junegunn/seoul256.vim'

 autocmd! BufWritePost *.js JSHint

 set t_Co=256
 colorscheme seoul256
 set dir=~/.vimswap//,/var/tmp//,/tmp//,.
 set colorcolumn=80 
 set number 
 set smartindent 
 set tabstop=2 
 set shiftwidth=2 
 set expandtab
 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
 "
 set wildmenu
 set wildmode=list:longest,full

