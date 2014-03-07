"=============================================================================
" GENERAL
"=============================================================================
set nocompatible    " use Vim mode
set modeline        " Allow file specific Vim settings

set backspace=indent,eol,start  " allow backspacing in insert mode

set backup		    " keep a backup file
set undofile        " create undo files
set history=100	    " keep 100 lines of command line history

set showcmd		    " display incomplete commands
set incsearch	    " do incremental searching

"set autoindent      " always set autoindenting on
set cindent         " use C indenting

set wildmenu        " make the command-line completion better

set diffopt+=iwhite     " ignore whitespaces in diff mode
set diffopt=vertical    " use vertical splits in diff mode

set autoread        " automatically read a file that has changed on disk

" Timeout on mappings after 1 second
set timeoutlen=1000

" Avoid the need to press ESC twice when running in terminal mode
set ttimeoutlen=0

"set hidden                 " Keep changed buffers without requiring saves

"set virtualedit=all " allow the cursor to go in to "invalid" places

filetype plugin on
filetype indent on

set shellslash      " use forward slashes in path names on Windows

" default folding is one level by syntax
set foldmethod=syntax
set foldnestmax=1
set foldlevel=1

" default tab settings (4 spaces)
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4



" use UTF8 encoding by default
set encoding=utf8
set fileencoding=utf8

set ignorecase
set smartcase

set gdefault

" system default for mappings is now the "," character
let mapleader=","

"=============================================================================
" PLUGINS
"=============================================================================

" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_theme = "powerlineish"

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" NERDTree
let g:NERDTreeIgnore=['\.vim$', '\~$', '\.pyc']

"=============================================================================
" COLORS & APPEAREANCE
"=============================================================================
set synmaxcol=2048  " don't syntax highlight overly longs lines
syntax on           " switch syntax highlighting on

set ruler		    " show the cursor position all the time

set cmdheight=2     " use 2 line high command prompt
set laststatus=2    " always display status line

set hlsearch        " switch on highlighting the last used search pattern
set colorcolumn=80  " display max width marker
set lazyredraw      " don't update the display while executing macros
set scrolloff=8     " keep the cursor 8 lines from the top and bottom when
                    " the page scrolls

set fillchars+=vert:\   " get rid of vertical window separator characters

set background=dark

let g:lucius_contrast='high'
colorscheme lucius

set ttyfast

"colorscheme railscasts
"colorscheme zellner
"colorscheme jellybeans
"colorscheme mustang

"=============================================================================
" MACROS & SHORTCUTS
"=============================================================================
" shortcuts to move between window
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Make window controls easy
nnoremap <leader>w <C-w>

" fix moving line by line in the paragraph, when soft wrap is on
" nnoremap j gj
" nnoremap k gk
" vnoremap j gj
" vnoremap k gk

" shortcuts to shrink/expand windows
map - <C-W>-
map + <C-W>=
map = <C-W>+
map <C-N> <C-W><
map <C-M> <C-W>>

" use TAB to match parens
nnoremap <tab> %
vnoremap <tab> %

" turn off highlight search
nmap <silent> ,n :nohls<CR>

" return the syntax highlighting group of the element under the cursor
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" HTML escape/unescape (visual mode only)
function HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
endfunction

function HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction

vmap <silent> <c-h> :call HtmlEscape()<CR>
vmap <silent> <c-u> :call HtmlUnEscape()<CR>

" Highlight potentially unwanted whitespaces
"highlight BadWhitespace term=standout ctermbg=red guibg=red
"match BadWhitespace /[^* \t]\zs\s\+$\| \+\ze\t/

