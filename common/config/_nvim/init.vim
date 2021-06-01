lua require('plugins')

"=============================================================================
" OS Detection:
"=============================================================================

if !exists("g:os")
  if system('uname -r') =~ "Microsoft"
    let g:os = "wsl"
  elseif has("win64") || has("win32")
    let g:os = "windows"
  elseif has("win32unix")
    let g:os = "cygwin"
  elseif has("macunix")
    let g:os = "osx"
  elseif has("unix")
    let g:os = "linux"
  endif
endif

"=============================================================================
" Disable Default Plugins:
"=============================================================================

let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:loaded_matchit     = 1
let g:loaded_matchparen  = 1
let g:loaded_gzip        = 1
let g:loaded_tarPlugin   = 1
let g:loaded_tar         = 1
let g:loaded_zipPlugin   = 1
let g:loaded_zip         = 1

" {{{ Settings
"
"=============================================================================
" General Settings:
"=============================================================================

let mapleader=","       " set Leader

set shortmess+=I        " hide intro message when starting vim

set backup              " keep a backup file
set undofile            " create undo files
set history=1000        " keep this many lines of command line history
set undolevels=1000     " keep this many undo steps

if has('mouse')         " enable mouse
  set mouse=a
"  set ttymouse=xterm2
endif


"=============================================================================
" Editing:
"=============================================================================

" use 2 spaces for tabs by default
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2

set scrolloff=8             " keep 8 lines visible when scrolling
set textwidth=78

set ignorecase              " searches are case insensitive...
set smartcase               " ...unless they contain capitals
set inccommand=nosplit      " live substitution

set hidden                  " no more nagging on buffer changes

set timeoutlen=300          " set timeout on mappings


"=============================================================================
" Completion:
"=============================================================================

" disable output and vcs files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc

" disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" ignore bundler and sass cache
set wildignore+=*/.bundle/*,*/.sass-cache/*

" disable temp and backup files
set wildignore+=*.swp,*~,._*,.DS_Store


"=============================================================================
" Appearance:
"=============================================================================

set termguicolors           " enable true color
set synmaxcol=500           " don't syntax highlight very long lines
set colorcolumn=+0          " display margin at 'textwidth'
set lazyredraw              " don't update the display while executing macros

set noshowmode              " don't show mode indicator in status line

" show invisible characters
set list
set listchars=""            " reset the listchars
set listchars=tab:\ \       " show tabs as two spaces
set listchars+=trail:·      " show trailing spaces as dots
set listchars+=extends:»    " display '»' if the line continues to the right
set listchars+=precedes:«   " display '«' if the line continues to the left
"set listchars+=eol:↩        " show newline characters a '¶'

" statusline
set statusline=
set statusline+=\ %<%.99f   " filename
set statusline+=\ %h        " help buffer flag
set statusline+=%w          " preview window flag
set statusline+=%m          " modified flag
set statusline+=%r          " readonly flag
set statusline+=%=          " right align
set statusline+=%-12(\ %10l:%-7(%c%V%)\ %)  " line:column-virtualcolumn
set statusline+=%P\         " percentage

hi StatusLine   guifg=bg      guibg=#aaaaaa gui=bold
hi StatusLineNC guifg=#dddddd guibg=#404040
"hi User4 guibg=#884488

colorscheme lux

" }}}

" " {{{ Plugin settings
"
"=============================================================================
" Plugin Settings:
"=============================================================================

" tmux-navigator
"-----------------------------------------------------------------------------
let g:tmux_navigator_disable_when_zoomed = 1

" nvim-tree
"-----------------------------------------------------------------------------
let g:nvim_tree_ignore = [ '.git', 'node_modules' ]
let g:nvim_tree_gitignore = 1

let g:nvim_tree_indent_markers = 1
let g:nvim_tree_hide_dotfiles = 1

let g:nvim_tree_show_icons = {
	\ 'git': 0,
	\ 'folders': 1,
	\ 'files': 1
	\}

let g:nvim_tree_icons = {
    \ 'default':        '',
    \ 'symlink':        '',
    \ 'git': {
    \   'unstaged':     "✗",
    \   'staged':       "✓",
    \   'unmerged':     "",
    \   'renamed':      "➜",
    \   'untracked':    "★",
    \   'deleted':      "",
    \  },
    \ 'folder': {
    \   'default':      "",
    \   'open':         "",
    \   'empty':        "",
    \   'empty_open':   "",
    \   'symlink':      "",
    \   'symlink_open': "",
    \  },
    \  'lsp': {
    \    'hint': "",
    \    'info': "",
    \    'warning': "",
    \    'error': "",
    \  }
    \}

" vim-markdown
"-----------------------------------------------------------------------------
let g:vim_markdown_folding_level = 6
let g:vim_markdown_override_foldtext = 1

" }}}

" {{{ Mappings
"
"=============================================================================
" Mappings
"=============================================================================

" fast escape
inoremap jk <Esc>
cnoremap jk <C-c>

" enter command mode with one keystroke
nnoremap ; :

" quickly edit/reload the vimrc file
nnoremap <silent> <Leader>ev :e  $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :so $MYVIMRC<CR>

" jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" toggle fold
vnoremap <space> za

" buffer handling
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>

" write file
nnoremap <Leader>w :w<CR>

" turn off highlight search
nnoremap <silent> ,/ :nohls<CR>

" uppercase/lowercase word
nnoremap <Leader>U mQviwU`Q
nnoremap <Leader>u mQviwu`Q

" set text wrapping toggles
nnoremap <silent> <Leader>tw :set invwrap<CR>:set wrap?<CR>

" display the syntax highlighting group of the element under the cursor
nnoremap <silent> ,hh :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
  \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
  \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
  \ . ">"<CR>

" format current paragraph
vnoremap ,f gq
nnoremap ,f gqap

" format JSON
nnoremap <Leader>jf :%!python -m json.tool<CR>
vnoremap <Leader>jf :%!python -m json.tool<CR>

" Insert current date and time in ISO format
:nnoremap <silent> <F5> "=strftime("%Y-%m-%d %H:%M:%S")<CR>P
:inoremap <silent> <F5> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

nnoremap <silent> <Leader>t2 :%s;^\(\s\+\);\=repeat(' ', len(submatch(0))/2);g<CR>
      \ :nohlsearch<CR>

" built-in fuzzy open file
nnoremap <C-p>     :e **/*
nnoremap <Leader>v :vsplit **/*
nnoremap <Leader>s :split **/*

" nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-f> :NvimTreeFindFile<CR>

" }}}

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
autocmd FileType css,scss,html,xhtml,htmldjango,markdown,javascript,vim,nim,python
  \ setlocal ts=2 sw=2 sts=2

" wrap python comments at 72 chars
autocmd FileType python setlocal textwidth=72

" autodetect Go templates
function DetectGoHtmlTmpl()
  if expand('%:e') == "html" && search("{{") != 0
    set filetype=gohtmltmpl
  endif
endfunction

augroup filetypedetect
  au! BufRead,BufNewFile * call DetectGoHtmlTmpl()
augroup END

"=============================================================================
" Custom toggles
"=============================================================================

set pastetoggle=<F2>      " toggle paste mode

" TODO this is buggy, fix it
nnoremap <Leader>te :call VirtualEditToggle()<CR>

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


" System clipboard integration
"-----------------------------------------------------------------------------
" map Ctrl-x/c/v to use the system clipboard on Linux, Cygwin & Windows
if g:os == 'linux' || g:os == 'windows' || g:os == 'cygwin'
  vnoremap <C-x> "+x
  vnoremap <C-c> "+y
  noremap  <C-v> "+gP
  inoremap <C-v> <C-r>+

  " remap block mode from Ctrl-v to Ctrl-q
  noremap <C-q> <C-v>

elseif g:os == 'wsl'
  augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe ',@")
    augroup END

" Using the system clipboard when running inside tmux on OS X doesn't work
" in root mode, so only enable clipboard support on OS X for normal users
" (unfortunately there doesn't seem to be a way to detect if we're running
" inside a tmux session when vim is launched with sudo)
elseif g:os == 'osx' && system('id -u') > 0
  set clipboard=unnamed

endif

" vim: fdm=marker
