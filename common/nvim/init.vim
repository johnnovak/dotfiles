lua require('plugins')
"lua require('lualine').setup()

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


"=============================================================================
" General Settings:
"=============================================================================

let mapleader=","       " set leader

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

set list                    " show invisible characters
set listchars=""            " reset the listchars
set listchars=tab:\ \       " show tabs as two spaces
set listchars+=trail:·      " show trailing spaces as dots
set listchars+=extends:»    " display '»' if the line continues to the right
set listchars+=precedes:«   " display '«' if the line continues to the left
"set listchars+=eol:↩        " show newline characters a '¶'

set timeoutlen=500          " set timeout on mappings


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

set termguicolors       " enable true color
set synmaxcol=500       " don't syntax highlight very long lines
set colorcolumn=+0      " display margin at 'textwidth'
set lazyredraw          " don't update the display while executing macetos

colorscheme lux

set noshowmode          " don't show mode indicator in status line

set statusline=[%n]                   " buffer number
set statusline+=\ %<%.99f             " filename
set statusline+=\ %h                  " help buffer flag
set statusline+=%w                    " preview window flag
set statusline+=%m                    " modified flag
set statusline+=%r                    " readonly flag
set statusline+=%=%-12(\ %l:%c%V\ %)  " line:column
set statusline+=%P\                   " percentage

"=============================================================================
" Plugin settings
"=============================================================================

" vim-tmux-navigator
"-----------------------------------------------------------------------------
" disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" fern
"-----------------------------------------------------------------------------
let g:fern#renderer = "nerdfont"

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

let g:fern#renderer#nerdfont#leading = "  "

"=============================================================================
" Shortcuts & macros
"=============================================================================

" fast escape
inoremap jk <Esc>
cnoremap jk <C-c>

" enter command mode with one keystroke
nnoremap ; :

" quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e  $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" toggle fold
vnoremap <space> za

" buffer handling
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :bd<CR>

" write file
nnoremap <leader>w :w<CR>

" turn off highlight search
nnoremap <silent> ,/ :nohls<CR>

" uppercase/lowercase word
nnoremap <leader>U mQviwU`Q
nnoremap <leader>u mQviwu`Q

" set text wrapping toggles
nnoremap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" display the syntax highlighting group of the element under the cursor
nnoremap <silent> ,hh :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
  \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
  \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
  \ . ">"<CR>

" format current paragraph
vnoremap ,f gq
nnoremap ,f gqap

" format JSON
nnoremap <leader>jf :%!python -m json.tool<CR>
vnoremap <leader>jf :%!python -m json.tool<CR>

" Insert current date and time in ISO format
:nnoremap <silent> <F5> "=strftime("%Y-%m-%d %H:%M:%S")<CR>P
:inoremap <silent> <F5> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

nnoremap <silent> <leader>t2 :%s;^\(\s\+\);\=repeat(' ', len(submatch(0))/2);g<CR>
      \ :nohlsearch<CR>


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

