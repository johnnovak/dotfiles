" ============================================================================
" Name:     Lux
" Author:   John Novak <john@johnnovak.net>
" Version:  0.1.0
" ----------------------------------------------------------------------------
"
" Based on the LuciusDark preset of the Johathan Filip's excellent Lucius
" color scheme.
"
" https://github.com/jonathanfilip/lucius
" https://github.com/jonathanfilip/vim-lucius
"
"
" g:lux_use_bold (default: 1)
"
" Setting this will cause the color scheme to use bold fonts for some items.
"
" g:lux_use_underline (default: 1)
"
" Setting this will cause the color scheme to use underlined fonts for some
" items.
"
" g:lux_no_term_bg (default: 0)
"
" Setting this will cause the color scheme to not set a background color in
" the terminal (useful for transparency or terminals with different background
" colors).
"
" ============================================================================



" ============================================================================
" Options:
" ============================================================================

unlet! g:colors_name
hi clear
if exists("syntax_on")
  syntax reset
endif

if exists("g:lux_use_bold")
  let s:use_bold = g:lux_use_bold
else
  let s:use_bold = 1
endif

if exists("g:lux_use_underline")
  let s:use_underline = g:lux_use_underline
else
  let s:use_underline = 1
endif

if exists("g:lux_no_term_bg")
  let s:no_term_bg = g:lux_no_term_bg
else
  let s:no_term_bg = 0
endif


" ============================================================================
" Text Groups:
" ============================================================================

let s:normal_items = [
  \ "ColorColumn", "Comment", "Conceal", "Constant", "Cursor", "CursorColumn",
  \ "CursorIM", "CursorLine", "CursorLineNr", "DiffAdd", "DiffChange",
  \ "DiffDelete", "Directory", "Error", "ErrorMsg", "Identifier",
  \ "IncSearch", "LineNr", "MatchParen", "ModeMsg", "MoreMsg",
  \ "NonText", "Pmenu", "PmenuSbar", "PmenuSel",
  \ "PmenuThumb", "PreProc", "Question", "Search", "SignColumn",
  \ "Special", "SpecialKey", "Statement", "StatusLineNC", "TabLine",
  \ "TabLineFill", "Todo", "Type", "VertSplit", "Visual",
  \ "WarningMsg", "WildMenu",
  \ ]

let s:bold_items = [
  \ "DiffText", "FoldColumn", "Folded", "StatusLine", "TabLineSel",
  \ "Title", "CursorLineNr",
  \ ]

let s:underline_items = [
  \ "Underlined", "VisualNOS"
  \ ]

let s:undercurl_items = [
  \ "SpellBad", "SpellCap", "SpellLocal", "SpellRare"
  \ ]


" ============================================================================
" Color Definitions:
" ============================================================================

" ----------------------------------------------------------------------------
" Normal Colors:
" ----------------------------------------------------------------------------

hi clear Normal
hi Normal gui=none cterm=none term=none

hi Normal       guifg=#d7d7d7
hi Normal       guibg=#2d2d2d


" ----------------------------------------------------------------------------
" Extra Setup:
" ----------------------------------------------------------------------------

exec "set background=dark"

" Clear default settings
for s:item in s:normal_items + s:bold_items + s:underline_items + s:undercurl_items
  exec "hi " . s:item . " guifg=none guibg=none gui=none"
              \ . " ctermfg=none ctermbg=none cterm=none term=none"
endfor

let g:colors_name="lux"


" ----------------------------------------------------------------------------
" Text Markup:
" ----------------------------------------------------------------------------

hi NonText      guifg=#555580
hi SpecialKey   guifg=#5f875f
hi Comment      guifg=#808080
hi Conceal      guifg=#808080
hi Constant     guifg=#d7d7af
hi Directory    guifg=#afd7af
hi Identifier   guifg=#afd787
hi PreProc      guifg=#87d7af
hi Special      guifg=#d7afd7
hi Statement    guifg=#87d7ff
hi Title        guifg=#5fafd7
hi Type         guifg=#87d7d7


" ----------------------------------------------------------------------------
" Highlighting:
" ----------------------------------------------------------------------------

hi Cursor       guifg=bg
hi CursorColumn guifg=none
hi CursorIM     guifg=bg
hi CursorLine   guifg=none
hi Visual       guifg=none
hi VisualNOS    guifg=fg        guibg=none

