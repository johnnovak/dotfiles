"=============================================================================
" Vundle
"=============================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has('win32') || has('win64')
  set rtp+=~/vimfiles/bundle/Vundle.vim
  call vundle#begin('$HOME/vimfiles/bundle/')
else
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'cschlueter/vim-wombat'
Plugin 'dsolstad/vim-wombat256i'
Plugin 'croaker/mustang-vim'
Plugin 'jnurmine/Zenburn'

" plugins
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/neocomplete.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'nvie/vim-togglemouse'

"Plugin 'mbbill/undotree'
"Plugin 'spf13/vim-autoclose'
"Plugin 'majutsushi/tagbar'

call vundle#end()           " required
filetype plugin indent on   " required

"=============================================================================
" General settings
"=============================================================================

set shortmess+=I          " hide intro message when starting vim

set history=1000          " keep this many lines of command line history
set undolevels=1000       " keep this many undo steps

let mapleader = ","       " set leader

"set t_ti=7[r[?47h   " restore contents of terminal window on exit
"set t_te=[?47l8

if has('mouse')           " enable mouse
  set mouse=a
endif

" File handling
"-----------------------------------------------------------------------------
set backup              " keep a backup file
set undofile            " create undo files
set autoread            " automatically read files changed outside of vim

set undodir^=$HOME/.vim/_undo/        " where to put undo files
set backupdir^=$HOME/.vim/_backup/    " where to put backup files
set directory^=$HOME/.vim/_temp//     " where to put swap files

" Encoding
"-----------------------------------------------------------------------------
set encoding=utf-8      " use utf-8 encoding by default
set termencoding=utf-8
set fileencoding=utf-8
setglobal fileencoding=utf-8

" Appearance
"-----------------------------------------------------------------------------
syntax on               " switch syntax highlighting on
set synmaxcol=2048      " don't syntax highlight very long lines

set fillchars+=vert:\   " get rid of vertical window separator characters

set colorcolumn=78      " display max width marker
set lazyredraw          " don't update the display while executing macetos

set ruler               " show the cursor position all the time
set laststatus=2        " always display status line
set showcmd	            " display incomplete commands
set cmdheight=2         " 2 line high command prompt

" use the dark 'lucius' theme if the terminal supports 256 colors
if $TERM == 'xterm-256color'
  let g:lucius_no_term_bg = 1   " make background transparent
  colorscheme lucius
  LuciusDark
endif

" Navigation
"-----------------------------------------------------------------------------
set scrolloff=8         " keep the cursor 8 lines from the top and bottom when
                        " the page scrolls
" Searching
"-----------------------------------------------------------------------------
set incsearch           " enable incremental searching
set hlsearch            " highlight the last used search pattern
set ignorecase          " searches are case insensitive...
set smartcase           " ...unless they contain at least one capital letter

set wildmenu            " improved command-line completion better

