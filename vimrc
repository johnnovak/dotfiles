"=============================================================================
" Vundle
"=============================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has('win32') || has('win64')
  set rtp+=~/vimfiles/bundle/vundle/
  call vundle#rc('$HOME/vimfiles/bundle/')
else
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
endif

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" colorschemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'dsolstad/vim-wombat256i'
Bundle 'tomasr/molokai'
Bundle 'croaker/mustang-vim'
Bundle 'jnurmine/Zenburn'
Bundle 'chriskempson/vim-tomorrow-theme'

" plugins
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'pangloss/vim-javascript'

"Bundle 'mbbill/undotree'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'spf13/vim-autoclose'
"Bundle 'majutsushi/tagbar'

filetype plugin indent on     " required


"=============================================================================
" General settings
"=============================================================================

set history=100	        " keep 100 lines of command line history

let mapleader=","       " set leader

"=== File handling ===========================================================

set backup              " keep a backup file
set undofile            " create undo files
set autoread            " automatically read a file that has changed on disk

" TODO use $VIM_HOME
"set backupdir^=~/.vim/_backup//    " where to put backup files.
"et directory^=~/.vim/_temp//      " where to put swap files.

"=== Encoding ================================================================

set encoding=utf-8      " use utf-8 encoding by default
set termencoding=utf-8
set fileencoding=utf-8
setglobal fileencoding=utf-8

"=== Appearance ==============================================================

syntax on               " switch syntax highlighting on
set synmaxcol=2048      " don't syntax highlight very long lines

set fillchars+=vert:\   " get rid of vertical window separator characters

set colorcolumn=78      " display max width marker
set lazyredraw          " don't update the display while executing macros

set ruler               " show the cursor position all the time
set laststatus=2        " always display status line
set showcmd	            " display incomplete commands
set cmdheight=2         " 2 line high command prompt

if $TERM == 'xterm-color-256'
  set background=dark     " use the dark 'lucius' theme
  colorscheme lucius
endif

"=== Navigation =============================================================

set scrolloff=8         " keep the cursor 8 lines from the top and bottom when
                        " the page scrolls

"=== Searching ===============================================================

set incsearch           " do incremental searching
set hlsearch            " switch on highlighting the last used search pattern
set ignorecase          " searches are case insensitive...
set smartcase           " ... unless they contain at least one capital letter

set wildmenu            " make the command-line completion better

" disable output and vcs files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" ignore bundler and sass cache
set wildignore+=*/.bundle/*,*/.sass-cache/*

" disable temp and backup files
set wildignore+=*.swp,*~,._*

"=== Whitespaces =============================================================
set expandtab           " use 4 spaces for tabs
set softtabstop=4
set shiftwidth=4
set tabstop=4

" TODO
set nowrap
set list                    " show invisible characters

" List chars
set listchars=""            " reset the listchars
set listchars=tab:\ \       " show tabs as two spaces
set listchars+=trail:.      " show trailing spaces as dots
set listchars+=extends:>    " display '>' if the line continues to the right
set listchars+=precedes:<   " display '<' if the line continues to the left

"=== Editing =================================================================

set backspace=indent,eol,start  " backspace through everything in insert mode

set autoindent          " always set autoindenting on

set timeoutlen=2000     " timeout on mappings after 1 second
set ttimeoutlen=0       " avoid the need to press ESC twice when in terminal

set foldmethod=syntax   " default folding is one level, by syntax
set foldnestmax=1
set foldlevel=1

"=== Diff ====================================================================

set diffopt+=iwhite     " add ignorance of whitespace to diff
set diffopt+=vertical   " open diff windows as a vertical split


"=============================================================================
" Plugin settings
"=============================================================================

" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_theme="powerlineish"

" Nerdtree
let g:NERDTreeIgnore=['\~$', '\.pyc']

" Ctrl-P
map <C-K> :CtrlPBuffer<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

" neocachecompl
let g:acp_enableAtStartup = 0               " disable AutoComplPop.
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" NERDCommenter
let NERDCommentWholeLinesInVMode=1


"=============================================================================
" Shortcuts & macros
"=============================================================================

" General
"-----------------------------------------------------------------------------
" window navigation
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" shrink/expand Windows
"map - <C-W>-
"map + <C-W>=
"map = <C-W>+
"map <C-N> <C-W>>
"map <C-M> <C-W><

" turn off highlight search
nmap <silent> ,n :nohls<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" display the syntax highlighting group of the element under the cursor
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" fugitive shortcuts
"-----------------------------------------------------------------------------
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gp :Git push<CR>

" neocachecompl
"-----------------------------------------------------------------------------
" define keyword pattern
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

" <TAB>: completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h>  neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><BS>   neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Tabularize
"-----------------------------------------------------------------------------
map <leader>a=  :Tabularize /=<CR>
map <leader>a:  :Tabularize /:<CR>
map <leader>a:: :Tabularize /:\zs<CR>
map <leader>a,  :Tabularize /,<CR>

"=============================================================================
" Filetype settings
"=============================================================================

" Some file types should wrap their text
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction
