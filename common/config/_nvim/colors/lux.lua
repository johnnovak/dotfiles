local Color = require("colorbuddy.color").Color
local c = require("colorbuddy.color").colors

local Group = require("colorbuddy.group").Group
local g = require("colorbuddy.group").groups

local s = require("colorbuddy.style").styles

Color.new('col1', '#005f87')
Color.new('black', '#2a2a2a')
Color.new('col3', '#3a3a3a')
Color.new('lightblack', '#444444')
Color.new('col5', '#4e4e4e')
Color.new('col6', '#5f5f00')
Color.new('col7', '#5f5f87')
Color.new('col8', '#5f875f')
Color.new('green', '#5faf5f')
Color.new('col10', '#5fafd7')
Color.new('col11', '#5fd7d7')
Color.new('col12', '#626262')
Color.new('col13', '#808080')
Color.new('col14', '#870000')
Color.new('col15', '#875f5f')
Color.new('col16', '#87875f')
Color.new('col17', '#87af00')
Color.new('col18', '#87afd7')
Color.new('lightcyan', '#87d7af')
Color.new('col20', '#87d7d7')
Color.new('blue', '#87d7ff')
Color.new('col22', '#9e9e9e')
Color.new('lightgreen', '#afd787')
Color.new('col24', '#afd7af')
Color.new('col25', '#afd7d7')
Color.new('col26', '#b2b2b2')
Color.new('col27', '#bcbcbc')
Color.new('col28', '#d0d0d0')
Color.new('col29', '#d78700')
Color.new('col30', '#d7875f')
Color.new('yellow', '#d7af5f')
Color.new('lightmagenta', '#d7afd7')
Color.new('col33', '#d7d75f')
Color.new('lightyellow', '#d7d7af')
Color.new('col35', '#d7d7d7')
Color.new('lightred', '#ff5f5f')
Color.new('col37', '#ff8787')
Color.new('col38', '#ffff87')


------------------------------------------------------------------------------
-- Normal Colors
------------------------------------------------------------------------------

Group.new('Normal', c.col35, c.black)


------------------------------------------------------------------------------
-- Text Markup
------------------------------------------------------------------------------

Group.new('NonText', c.col7, c.none)
Group.new('SpecialKey', c.col8, c.none)
Group.new('Comment', c.col13, c.none)
Group.new('Conceal', c.col13, c.none)
Group.new('Constant', c.lightyellow, c.none)
Group.new('Directory', c.col24, c.none)
Group.new('Identifier', c.lightgreen, c.none)
Group.new('PreProc', c.lightcyan, c.none)
Group.new('Special', c.lightmagenta, c.none)
Group.new('Statement', c.blue, c.none)
Group.new('Title', c.col10, c.none, s.bold)
Group.new('Type', c.lightblue, c.none)


------------------------------------------------------------------------------
-- Highlighting
------------------------------------------------------------------------------

Group.new('Cursor', c.bg, c.col18)
Group.new('CursorColumn', c.none, c.lightblack)
Group.new('CursorLine', c.none, c.lightblack)
Group.new('CursorIM', c.bg, c.col18)
Group.new('MatchParen', c.fg, c.col17)
Group.new('Visual', c.none, c.col1)
Group.new('VisualNOS', c.fg, c.none, s.underline)
Group.new('Error', c.col37, col14)
Group.new('IncSearch', c.bg, c.col11)
Group.new('Search', c.bg, c.col29)
Group.new('Todo', c.col33, c.col6)


------------------------------------------------------------------------------
-- Messages
------------------------------------------------------------------------------

Group.new('Question', c.fg, c.none)
Group.new('ErrorMsg', c.lightred, c.none)
Group.new('ModeMsg', c.col25, c.none)
Group.new('MoreMsg', c.col25, c.none)
Group.new('WarningMsg', c.col30, c.none)


------------------------------------------------------------------------------
-- UI
------------------------------------------------------------------------------

Group.new('ColorColumn', c.none, c.col3)
Group.new('CursorLineNr', c.col22, lightblack, s.bold)
Group.new('LineNr', c.col12, lightblack)
Group.new('SignColumn', c.col26, col5)
Group.new('WildMenu', c.fg, c.col1 )
Group.new('FoldColumn', c.col27, col5, s.bold)
Group.new('Folded', c.col27, col5, s.bold)
Group.new('Pmenu', c.bg, c.col28)
Group.new('PmenuSbar', c.col26, col28)
Group.new('PmenuThumb', c.fg, c.col13)
Group.new('PmenuSel', c.fg, c.col1)
Group.new('StatusLine', c.bg, c.col26, s.bold)
Group.new('StatusLineNC', c.col5, col26)
Group.new('TabLine', c.bg, c.col26)
Group.new('TabLineFill', c.col5, col26)
Group.new('TabLineSel', c.fg, c.col1, s.bold)
Group.new('VertSplit', c.col12, col26)


------------------------------------------------------------------------------
-- Diff
------------------------------------------------------------------------------

Group.new('DiffAdd', c.fg, c.col8)
Group.new('DiffChange', c.fg, c.col16)
Group.new('DiffDelete', c.fg, c.col15)
Group.new('DiffText', c.col38, col16, s.bold)


------------------------------------------------------------------------------
-- Spelling
------------------------------------------------------------------------------

Group.new('SpellBad', nil, nil, nil, c.lightred)
Group.new('SpellCap', nil, nil, nil, c.col10)
Group.new('SpellLocal', nil, nil, nil, c.yellow)
Group.new('SpellRare', nil, nil, nil, c.green)


------------------------------------------------------------------------------
-- Miscellaneous
------------------------------------------------------------------------------

Group.new('Ignore', c.bg, c.none)
Group.new('Underlined', c.fg, c.none, s.underline)

