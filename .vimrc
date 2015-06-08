set nocompatible

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Required:
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundle 'vim-php/vim-php-refactoring'
NeoBundle 'vim-scripts/PDV--phpDocumentor-for-Vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'sebastiankessler/phpcomplete.vim'
"vim signature - mark helper
NeoBundle 'kshenoy/vim-signature'

"typescript
NeoBundle 'clausreinke/typescript-tools'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'walm/jshint.vim'
NeoBundle 'maksimr/vim-jsbeautify'

NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'joonty/vdebug.git'
"Essentials
NeoBundle 'L9'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'Valloric/ListToggle'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'vim-scripts/taglist.vim'

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

NeoBundle 'joonty/vim-phpqa'
NeoBundle 'vim-scripts/EasyGrep'

"Undo
NeoBundle 'sjl/gundo.vim'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'nanotech/jellybeans.vim'
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end()

filetype plugin indent on


"Colours
set term=xterm-256color
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

set wildmenu
set wildmode=list:longest,full

"Remove trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

"Make F1 toggle help
inoremap <F1> <Esc>
noremap <F1> :call MapF1()<CR>

function! MapF1()
  if &buftype == "help"
    exec 'quit'
  else
    exec 'help'
  endif
endfunction

nnoremap <leader>u :GundoToggle<CR>

"Ultisnips
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

"Searching for things / files
let g:EasyGrepFilesToExclude = "tags,*.git\*"


au BufRead,BufNewFile *.ts        setlocal filetype=typescript
set rtp+=/usr/local/lib/node_modules/typescript-tools/
if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']


"javascript related stuff
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

map <c-f> :call JsBeautify()<cr>
nnoremap <leader>td :TernDef<CR>
nnoremap <leader>tds :TernDefSplit<CR>
nnoremap <leader>tt :TernType<CR>
nnoremap <leader>tpd :TernDefPreview<CR>
nnoremap <leader>tr :TernRefs<CR>
nnoremap <leader>rr :TernRename<CR>

"Run JSHint on save (requires JSHint to be installed).
autocmd! BufWritePost *.js JSHint

"Remap the arrow keys to change windows.
map <Up> <C-W>k
map <Down> <C-W>j
map <Left> <C-W>h
map <Right> <C-W>l

"For debugging in PHP
"xdebug config for php (match port in php.ini)
 let g:vdebug_options= {
             \    "port" : 9000,
             \    "server" : '',
             \    "timeout" : 20,
             \    "on_close" : 'detach',
             \    "break_on_open" : 1,
             \    "ide_key" : '',
             \    "path_maps" : {
             \      '/app' : '/Users/beneppel/Git/moj/opg-core-back-end'
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

"Omnicomplete on ctrl space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
        \ "\<lt>C-n>" :
        \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
        \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
        \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

"YouCompleteMe
" NeoBundle 'Valloric/YouCompleteMe'

"PHP Refactor
" path to https://github.com/QafooLabs/php-refactoring-browser bin
let g:php_refactor_command='php ~/Git/php-refactoring-browser/refactor.phar'

"PHP Documentor
inoremap <leader>d <ESC>:call PhpDocSingle()<CR>i
nnoremap <leader>d :call PhpDocSingle()<CR>
vnoremap <leader>d :call PhpDocRange()<CR>

"Tags - for autocompletion and jumping to functions.
set tags=tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Editor config
command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>

"PHP QA stuff - requires mess detector and codesniffer to be instealled.
let g:phpqa_messdetector_cmd = "~/Git/phpmd/phpmd" "path to mess detector bin
let g:phpqa_messdetector_ruleset = "~/Git/phpmd/rules.xml" "mess detector ruleset

"move temp files to temp directory
"set dir=~/.vimswap//,/var/tmp//,/tmp//,.
set noswapfile
set nobackup
