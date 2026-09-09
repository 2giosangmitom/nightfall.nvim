--- Highlights for Neovim's own user interface. See `:h highlight-groups`.

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, o = ctx.c, ctx.o
  local accent = ctx.accent

  -- Backgrounds the editor draws behind the cursor line and column.
  local cursor_bg = ctx.lighten(c.navy, o.transparent and 0.9 or 0.95, c.latte)
  local selection_bg = ctx.lighten(c.navy, 0.85, c.latte)
  local float_bg = o.transparent and "NONE" or ctx.darken(c.bg, 0.9)
  local normal_bg = o.transparent and "NONE" or c.bg
  local dimmed_fg = o.dim_inactive and ctx.darken(c.fg, 0.9) or c.fg

  return {
    ColorColumn = { bg = c.black },
    Conceal = { fg = c.gray },
    CurSearch = {
      fg = c.black,
      bg = ctx.vary({ nightfall = c.blue, maron = c.gold }, c.coral),
    },
    Cursor = { fg = c.bg, bg = c.fg },
    lCursor = { fg = c.bg, bg = c.fg },
    CursorColumn = { bg = cursor_bg },
    CursorLine = { bg = cursor_bg },
    Directory = { fg = accent },
    DiffAdd = { bg = ctx.darken(c.navy, 0.88, c.green) },
    DiffChange = { bg = ctx.darken(c.navy, 0.9, c.yellow) },
    DiffDelete = { bg = ctx.darken(c.navy, 0.7, c.red) },
    DiffText = { bg = ctx.darken(c.navy, 0.8, c.blue) },
    EndOfBuffer = { fg = c.charcoal },
    TermCursor = { fg = c.bg, bg = c.fg },
    ErrorMsg = { fg = c.red, bold = true, italic = true },
    WarningMsg = { fg = c.peach, bold = true, italic = true },
    WinSeparator = { fg = c.charcoal },
    Folded = { fg = accent, bg = c.navy },
    FoldColumn = { fg = c.navy },
    SignColumn = { fg = c.charcoal },
    IncSearch = { fg = c.black, bg = c.peach },
    Substitute = { fg = c.black, bg = accent },
    LineNr = { fg = c.gray },
    CursorLineNr = { fg = ctx.vary({ maron = c.yellow }, c.latte), bold = true },
    MatchParen = {
      fg = ctx.vary({ ["deeper-night"] = c.magenta, nightfall = c.purple, maron = c.gold }, c.lime),
      bg = ctx.lighten(c.navy, 0.9),
      bold = true,
    },
    ModeMsg = { fg = accent },
    MsgArea = { fg = c.fg },
    MsgSeparator = { fg = c.fg },
    MoreMsg = { fg = c.latte },
    NonText = { fg = c.gray },
    Normal = { fg = c.fg, bg = normal_bg },
    NormalFloat = { fg = c.fg, bg = float_bg },
    FloatBorder = { fg = accent },
    FloatTitle = { fg = accent },
    NormalNC = {
      fg = dimmed_fg,
      bg = o.transparent and "NONE" or o.dim_inactive and ctx.darken(c.bg, 0.9) or c.bg,
    },
    Pmenu = { fg = c.fg, bg = o.transparent and "NONE" or c.black },
    PmenuSel = { bg = selection_bg, bold = true },
    PmenuSbar = { bg = c.navy },
    PmenuThumb = { bg = c.charcoal },
    PmenuMatch = { fg = c.sky, bg = c.black },
    PmenuMatchSel = { fg = c.cyan, bg = c.black },
    Question = { fg = accent, bold = true },
    QuickFixLine = { fg = accent },
    Search = {
      fg = c.black,
      bg = ctx.vary({ maron = c.lime }, c.cream),
    },
    SnippetTabstop = { fg = ctx.lighten(accent, 0.5), bg = ctx.darken(accent, 0.3) },
    SpecialKey = { fg = c.charcoal },
    SpellBad = { sp = c.coral, undercurl = true },
    SpellCap = { sp = c.peach, undercurl = true },
    SpellLocal = { sp = c.lime, undercurl = true },
    SpellRare = { sp = c.cyan, undercurl = true },
    StatusLine = { fg = c.latte, bg = o.transparent and "NONE" or c.black },
    StatusLineNC = {
      fg = o.dim_inactive and ctx.darken(c.latte, 0.9) or c.latte,
      bg = o.transparent and "NONE" or c.black,
    },
    TabLine = {
      fg = ctx.lighten(c.gray, 0.7),
      bg = o.transparent and "NONE" or ctx.lighten(c.bg, 0.9),
    },
    TabLineFill = { bg = o.transparent and "NONE" or c.black },
    TabLineSel = { fg = c.fg, bg = c.bg, bold = true },
    Title = { fg = accent },
    Visual = { bg = selection_bg, bold = true },
    Whitespace = { fg = c.gray },
    WinBar = { fg = c.fg, bold = true },
    WinBarNC = { fg = o.dim_inactive and ctx.darken(c.fg, 0.9) or ctx.lighten(c.gray, 0.9) },
  }
end

return M
