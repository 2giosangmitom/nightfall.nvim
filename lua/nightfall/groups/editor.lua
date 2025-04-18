local M = {}

---@param colors NightfallPalette
---@param options table
---@return table
function M.get(colors, options)
  local utils = require("nightfall.utils.colors")
  local accent = utils.vary_color({
    nightfall = colors.purple,
    maron = colors.lavender,
    nord = colors.teal,
  }, colors.sky)

  -- See `:h highlight-groups`
  return {
    ColorColumn = { bg = colors.black },
    Conceal = { fg = colors.gray },
    CurSearch = {
      fg = colors.black,
      bg = utils.vary_color({ nightfall = colors.blue, maron = colors.gold, nord = colors.blue }, colors.coral),
    },
    Cursor = { fg = colors.bg, bg = colors.fg },
    lCursor = { fg = colors.bg, bg = colors.fg },
    CursorColumn = {
      bg = options.transparent and utils.lighten(colors.navy, 0.9, colors.latte)
        or utils.lighten(colors.navy, 0.95, colors.latte),
    },
    CursorLine = {
      bg = options.transparent and utils.lighten(colors.navy, 0.9, colors.latte)
        or utils.lighten(colors.navy, 0.95, colors.latte),
    },
    Directory = { fg = accent },
    DiffAdd = { bg = utils.darken(colors.navy, 0.88, colors.green) },
    DiffChange = { bg = utils.darken(colors.navy, 0.9, colors.yellow) },
    DiffDelete = { bg = utils.darken(colors.navy, 0.7, colors.red) },
    DiffText = { bg = utils.darken(colors.navy, 0.8, colors.blue) },
    EndOfBuffer = { fg = colors.charcoal },
    TermCursor = { fg = colors.bg, bg = colors.fg },
    ErrorMsg = { fg = colors.red, bold = true, italic = true },
    WarningMsg = { fg = colors.peach, bold = true, italic = true },
    WinSeparator = { fg = colors.charcoal },
    Folded = { fg = accent, bg = colors.navy },
    FoldColumn = { fg = colors.navy },
    SignColumn = { fg = colors.charcoal },
    IncSearch = { fg = colors.black, bg = colors.peach },
    Substitute = { fg = colors.black, bg = accent },
    LineNr = { fg = colors.gray },
    CursorLineNr = {
      fg = utils.vary_color({ maron = colors.yellow }, colors.latte),
      bold = true,
    },
    MatchParen = {
      fg = utils.vary_color(
        { ["deeper-night"] = colors.magenta, nightfall = colors.purple, maron = colors.gold },
        colors.lime
      ),
      bg = utils.lighten(colors.navy, 0.9),
      bold = true,
    },
    ModeMsg = { fg = accent },
    MsgArea = { fg = colors.fg },
    MsgSeparator = { fg = colors.fg },
    MoreMsg = { fg = colors.latte },
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
      bg = utils.lighten(colors.navy, 0.85, colors.latte),
      bold = true,
    },
    PmenuSbar = { bg = colors.navy },
    PmenuThumb = { bg = colors.charcoal },
    PmenuMatch = { fg = colors.sky, bg = colors.black },
    PmenuMatchSel = { fg = colors.cyan, bg = colors.black },
    Question = { fg = accent, bold = true },
    QuickFixLine = { fg = accent },
    Search = {
      fg = colors.black,
      bg = utils.vary_color({ maron = colors.lime, nord = colors.teal }, colors.cream),
    },
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
      fg = colors.latte,
      bg = options.transparent and "NONE" or colors.black,
    },
    StatusLineNC = {
      fg = options.dim_inactive and utils.darken(colors.latte, 0.9) or colors.latte,
      bg = options.transparent and "NONE" or colors.black,
    },
    TabLine = {
      fg = utils.lighten(colors.gray, 0.7),
      bg = options.transparent and "NONE" or utils.lighten(colors.bg, 0.9),
    },
    TabLineFill = { bg = options.transparent and "NONE" or colors.black },
    TabLineSel = { fg = colors.fg, bg = colors.bg, bold = true },
    Title = { fg = accent },
    Visual = {
      bg = utils.lighten(colors.navy, 0.85, colors.latte),
      bold = true,
    },
    Whitespace = { fg = colors.gray },
    WinBar = { fg = colors.fg, bold = true },
    WinBarNC = {
      fg = options.dim_inactive and utils.darken(colors.fg, 0.9) or utils.lighten(colors.gray, 0.9),
    },
  }
end

return M
