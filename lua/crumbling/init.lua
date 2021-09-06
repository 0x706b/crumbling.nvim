local lush = require 'lush'
local hsluv = lush.hsluv
local hsl = lush.hsl

local c = {
  black = hsluv(0, 0, 0),

  bg  = hsluv(10, 0, 7),
  bg0 = hsluv(10, 0, 8),
  bg1 = hsluv(10, 0, 10),
  bg2 = hsluv(10, 0, 15),
  bg3 = hsluv(10, 0, 20),
  bg4 = hsluv(10, 0, 25),
  bg5 = hsluv(10, 0, 30),
  bg6 = hsluv(10, 0, 35),
  bg7 = hsluv(10, 0, 40),

  gray = hsluv(10, 0, 45),

  fg  = hsluv(0, 0, 90),
  fg0 = hsluv(0, 0, 85),
  fg1 = hsluv(0, 0, 80),
  fg2 = hsluv(0, 0, 75),
  fg3 = hsluv(0, 0, 70),
  fg4 = hsluv(0, 0, 65),
  fg5 = hsluv(0, 0, 60),
  fg6 = hsluv(0, 0, 55),
  fg7 = hsluv(0, 0, 50),

  bg_blue  = hsluv(230, 30, 22),

  n = {
    yellow = hsluv(50, 50, 74),
    cyan   = hsluv(200, 18, 53),
    blue   = hsluv(216, 35, 65),
    green  = hsluv(170, 35, 70),
    red    = hsluv(10, 45, 64),
    magenta = hsluv(340, 45, 64),
  },

  b = {
    red    = hsluv(4, 90, 60),
    yellow = hsluv(50, 90, 80),
    blue   = hsluv(212, 70, 70),
  },

  m = {
    red    = hsluv(24, 45, 52),
    blue   = hsluv(212, 37, 63),
    green  = hsluv(190, 37, 55),
    yellow = hsluv(50, 45, 60),
  },

  ref = {
    green  = hsluv(203, 35, 55),
    blue   = hsluv(216, 33, 58),
    cyan   = hsluv(212, 37, 63),
  },

  d = {
    cyan  = hsluv(226, 33, 44)
  },
}

