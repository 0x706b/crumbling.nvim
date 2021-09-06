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

  git = {
    delete    = hsluv(24, 45, 52),
    change    = hsluv(216, 37, 63),
    add       = hsluv(110, 37, 55)
  },

  n = {
    yellow = hsluv(50, 45, 65),
    cyan   = hsluv(200, 18, 53),
    blue   = hsluv(216, 30, 60),
    green  = hsluv(110, 35, 65),
    red    = hsluv(24, 35, 52),
    magenta = hsluv(0, 25, 60),
  },

  b = {
    red    = hsluv(15, 65, 60),
    yellow = hsluv(50, 70, 65),
    blue   = hsluv(216, 60, 60),
  },

  m = {
    red    = hsluv(24, 45, 52),
    blue   = hsluv(212, 37, 63),
    green  = hsluv(150, 37, 55),
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

local c2 = {
  black = hsluv(0, 0, 0),

  bg  = c.bg,
  bg0 = c.bg1,
  bg1 = c.bg2,
  bg2 = c.bg3,

  gray = hsluv(10, 0, 45),

  fg  = c.fg,
  fg0 = c.fg1,
  fg1 = c.fg2,
  fg2 = c.fg3,

  bg_blue  = hsluv(230, 30, 22),

  git = {
    add = c.git.add,
    change = c.git.change,
    delete = c.git.delete
  },

  n = {
    yellow = c.n.yellow,
    cyan   = c.n.cyan,
    blue   = c.n.blue,
    green  = c.n.green,
    red    = c.n.red,
    magenta = c.n.magenta,
  },

  b = {
    red    = c.b.red,
    yellow = c.b.yellow,
    blue   = c.b.blue,
  },

  m = {
    red    = c.m.red,
    blue   = c.m.blue,
    green  = c.m.green,
    yellow = c.m.yellow,
  },

  ref = {
    green  = c.ref.green,
    blue   = c.ref.blue,
    cyan   = c.ref.cyan,
  },

  d = {
    cyan  = c.d.cyan
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
    MatchParen { fg = c.bg, bg = c.b.yellow, gui='bold' },
    Comment { fg = c.fg7, gui='italic' },
    Whitespace { fg = c.bg4 },
    EndOfBuffer { fg = c.bg4 },

    TabLine { fg = c.fg2 },
    TabLineSel { fg = c.fg4 },
    TabLineFill { fg = c.fg2 },

    VertSplit { fg = c.bg6 },

    TSPunctBracket { Delimiter },

    LineNr { fg = c.fg6, bg = c.bg2.da(20) },
    SignColumn { bg = LineNr.bg },
    GitSignsAdd { fg = c.git.add, bg = SignColumn.bg },
    GitSignsDelete { fg = c.git.delete, bg = SignColumn.bg },
    GitSignsChange { fg = c.git.change, bg = SignColumn.bg },

    DiffAdd { bg = c.git.add.da(50) },
    DiffDelete { bg = c.git.delete.da(50) },
    DiffChange { bg = c.git.change.da(50) },
    DiffText { bg = c.git.change.da(50), sp = c.fg2, gui = 'underline' },

    Cursor { Normal, gui = 'reverse' },
    CursorLine { bg = c.bg2 },
    CursorLineNr { fg = c.n.yellow, bg = CursorLine.bg, gui = 'bold' },

    StatusLine { bg = c.bg2 },
    StatusLineNC { bg = c.bg2 },

    Pmenu { fg = c.fg4, bg = c.bg1 },
    PmenuSel { fg = c.bg0, bg = c.n.blue },
    PmenuSbar { bg = c.bg2 },
    PmenuThumb { bg = c.fg6 },

    NonText { EndOfBuffer },

    Todo { fg = c.b.yellow, gui = 'bold, italic' },

    Title { gui = 'bold' },

    Error { fg = c.b.red, gui = 'bold' },
    ErrorMsg { fg = c.b.red, gui = 'bold' },
    Warning { fg = c.b.yellow, gui = 'bold' },
    WarningMsg { fg = c.b.yellow, gui = 'bold' },
    MoreMsg { fg = c.b.blue, gui = 'bold' },

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
    String { fg = c.n.green },
    Statement { fg = c.n.red, gui = 'bold' },
    Number { fg = c.n.yellow },
    Type { fg = c.n.blue, gui = 'bold' },
    Keyword { fg = c.fg3, gui = 'bold' },
    Special { fg = c.n.cyan, gui='bold' },
    Identifier { fg = c.fg1, gui = 'italic' },
    Question { gui = 'italic' },
    SpecialKey {},

    NormalFloat { bg = c.bg1 },
    FloatBorder { NormalFloat },

    CocHighlightText { gui='underline' },
    CocErrorSign { fg = c.b.red, bg = SignColumn.bg },
    CocWarningSign { fg = c.b.yellow, bg = SignColumn.bg },
    CocHintSign { fg = c.b.blue, bg = SignColumn.bg },
    CocInfoSign { fg = c.b.blue, bg = SignColumn.bg },
    CocExplorerDiagnosticError { fg = c.b.red },
    CocExplorerDiagnosticWarning { fg = c.b.yellow },
    CocErrorHighlight { sp = c.b.red, gui = 'undercurl' },
    CocWarningHighlight { sp = c.b.yellow, gui='undercurl' },
    CocInfoHighlight { sp = c.b.blue, gui = 'undercurl' },
    CocHintHighlight { sp = c.b.blue, gui = 'undercurl' },
    HighlightedyankRegion { Warning },

    typescriptObjectLabel { fg = c.fg2 },
    typescriptCall { fg = c.fg2, gui = 'italic' },
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
    typescriptPredefinedType { Keyword },
    typescriptTypeArguments { Delimiter },
    typescriptInterfaceName { Type },
    typescriptClassName { Type },
    typescriptAliasDeclaration { Type },
    typescriptNull { Number },
    typescriptBoolean { Number },
    tsxIntrinsicTagName { Keyword },
    tsxTagName { Type },
    tsxTag { Delimiter },
    tsxCloseTag { Delimiter },
    tsxCloseString { Delimiter },
    tsxAttrib { NormalTransparent },
    tsxEqual { Delimiter },
    typescriptDocNotation { fg = c.bg7, gui = 'bold,italic' },
    typescriptDocTags { typescriptDocNotation },
    jsxTagName { Keyword },
    jsxComponentName { Type },
    jsxOpenPunct { Delimiter },
    jsxClosePunct { Delimiter },
    jsxCloseString { Delimiter },
    jsxAttrib { NormalTransparent },

    Crumbling { lush = c2 }
  }
end)

require('crumbling.build').build(c)

return theme
