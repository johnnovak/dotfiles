lua require('plugins')

"=============================================================================
" Disable Default Plugins:
"=============================================================================

let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
" let g:loaded_matchparen  = 1
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

set shortmess+=IS       " hide intro message when starting vim

set backup              " keep a backup file
set undofile            " create undo files
set history=1000        " keep this many lines of command line history
set undolevels=1000     " keep this many undo steps

if has('mouse')         " enable mouse
  set mouse=a
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

set timeoutlen=500          " set timeout on mappings

set clipboard+=unnamedplus  " enable system clipboard integration

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

set foldlevel=999           " open all folds by default

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
set statusline+=\ %<%.99f   " relative file path (use 't' for filename only)
set statusline+=\ %h        " help buffer flag
set statusline+=%w          " preview window flag
set statusline+=%m          " modified flag
set statusline+=%r          " readonly flag
set statusline+=%=          " right align
set statusline+=%-12(\ %10l:%-7(%c%V%)\ %)  " line:column-virtualcolumn
set statusline+=%P\         " percentage

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
let g:nvim_tree_indent_markers = 1

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

" matchit
"-----------------------------------------------------------------------------
runtime macros/matchit.vim

" nvim-compe
"-----------------------------------------------------------------------------
set completeopt=menuone,noselect

let g:compe = {}
let g:compe.enabled          = v:true
let g:compe.autocomplete     = v:true
let g:compe.debug            = v:false
let g:compe.min_length       = 1
let g:compe.preselect        = 'always'
let g:compe.throttle_time    = 80
let g:compe.source_timeout   = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width   = 100
let g:compe.max_kind_width   = 100
let g:compe.max_menu_width   = 100
let g:compe.documentation    = v:true

let g:compe.source = {}
let g:compe.source.path      = v:true
let g:compe.source.buffer    = v:true
let g:compe.source.calc      = v:true
let g:compe.source.nvim_lsp  = v:true
let g:compe.source.nvim_lua  = v:true
let g:compe.source.vsnip     = v:true
let g:compe.source.ultisnips = v:true

" }}}

" {{{ Mappings
"
"=============================================================================
" Mappings
"=============================================================================

" built-ins
"-----------------------------------------------------------------------------
" fast escape
inoremap jk <Esc>
cnoremap jk <C-c>

" enter command mode with one keystroke
nnoremap ; :
vnoremap ; :

" quickly edit/reload the vimrc file
nnoremap <silent> <Leader>ev :e  $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :so $MYVIMRC<CR>
nnoremap <silent> <Leader>ep :e  ~/.config/nvim/lua/plugins.lua<CR>

" jump to matching pairs easily, with Tab
map    <Tab> %
map  <S-Tab> g%
vmap   <Tab> %
vmap <S-Tab> g%

" toggle fold
nnoremap <Space> za

" buffer handling
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>d :Bdelete<CR>

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
nnoremap <Leader>jf gqad<CR>
vnoremap <Leader>jf :%!python -m json.tool<CR>

" Insert current date and time in ISO format
nnoremap <silent> <F5> "=strftime("%Y-%m-%d %H:%M:%S")<CR>P
inoremap <silent> <F5> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

nnoremap <silent> <Leader>t2 :%s;^\(\s\+\);\=repeat(' ', len(submatch(0))/2);g<CR>
      \ :nohlsearch<CR>

" trim trailing whitespace
function! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfunction

nnoremap <silent> ,W :call TrimWhitespace()<CR>

" CtrlP
"-----------------------------------------------------------------------------
let g:ctrlp_cmd = 'CtrlPMixed'

" use fd to speed up ctrlp if available
if executable('fd')
  let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
  let g:ctrlp_use_caching = 0
endif

" nvim-tree
"-----------------------------------------------------------------------------
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-f> :NvimTreeFindFile<CR>

" nvim-compe
"-----------------------------------------------------------------------------
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <Tab>     compe#confirm('<Tab>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" }}}

"=============================================================================
" Filetype settings
"=============================================================================

" filetypes with tabwidth of 2
autocmd FileType css,scss,html,xhtml,htmldjango,markdown,javascript,vim,nim,python
  \ setlocal ts=2 sw=2 sts=2

" wrap python comments at 72 chars
autocmd FileType python setlocal textwidth=72

" autodetect Go templates
function! DetectGoHtmlTmpl()
  if expand('%:e') == "html" && search("{{") != 0
    set filetype=gohtmltmpl
  endif
endfunction

augroup GoFileTypeDetect
  au! BufRead,BufNewFile *  call DetectGoHtmlTmpl()
augroup END

augroup GridmongerThemeFileTypeDetect
  au! BufNewFile,BufRead *.gmtheme  set syntax=hocon
augroup END

augroup GridmongerTheme
  au! BufRead,BufNewFile *.gmtheme set filetype=dosini
augroup END


" vim: fdm=marker