---@diagnostic disable: undefined-global
local theme = lush(function ()
  return {
    Normal { fg = c.fg2, bg = c.bg },
    NormalTransparent { fg = c.fg0 },
    Delimiter { fg = c.n.cyan },
    Operator { fg = c.n.cyan, gui = 'bold' },
    Visual { bg = c.bg_blue },
    MatchParen { fg = c.bg, bg = c.ref.blue, gui='bold' },
    Comment { fg = c.bg6, gui='italic' },
    Whitespace { fg = c.bg4 },
    EndOfBuffer { fg = c.bg4 },

    VertSplit { fg = c.bg6 },

    TSPunctBracket { Delimiter },

    LineNr { fg = c.fg6, bg = c.bg2.da(20) },
    SignColumn { bg = LineNr.bg },
    GitSignsAdd { fg = c.m.green, bg = SignColumn.bg },
    GitSignsDelete { fg = c.m.red, bg = SignColumn.bg },
    GitSignsChange { fg = c.m.yellow, bg = SignColumn.bg },

    DiffAdd { bg = c.m.green.da(40) },
    DiffDelete { bg = c.m.red.da(40) },
    DiffChange { bg = c.m.yellow.da(40) },
    DiffText { bg = c.m.yellow.da(40), gui = 'underline' },

    CursorLine { bg = c.bg2 },
    CursorLineNr { fg = c.n.yellow, bg = CursorLine.bg, gui = 'bold' },

    StatusLine { bg = c.bg1 },
    StatusLineNC { bg = c.bg1 },

    Pmenu { fg = c.fg2, bg = c.bg0 },
    PmenuSel { fg = c.bg0, bg = c.n.blue },
    PmenuSbar { bg = c.bg2 },
    PmenuThumb { bg = c.fg2 },

    NonText { EndOfBuffer },

    Todo { fg = c.b.yellow, gui = 'bold, italic' },

    Title { gui = 'bold' },

    Error { fg = c.b.red, gui = 'bold' },
    ErrorMsg { fg = c.bg, bg = c.b.red, gui = 'bold' },
    Warning { fg = c.b.yellow, gui = 'bold' },
    WarningMsg { fg = c.bg, bg = c.b.yellow, gui = 'bold' },
    MoreMsg { fg = c.bg, bg = c.b.blue, gui = 'bold' },

    Search { fg = c.bg, bg = c.b.yellow, gui = 'bold' },
    WildMenu {},
    Folded { bg = c.bg3 },
    FoldColumn { bg = c.bg3 },

    Function {},
    Label {},
    Constant {},
    Define {},
    Directory {},
    PreProc {},
    Noise {},
    String { fg = c.n.green, gui = 'italic' },
    Statement { gui = 'bold' },
    Number { fg = c.n.yellow },
    Type { fg = c.n.blue, gui = 'bold' },
    Keyword { fg = c.fg2, gui = 'bold' },
    Special { fg = c.fg2, gui='bold' },
    Identifier { fg = c.fg1, gui = 'italic' },
    Question { gui = 'italic' },

    NormalFloat = { NormalTransparent },

    CocHighlightText { fg = c.b.yellow, gui='underline,bold' },
    CocErrorSign { fg = c.b.red, bg = SignColumn.bg },
    CocWarningSign { fg = c.b.yellow, bg = SignColumn.bg },
    CocHintSign { fg = c.b.blue, bg = SignColumn.bg },
    CocInfoSign { fg = c.b.blue, bg = SignColumn.bg },
    CocErrorHighlight { sp = c.b.red, gui = 'undercurl' },
    CocWarningHighlight { sp = c.b.yellow, gui='undercurl' },
    CocInfoHighlight { sp = c.b.blue, gui = 'undercurl' },
    CocHintHighlight { sp = c.b.blue, gui = 'undercurl' },
    HighlightedyankRegion { Warning },

    typescriptObjectLabel { fg = c.fg },
    typescriptCall { fg = c.fg, gui = 'italic' },
    typescriptOperator { Operator },
    typesciptTypeReference { Type },
    typescriptTypeParameter { Type },
    typescriptTypeReference { Type },
    typescriptTypeParameter { Type },
    typescriptArrowFunc { Statement },
    typescriptParens { Delimiter },
    typescriptBraces { Delimiter },
    typescriptArrowFuncArg { typescriptCall },
    typescriptTypeBrackets { Delimiter },
    typescriptDotNotation { Delimiter },
    typescriptTypeAnnotation { Delimiter },
    typescriptBinaryOp { typescriptOperator },
    typescriptTernaryOp { typescriptOperator },
    typescriptTypeQuery { typescriptOperator },
    typescriptMappedIn { typescriptOperator },
    typescriptAssign { typescriptOperator },
    typescriptUnaryOp { typescriptOperator },
    typescriptBracket { Delimiter },
    typescriptPredefinedType { Special },
    typescriptTypeArguments { Delimiter },
    typescriptInterfaceName { Type },
    typescriptClassName { Type },
    typescriptAliasDeclaration { Type },
    typescriptNull { Number },
    typescriptBoolean { Number },
    tsxIntrinsicTagName { Special },
    tsxTagName { Type },
    tsxTag { Delimiter },
    tsxCloseTag { Delimiter },
    tsxCloseString { Delimiter },
    tsxAttrib { NormalTransparent },
    tsxEqual { Delimiter },
    typescriptDocNotation { fg = c.bg7, gui = 'bold,italic' },
    typescriptDocTags { typescriptDocNotation },
    jsxTagName { Special },
    jsxComponentName { Type },
    jsxOpenPunct { Delimiter },
    jsxClosePunct { Delimiter },
    jsxCloseString { Delimiter },
    jsxAttrib { NormalTransparent },

    Crumbling { lush = c }
  }
end)

require('build').build(c)

return theme
