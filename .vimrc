set nocompatible

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"Colours
set term=xterm-256color
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'nanotech/jellybeans.vim'
"colorscheme jellybeans
colorscheme seoul256

"general editer settings
syntax on
set colorcolumn=80,120
set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
let mapleader = ","
set mouse=a
filetype plugin indent on

set wildmenu
set wildmode=list:longest,full

"Remove trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

"Utils
NeoBundle 'L9'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'Valloric/ListToggle'

"Git integration
NeoBundle 'tpope/vim-fugitive'

"Undo
NeoBundle 'sjl/gundo.vim'
nnoremap <leader>gu :GundoToggle<CR>

"Searching for things / files
NeoBundle 'vim-scripts/EasyGrep'
let g:EasyGrepFilesToExclude = "tags,*.git\*"

"javascript related stuff
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'walm/jshint.vim'
NeoBundle 'marijnh/tern_for_vim'

"Run JSHint on save (requires JSHint to be installed).
autocmd! BufWritePost *.js JSHint

"Remap the arrow keys to change windows.
map <Up> <C-W>k
map <Down> <C-W>j
map <Left> <C-W>h
map <Right> <C-W>l

"For debugging in PHP
NeoBundle 'joonty/vdebug.git'
"xdebug config for php (match port in php.ini)
 let g:vdebug_options= {
             \    "port" : 9001,
             \    "server" : '',
             \    "timeout" : 20,
             \    "on_close" : 'detach',
             \    "break_on_open" : 1,
             \    "ide_key" : '',
             \    "path_maps" : {
             \      '/srv/opg-core-api/application/current' : '/Users/beneppel/Git/moj/opg-core-back-end',
             \      '/srv/opg-core-membrane/application/current' : '/Users/beneppel/Git/moj/opg-core-auth-membrane',
             \      '/srv/opg-core-front/application/current' : '/Users/beneppel/Git/moj/opg-core-front-end'
             \    },
             \    "debug_window_level" : 0,
             \    "debug_file_level" : 3,
             \    "debug_file" : "~/vdebug.log",
             \    "watch_window_style" : 'expanded',
             \    "marker_default" : '⬦',
             \    "marker_closed_tree" : '▸',
             \    "marker_open_tree" : '▾'
             \}

"PHP Completion
NeoBundle 'sebastiankessler/phpcomplete.vim'

"Omnicomplete on ctrl space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
        \ "\<lt>C-n>" :
        \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
        \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
        \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

"I always press F1 by mistake instead of escape
function! MapF1()
  if &buftype == "help"
    exec 'quit'
  else
    exec 'help'
  endif
endfunction

"PHP Refactor
NeoBundle 'vim-php/vim-php-refactoring'
" path to https://github.com/QafooLabs/php-refactoring-browser bin
let g:php_refactor_command='php ~/Git/php-refactoring-browser/refactor.phar'

"PHP Documentor
NeoBundle 'vim-scripts/PDV--phpDocumentor-for-Vim'
inoremap <leader>d <ESC>:call PhpDocSingle()<CR>i
nnoremap <leader>d :call PhpDocSingle()<CR>
vnoremap <leader>d :call PhpDocRange()<CR>

"Tags - for autocompletion and jumping to functions.
NeoBundle 'vim-scripts/taglist.vim'
set tags=tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"Open Taglist for file and select the window.
nnoremap <leader>t :TlistToggle<CR><C-W>h

"Editor config
NeoBundle 'editorconfig/editorconfig-vim'
command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>

"PHP QA stuff - requires mess detector and codesniffer to be instealled.
NeoBundle 'joonty/vim-phpqa'
let g:phpqa_messdetector_cmd = "~/Git/phpmd/phpmd" "path to mess detector bin
let g:phpqa_messdetector_ruleset = "~/Git/phpmd/rules.xml" "mess detector ruleset

"move temp files to temp directory
"set dir=~/.vimswap//,/var/tmp//,/tmp//,.
set noswapfile
set nobackup

