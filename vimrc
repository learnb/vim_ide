
"""""""""""""""""""""""
"    Vim as an IDE    "
" author: Bryan Learn "
"""""""""""""""""""""""

"""""""""""""""""""
" Vim Configuration
"""""""""""""""""""
" Basic Settings
    set nocompatible
    syntax on
    filetype plugin indent on
    
    set backspace=indent,eol,start " better backspacing
    set nowrap
    set encoding=utf8

" Colors
    colorscheme elflord       " awesome colorscheme

" Spaces and Tabs
    syntax enable       " enable syntax processing
    set tabstop=4       " number of visual spaces per TAB
    set softtabstop=4   " number of spaces in tab when editing
    set expandtab       " tabs are spaces

" UI
    set number              " show line numbers
    set showcmd             " show command in bottom bar
    set cursorline          " highlight current line
    filetype indent on      " load filetype-specific indent files
    set wildmenu            " visual autocomplete for command menu
    set lazyredraw          " redraw only when we need to.
    set showmatch           " highlight matching [{()}]


" Searching
    "set incsearch           " search as characters are entered
    set hlsearch            " highlight matches
    " turn off search highlight
    "nnoremap <leader><space> :nohlsearch<CR>
    
    " Movement
    " move vertically by visual line
    nnoremap j gj
    nnoremap k gk
    " move to beginning/end of line
    nnoremap B ^
    nnoremap E $
    
    " $/^ doesn't do anything
    nnoremap $ <nop>
    nnoremap ^ <nop>

""""""""""""""""""""""
" Plugin Configuration
""""""""""""""""""""""

" Pathogen Configuration (plugin manager)
    execute pathogen#infect()
    execute pathogen#helptags()


" NERDTree
    nmap <F5> :NERDTreeToggle<CR>

" Tagbar
    nmap <F8> :TagbarToggle<CR>

" Interactive Shell - terminal (Native ViM)
    nmap <F6> :terminal ++rows=10<CR>
    set splitbelow      " make Terminal open on bottom of screen
    set winheight=6    " set desired height for Terminal window

""""""""""""""""
" Terminal fixes
""""""""""""""""
"
" source: https://stackoverflow.com/questions/31651762/what-is-wrong-with-this-mapping-vim-starts-in-replace-mode
" These originate from some linux distribution's system vimrc.
" I've had problems like vim starting in REPLACE mode for TERM=xterm-256color
    
    if &term =~? 'xterm'
        let s:myterm = 'xterm'
    else
        let s:myterm =  &term
    endif
    let s:myterm = substitute(s:myterm, 'cons[0-9][0-9].*$',  'linux', '')
    let s:myterm = substitute(s:myterm, 'vt1[0-9][0-9].*$',   'vt100', '')
    let s:myterm = substitute(s:myterm, 'vt2[0-9][0-9].*$',   'vt220', '')
    let s:myterm = substitute(s:myterm, '\\([^-]*\\)[_-].*$', '\\1',   '')
    
    " Here we define the keys of the NumLock in keyboard transmit mode of xterm
    " which misses or hasn't activated Alt/NumLock Modifiers.  Often not defined
    " within termcap/terminfo and we should map the character printed on the keys.
    if s:myterm ==? 'xterm' || s:myterm ==? 'kvt' || s:myterm ==? 'gnome'
        " keys in insert/command mode.
        map! <ESC>Oo  :
        map! <ESC>Oj  *
        map! <ESC>Om  -
        map! <ESC>Ok  +
        map! <ESC>Ol  ,
        map! <ESC>OM  
        map! <ESC>Ow  7
        map! <ESC>Ox  8
        map! <ESC>Oy  9
        map! <ESC>Ot  4
        map! <ESC>Ou  5
        map! <ESC>Ov  6
        map! <ESC>Oq  1
        map! <ESC>Or  2
        map! <ESC>Os  3
        map! <ESC>Op  0
        map! <ESC>On  .
        " keys in normal mode
        map <ESC>Oo  :
        map <ESC>Oj  *
        map <ESC>Om  -
        map <ESC>Ok  +
        map <ESC>Ol  ,
        map <ESC>OM  
        map <ESC>Ow  7
        map <ESC>Ox  8
        map <ESC>Oy  9
        map <ESC>Ot  4
        map <ESC>Ou  5
        map <ESC>Ov  6
        map <ESC>Oq  1
        map <ESC>Or  2
        map <ESC>Os  3
        map <ESC>Op  0
        map <ESC>On  .
    endif

