local M = {}

---@param colors NightfallPalette
---@param options table
---@return table
function M.get(colors, options)
  local utils = require("nightfall.utils.colors")
  local accent = utils.vary_color({
    nightfall = colors.purple,
    ["deeper-night"] = colors.blue,
    maron = colors.sand,
    ["white-night"] = colors.sky,
  }, colors.lime)

  -- See `:h highlight-groups`
  return {
    ColorColumn = { bg = colors.black },
    Conceal = { fg = colors.gray },
    CurSearch = { fg = colors.black, bg = utils.vary_color({ nightfall = colors.blue }, colors.coral) },
    Cursor = { fg = colors.bg, bg = colors.fg },
    lCursor = { fg = colors.bg, bg = colors.fg },
    CursorColumn = {
      bg = options.transparent and utils.lighten(colors.navy, 0.9, colors.azure)
        or utils.lighten(colors.navy, 0.95, colors.azure),
    },
    CursorLine = {
      bg = options.transparent and utils.lighten(colors.navy, 0.9, colors.azure)
        or utils.lighten(colors.navy, 0.95, colors.azure),
    },
    Directory = { fg = accent },
    DiffAdd = { bg = utils.darken(colors.green, 0.52) },
    DiffChange = { bg = utils.darken(colors.yellow, 0.5) },
    DiffDelete = { bg = utils.darken(colors.red, 0.54) },
    DiffText = { bg = utils.darken(colors.blue, 0.5) },
    EndOfBuffer = { fg = colors.charcoal },
    TermCursor = { fg = colors.bg, bg = colors.fg },
    ErrorMsg = { fg = colors.red, bold = true, italic = true },
    WarningMsg = { fg = colors.peach, bold = true, italic = true },
    WinSeparator = { fg = colors.charcoal },
    Folded = { fg = accent, bg = colors.navy },
    FoldColumn = { fg = colors.navy },
    SignColumn = { fg = colors.charcoal },
    IncSearch = { fg = colors.black, bg = colors.blue },
    Substitute = { fg = colors.black, bg = accent },
    LineNr = { fg = colors.gray },
    CursorLineNr = {
      fg = utils.vary_color({ maron = colors.yellow }, colors.azure),
      bold = true,
    },
    MatchParen = {
      fg = colors.blue,
      bg = utils.lighten(colors.navy, 0.9),
      bold = true,
    },
    ModeMsg = { fg = accent },
    MsgArea = { fg = colors.fg },
    MsgSeparator = { fg = colors.fg },
    MoreMsg = { fg = colors.azure },
    NonText = { fg = colors.gray },
    Normal = {
      fg = colors.fg,
      bg = options.transparent and "NONE" or colors.bg,
    },
    NormalFloat = {
      fg = colors.fg,
      bg = options.transparent and "NONE" or utils.darken(colors.bg, 0.9),
    },
    FloatBorder = { fg = accent },
    FloatTitle = { fg = accent },
    NormalNC = {
      fg = options.dim_inactive and utils.darken(colors.fg, 0.9) or colors.fg,
      bg = options.transparent and "NONE" or options.dim_inactive and utils.darken(colors.bg, 0.9) or colors.bg,
    },
    Pmenu = {
      fg = colors.fg,
      bg = options.transparent and "NONE" or colors.black,
    },
    PmenuSel = {
      fg = colors.black,
      bg = utils.vary_color({ nightfall = colors.lavender }, colors.cream),
      bold = true,
    },
    PmenuSbar = { bg = colors.navy },
    PmenuThumb = { bg = colors.charcoal },
    PmenuMatch = { fg = colors.sky, bg = colors.black },
    PmenuMatchSel = { fg = colors.cyan, bg = colors.black },
    Question = { fg = accent, bold = true },
    QuickFixLine = { fg = accent },
    Search = { fg = colors.black, bg = colors.cream },
    SnippetTabstop = {
      fg = utils.lighten(accent, 0.5),
      bg = utils.darken(accent, 0.3),
    },
    SpecialKey = { fg = colors.charcoal },
    SpellBad = { sp = colors.coral, undercurl = true },
    SpellCap = { sp = colors.peach, undercurl = true },
    SpellLocal = { sp = colors.lime, undercurl = true },
    SpellRare = { sp = colors.cyan, undercurl = true },
    StatusLine = {
      fg = colors.azure,
      bg = options.transparent and "NONE" or colors.black,
    },
    StatusLineNC = {
      fg = options.dim_inactive and utils.darken(colors.azure, 0.9) or colors.azure,
      bg = options.transparent and "NONE" or colors.black,
    },
    TabLine = {
      fg = utils.lighten(colors.gray, 0.7),
      bg = options.transparent and "NONE" or utils.lighten(colors.bg, 0.9),
    },
    TabLineFill = { bg = options.transparent and "NONE" or colors.black },
    TabLineSel = { fg = colors.fg, bg = colors.bg, bold = true },
    Title = { fg = accent },
    Visual = { bg = utils.lighten(colors.navy, 0.85, colors.azure), bold = true },
    Whitespace = { fg = colors.gray },
    WinBar = { fg = colors.fg, bold = true },
    WinBarNC = {
      fg = options.dim_inactive and utils.darken(colors.fg, 0.9) or utils.lighten(colors.gray, 0.9),
    },
  }
end

return M