" disable output and vcs files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" ignore bundler and sass cache
set wildignore+=*/.bundle/*,*/.sass-cache/*

" disable temp and backup files
set wildignore+=*.swp,*~,._*

" Whitespaces
"-----------------------------------------------------------------------------
set expandtab               " use 4 spaces for tabs
set softtabstop=4
set shiftwidth=4
set tabstop=4
set smarttab

set wrap                    " wrap lines by default

set list                    " show invisible characters
set listchars=""            " reset the listchars
set listchars=tab:\ \       " show tabs as two spaces
set listchars+=trail:·      " show trailing spaces as dots
set listchars+=extends:»    " display '»' if the line continues to the right
set listchars+=precedes:«   " display '«' if the line continues to the left
"set listchars+=eol:¶        " show newline characters a '¶'

" Editing
"-----------------------------------------------------------------------------
set backspace=indent,eol,start  " backspace through everything in insert mode

set autoindent          " always set autoindenting on

set timeoutlen=500      " set timeout on mappings
set ttimeoutlen=0       " avoid the need to press ESC twice when in terminal

set foldmethod=syntax   " default folding is one level, by syntax
set foldnestmax=1
set foldlevel=1

set textwidth=78

set formatoptions+=1    " don't end lines with 1-letter word when wrapping

" Diff
"-----------------------------------------------------------------------------
set diffopt+=iwhite     " add ignorance of whitespace to diff
set diffopt+=vertical   " open diff windows as a vertical split

"=============================================================================
" Plugin settings
"=============================================================================

" Airline
"-----------------------------------------------------------------------------
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep         = ''
let g:airline_left_alt_sep     = ''
let g:airline_right_sep        = ''
let g:airline_right_alt_sep    = ''
let g:airline_symbols.branch   = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr   = ''

" NERDTree
"-----------------------------------------------------------------------------
let g:NERDTreeIgnore = ['\~$', '\.pyc']

" NERDCommenter
"-----------------------------------------------------------------------------
let NERDCommentWholeLinesInVMode = 1

" Ctrl-P
"-----------------------------------------------------------------------------
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

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
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"if !exists('g:neocomplete#force_omni_input_patterns')
"  let g:neocomplete#force_omni_input_patterns = {}
"endif

"=============================================================================
" Shortcuts & macros
"=============================================================================

" General
"-----------------------------------------------------------------------------
inoremap jk <Esc>

" enter command mode with one keystroke
nnoremap ; :

" quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" map Ctrl-x/c/v to use the system clipboard on Linux and Windows
if (has('unix') && !has('macunix'))
      \ || (has('win32') || has('win64') || has('win32unix'))

  vnoremap <C-x> "+x
  vnoremap <C-c> "+y
  noremap <C-v> "+gP
  inoremap <C-v> <C-r>+

  " remap block mode from Ctrl-v to Ctrl-q
  noremap <C-q> <C-v>
endif

" use ,d to delete a line without yanking it
vnoremap <silent> <leader>d "_d

" jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" folding
nnoremap <Space> za
vnoremap <Space> za

" strip all trailing whitespace from a file, using ,W
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" window navigation (now handled by TmuxNavigate*)
"noremap <C-w> <C-w>h
"noremap <C-w> <C-w>j
"noremap <C-w> <C-w>k
"noremap <C-w> <C-w>l

" buffer handling
nnoremap <leader>q :bd<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bn<CR>

" shrink/expand Windows
noremap _ <C-w>_
noremap + <C-w>=<CR>
"noremap <C-n> <C-w>>
"noremap <C-m> <C-w><

" turn off highlight search
nnoremap <silent> ,/ :nohls<CR>

" upper/lower word
nnoremap <leader>U mQviwU`Q
nnoremap <leader>u mQviwu`Q

" underline the current line
nnoremap <silent> <leader>l- :t.<CR>Vr-
nnoremap <silent> <leader>l= :t.<CR>Vr=
nnoremap <silent> <leader>l8 :t.<CR>Vr*
nnoremap <silent> <leader>l6 :t.<CR>Vr^

" set text wrapping toggles
nnoremap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" display the syntax highlighting group of the element under the cursor
nnoremap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
  \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
  \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
  \ . ">"<CR>

" format current paragraph
vnoremap ,f gq
nnoremap ,f gqap

" tmux aware navigation shortcuts
"-----------------------------------------------------------------------------
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<CR>

" NERDTree
"-----------------------------------------------------------------------------
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" NERDCommenter
"-----------------------------------------------------------------------------
map <C-_> ,c<Space>

" fugitive shortcuts
"-----------------------------------------------------------------------------
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gp :Git push<CR>

" Ctrl-P
"-----------------------------------------------------------------------------
noremap <C-p> :CtrlPBuffer<CR>

" neocomplete
"-----------------------------------------------------------------------------
" plugin key-mappings
inoremap <expr><C-g>  neocomplete#undo_completion()
inoremap <expr><C-l>  neocomplete#complete_common_string()

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
inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Tabularize
"-----------------------------------------------------------------------------
noremap <silent> <leader>a=  :Tabularize /=<CR>
noremap <silent> <leader>a:  :Tabularize /:<CR>
noremap <silent> <leader>a:: :Tabularize /:\zs<CR>
noremap <silent> <leader>a,  :Tabularize /,<CR>
noremap <silent> <leader>as  :Tabularize / /l0<CR>

"=============================================================================
" Filetype settings
"=============================================================================

" enable omni completion
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags

" filetypes with tabwidth of 2
autocmd FileType css,scss,html,xhtml,htmldjango,vim,markdown,python,javascript
  \ setlocal ts=2 sw=2 sts=2

" wrap python comments at 72 chars
autocmd FileType python setlocal textwidth=72

"=============================================================================
" Custom toggles
"=============================================================================

set pastetoggle=<F2>      " toggle paste mode

nnoremap <leader>te :call VirtualEditToggle()<CR>

let g:virtualedit_is_on = 0

function! VirtualEditToggle()
  if g:virtualedit_is_on
    nnoremap <silent> j j
    nnoremap <silent> k k
    nnoremap <silent> 0 0
    nnoremap <silent> $ $
    nnoremap <silent> ^ ^
    set list
    set nolinebreak
    set virtualedit=""
    let g:virtualedit_is_on = 0
  else
    nnoremap <silent> j gj
    nnoremap <silent> k gk
    nnoremap <silent> 0 g0
    nnoremap <silent> $ g$
    nnoremap <silent> ^ g^
    set nolist
    set linebreak
    set virtualedit=all
    let g:virtualedit_is_on = 1
  endif
endfunction

" sudo write
cmap w!! w !sudo tee % >/dev/null

" review: https://raw.githubusercontent.com/nvie/vimrc/master/vimrc
