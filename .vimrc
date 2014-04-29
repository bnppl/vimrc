set nocompatible

"Vundle requirements
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"Colours
set term=xterm-256color
Bundle 'junegunn/seoul256.vim'
Bundle 'nanotech/jellybeans.vim'
colorscheme jellybeans

"general editer settings
syntax on
set colorcolumn=80
set number
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
let mapleader = ","
set mouse=a
filetype plugin indent on

set wildmenu
set wildmode=list:longest,full

"Remove trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

" Snippets related stuff.
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
let g:snip_start_tag = "@"
let g:snip_end_tag = "@"

"Use tab for completion
Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

" NERDTree
Bundle 'scrooloose/nerdtree'
let NERDTreeDirArrows=1
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>b :NERDTreeFromBookmark<space>

"Utils
Bundle 'L9'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-abolish'

"Git integration
Bundle 'tpope/vim-fugitive'

"Searching for things / files
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/EasyGrep'
let g:EasyGrepFilesToExclude = "*.tags,*.git\*"

"javascript related stuff
Bundle 'jelera/vim-javascript-syntax'
Bundle 'walm/jshint.vim'

"Run JSHint on save (requires JSHint to be installed).
autocmd! BufWritePost *.js JSHint

"Remap the arrow keys to change windows.
map <Down> <C-W>j
map <Up> <C-W>k
map <Left> <C-W>h
map <Right> <C-W>l

"For debugging in PHP
Bundle 'joonty/vdebug.git'
"xdebug config for php (match port in php.ini)
 let g:vdebug_options= {
     \    "port" : 9001,
     \    "server" : '',
     \    "timeout" : 20,
     \    "on_close" : 'detach',
     \    "break_on_open" : 1,
     \    "ide_key" : '',
     \    "path_maps" : {},
     \    "debug_window_level" : 0,
     \    "debug_file_level" : 3,
     \    "debug_file" : "~/vdebug.log",
     \    "watch_window_style" : 'expanded',
     \    "marker_default" : '⬦',
     \    "marker_closed_tree" : '▸',
     \    "marker_open_tree" : '▾'
     \}

"PHP Completion
Bundle 'sebastiankessler/phpcomplete.vim'
"Bundle 'mbbill/code_complete'

"PHP Refactor
Bundle 'vim-php/vim-php-refactoring'
" path to https://github.com/QafooLabs/php-refactoring-browser bin
let g:php_refactor_command='php ~/Git/php-refactoring-browser/refactor'

"PHP Documentor
Bundle 'vim-scripts/PDV--phpDocumentor-for-Vim'
inoremap <leader>d <ESC>:call PhpDocSingle()<CR>i
nnoremap <leader>d :call PhpDocSingle()<CR>
vnoremap <leader>d :call PhpDocRange()<CR>

"Tags - for autocompletion and jumping to functions.
Bundle 'vim-scripts/taglist.vim'
set tags=php.tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"PHP QA stuff - requires mess detector and codesniffer to be instealled.
Bundle 'joonty/vim-phpqa'
let g:phpqa_codesniffer_args = "--standard=Drupal"
let g:phpqa_messdetector_cmd = "~/phpmd" "path to mess detector bin
let g:phpqa_messdetector_ruleset = "~/Git/phpmd/rules.xml" "mess detector ruleset

"move temp files to temp directory
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