hi CursorColumn                 guibg=#383838
hi CursorLine                   guibg=#383838
hi IncSearch    guifg=bg
hi MatchParen   guifg=fg        guibg=#87af00
hi Search       guifg=bg
hi Visual                       guibg=#005f87
hi Cursor                       guibg=#87afd7
hi CursorIM                     guibg=#87afd7
hi Error        guifg=#ff8787   guibg=#870000
hi IncSearch                    guibg=#5fd7d7
hi Search                       guibg=#d78700
hi Todo         guifg=#d7d75f   guibg=#5f5f00


" ----------------------------------------------------------------------------
" Messages:
" ----------------------------------------------------------------------------

hi Question     guifg=fg
hi ErrorMsg     guifg=#ff5f5f
hi ModeMsg      guifg=#afd7d7
hi MoreMsg      guifg=#afd7d7
hi WarningMsg   guifg=#d7875f


" ----------------------------------------------------------------------------
" UI:
" ----------------------------------------------------------------------------

hi ColorColumn  guifg=none
hi Pmenu        guifg=bg
hi PmenuSel     guifg=fg
hi PmenuThumb   guifg=fg
hi StatusLine   guifg=bg
hi TabLine      guifg=bg
hi TabLineSel   guifg=fg
hi WildMenu     guifg=fg
hi ColorColumn                  guibg=#3a3a3a
hi CursorLineNr guifg=#9e9e9e   guibg=#383838
hi FoldColumn                   guibg=#4e4e4e
hi Folded                       guibg=#4e4e4e
hi LineNr       guifg=#626262   guibg=none
hi PmenuSel                     guibg=#005f87
hi SignColumn                   guibg=#4e4e4e
hi StatusLineNC guifg=#4e4e4e
hi TabLineFill  guifg=#4e4e4e
hi VertSplit    guifg=#626262
hi WildMenu                     guibg=#005f87
hi FoldColumn   guifg=#bcbcbc
hi Folded       guifg=#bcbcbc
hi Pmenu                        guibg=#b2b2b2
hi PmenuSbar    guifg=#b2b2b2   guibg=#d0d0d0
hi PmenuThumb                   guibg=#808080
hi SignColumn   guifg=#b2b2b2
hi StatusLine                   guibg=#b2b2b2
hi StatusLineNC                 guibg=#b2b2b2
hi TabLine                      guibg=#b2b2b2
hi TabLineFill                  guibg=#b2b2b2
hi TabLineSel                   guibg=#005f87
hi VertSplit                    guibg=#b2b2b2


" ----------------------------------------------------------------------------
" Diff:
" ----------------------------------------------------------------------------

hi DiffAdd      guifg=fg
hi DiffChange   guifg=fg
hi DiffDelete   guifg=fg

hi DiffAdd                      guibg=#5f875f
hi DiffChange                   guibg=#87875f
hi DiffDelete                   guibg=#875f5f
hi DiffText                     guibg=#87875f
hi DiffText     guifg=#ffff87


" ----------------------------------------------------------------------------
" Spelling:
" ----------------------------------------------------------------------------

hi SpellBad     guisp=#ff5f5f
hi SpellCap     guisp=#5fafd7
hi SpellLocal   guisp=#d7af5f
hi SpellRare    guisp=#5faf5f


" ----------------------------------------------------------------------------
" Miscellaneous:
" ----------------------------------------------------------------------------

hi Ignore       guifg=bg
hi Underlined   guifg=fg


" ============================================================================
" Text Emphasis:
" ============================================================================

if s:use_bold == 1
  for s:item in s:bold_items
    exec "hi " . s:item . " gui=bold cterm=bold term=none"
  endfor
endif

if s:use_underline == 1
  for s:item in s:underline_items
    exec "hi " . s:item . " gui=underline cterm=underline term=none"
  endfor

  for s:item in s:undercurl_items
    exec "hi " . s:item . " cterm=underline"
  endfor
endif

for s:item in s:undercurl_items
  exec "hi " . s:item . " gui=undercurl term=none"
endfor


" ============================================================================
" Alternative Bold Definitions:
" ============================================================================

let s:alternative_bold_items = ["Identifier", "PreProc", "Statement",
            \ "Special", "Constant", "Type"]

for s:item in s:alternative_bold_items
  exec "let s:temp_gui_fg = synIDattr(synIDtrans(hlID('" . s:item .
              \ "')), 'fg', 'gui')"

  exec "hi B" . s:item . " guifg=" . s:temp_gui_fg .
              \ " gui=bold cterm=bold term=none"
endfor


hi VertSplit guifg=#aaaaaa guibg=none
hi SignColumn guibg=#333333
hi FernRootText guifg=#87d7d7 gui=bold

