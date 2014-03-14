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
Bundle 'Shougo/neocomplete.vim'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'pangloss/vim-javascript'

"Bundle 'mbbill/undotree'
"Bundle 'spf13/vim-autoclose'
"Bundle 'majutsushi/tagbar'

filetype plugin indent on     " required


"=============================================================================
" General settings
"=============================================================================

set history=100	        " keep 100 lines of command line history

let mapleader=","       " set leader

set t_ti=7[r[?47h     " restore contents of terminal window on exit
set t_te=[?47l8

if has('mouse')         " enable mouse
  set mouse=a
endif

"=== File handling ===========================================================

set backup              " keep a backup file
set undofile            " create undo files
set autoread            " automatically read a file that has changed on disk

set backupdir^=$HOME/.vim/_backup//    " where to put backup files.
set directory^=$HOME/.vim/_temp//      " where to put swap files.

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

if $TERM == 'xterm-256color'
  set background=dark   " use the dark 'lucius' theme if the terminal
  colorscheme lucius    " supports 256 colors
"  colorscheme mustang
"  let g:airline_theme='powerlineish'
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

set wrap                    " wrap lines by default
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

set textwidth=78

"=== Diff ====================================================================

set diffopt+=iwhite     " add ignorance of whitespace to diff
set diffopt+=vertical   " open diff windows as a vertical split


"=============================================================================
" Plugin settings
"=============================================================================

" Airline
"-----------------------------------------------------------------------------
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

" Nerdtree
"-----------------------------------------------------------------------------
let g:NERDTreeIgnore=['\~$', '\.pyc']

" NERDCommenter
"-----------------------------------------------------------------------------
let NERDCommentWholeLinesInVMode=1

" Ctrl-P
"-----------------------------------------------------------------------------
map <C-K> :CtrlPBuffer<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

" neocachecompl
"-----------------------------------------------------------------------------
"let g:acp_enableAtStartup = 0               " disable AutoComplPop.
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" neocomplete
"-----------------------------------------------------------------------------
let g:acp_enableAtStartup = 0               " disable AutoComplPop
let g:neocomplete#enable_at_startup = 1     " use neocomplete
let g:neocomplete#enable_smart_case = 1     " use smartcase

" set minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" define dictionary
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist'
    \ }

" define keyword
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" enable heavy omni completion
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif


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
map _ <C-W>_
map + <C-W>=<CR>
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

" neocomplete
"-----------------------------------------------------------------------------
" plugin key-mappings
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <CR>: close popup and save indent
inoremap <silent> <CR> <C-r>=<SID>neocomplete_cr_func()<CR>
function! s:neocomplete_cr_func()
  "return neocomplete#close_popup() . "\<CR>"
  " for no inserting <CR> key
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Tabularize
"-----------------------------------------------------------------------------
map <leader>a=  :Tabularize /=<CR>
map <leader>a:  :Tabularize /:<CR>
map <leader>a:: :Tabularize /:\zs<CR>
map <leader>a,  :Tabularize /,<CR>

"=============================================================================
" Filetype settings
"=============================================================================

" TODO
function! s:textEdit()
  nmap <silent> j gj
  nmap <silent> k gk
  nmap <silent> 0 g0
  nmap <silent> $ g$
  nmap <silent> ^ g^
  set linebreak
  set virtualedit
endfunction

" enable omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

