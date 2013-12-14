set nocompatible               
filetype off                  
set term=xterm-256color
set t_Co=256
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"Bundle 'tpope/vim-fugitive'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'walm/jshint.vim'

" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key 
function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction


Bundle 'L9'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'FuzzyFinder'
Bundle 'junegunn/seoul256.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/UltiSnips'
Bundle 'matthewsimo/angular-vim-snippets'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

" Optional:
Bundle "honza/vim-snippets"

map <Down> <C-W>j
map <Up> <C-W>k
map <Left> <C-W>h
map <Right> <C-W>l

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

let g:UltiSnipsExpandTrigger = '<c-l>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsListSnippets = '<c-m>'
