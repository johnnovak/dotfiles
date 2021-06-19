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
hi SpecialKey   guifg=#5f875f   " darkgreen
hi Comment      guifg=#808080   " gray
hi Conceal      guifg=#808080
hi Constant     guifg=#d7d7af   " yellow
hi Directory    guifg=#afd7af   " palegreen
hi Identifier   guifg=#afd787   " green
hi PreProc      guifg=#87d7af   " cyan
hi Special      guifg=#d7afd7   " purple
hi Statement    guifg=#87d7ff   " blue
hi Title        guifg=#5fafd7   " blue2
hi Type         guifg=#87d7d7   " lightblue


" ----------------------------------------------------------------------------
" Highlighting:
" ----------------------------------------------------------------------------

hi Cursor       guifg=bg        guibg=#87afd7
hi CursorColumn guifg=none      guibg=#383838
hi CursorIM     guifg=bg        guibg=#87afd7
hi CursorLine   guifg=none      guibg=#383838
hi Visual       guifg=none      guibg=#005880
hi VisualNOS    guifg=fg        guibg=none

hi IncSearch    guifg=bg        guibg=#5fd7d7
hi MatchParen   guifg=fg        guibg=#87af00
hi Search       guifg=bg        guibg=#d78700
hi Error        guifg=#ff8787   guibg=#870000
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

hi ColorColumn  guifg=none      guibg=#3a3a3a
hi TabLine      guifg=bg        guibg=#b2b2b2
hi TabLineSel   guifg=fg        guibg=#005f87
hi WildMenu     guifg=fg        guibg=#005f87
hi CursorLineNr guifg=#9e9e9e   guibg=#383838
hi FoldColumn   guifg=#bcbcbc   guibg=#4e4e4e
hi Folded       guifg=#bcbcbc   guibg=#4e4e4e
hi LineNr       guifg=#626262   guibg=none
hi SignColumn   guifg=#b2b2b2   guibg=#4e4e4e
hi TabLineFill  guifg=#4e4e4e   guibg=#b2b2b2
hi VertSplit    guifg=#626262   guibg=#b2b2b2
hi Pmenu        guifg=#cacaca   guibg=#474747
hi PmenuSel     guifg=bg        guibg=#d7d7af gui=bold
hi PmenuSbar    guifg=bg        guibg=#505050
hi PmenuThumb   guifg=#606060   guibg=#939393
hi StatusLine   guifg=bg        guibg=#aaaaaa gui=bold
hi StatusLineNC guifg=#dddddd   guibg=#404040

" ----------------------------------------------------------------------------
" Diff:
" ----------------------------------------------------------------------------

hi DiffAdd      guifg=fg        guibg=#5f875f
hi DiffChange   guifg=fg        guibg=#87875f
hi DiffDelete   guifg=fg        guibg=#875f5f
hi DiffText     guifg=#ffff87   guibg=#87875f


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


hi VertSplit    guifg=#aaaaaa guibg=none
hi SignColumn   guibg=#333333

" #555580
" #5f875f   darkgreen
" #808080   gray
" #808080
" #d7d7af   yellow
" #afd7af   palegreen
" #afd787   green
" #87d7af   cyan
" #d7afd7   purple
" #87d7ff   blue
" #5fafd7   blue2
" #87d7d7   lightblue

hi NvimTreeSymlink            guifg=#87d7af
hi NvimTreeFolderName         guifg=#87d7ff
hi NvimTreeRootFolder         guifg=#d7afd7
hi NvimTreeFolderIcon         guifg=#8090a0
hi NvimTreeEmptyFolderName    guifg=#5797bf
hi NvimTreeOpenedFolderName   guifg=#87d7ff
hi NvimTreeExecFile           guifg=#afd787
hi NvimTreeOpenedFile         guifg=fg
hi NvimTreeSpecialFile        guifg=#d7d7af gui=underline
hi NvimTreeImageFile          guifg=fg
hi NvimTreeMarkdownFile       guifg=fg
hi NvimTreeIndentMarker       guifg=#555555

