--- Highlights for Neovim's own user interface. See `:h highlight-groups`.
---
--- Every group Neovim documents up to 0.12 is defined here, including the ones
--- added in 0.11 for the completion popup and in 0.12 for the message kinds and
--- the popup menu border.

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)
  local on_accent = palette.on_accent(c, flavor)

  -- Surfaces the editor draws its own furniture on.
  local float_bg = U.background(c.bg_dim, o.transparent)
  local bar_bg = float_bg
  local menu_bg = U.background(c.surface, o.transparent)
  local inactive_bg = U.background(o.dim_inactive and c.bg_dim or c.bg, o.transparent)
  local inactive_fg = o.dim_inactive and U.darken(c.fg, 0.75, c.bg) or c.fg

  --- A hue laid over the editor background, for diffs and other tints.
  ---@param hex string
  ---@param amount number How much of the hue to keep.
  ---@return string
  local function wash(hex, amount) return U.blend(hex, c.bg, amount) end

  return {
    -- Text area
    ColorColumn = { bg = c.bg_alt },
    Conceal = { fg = c.subtle },
    Cursor = { fg = c.bg, bg = c.fg },
    lCursor = { fg = c.bg, bg = c.fg },
    CursorIM = { link = "Cursor" },
    TermCursor = { fg = c.bg, bg = c.fg },
    CursorColumn = { bg = c.bg_alt },
    CursorLine = { bg = c.bg_alt },
    EndOfBuffer = { fg = c.border },
    Normal = { fg = c.fg, bg = U.background(c.bg, o.transparent) },
    NormalNC = { fg = inactive_fg, bg = inactive_bg },
    NonText = { fg = c.subtle },
    SpecialKey = { fg = c.border },
    Whitespace = { fg = c.border },
    Directory = { fg = accent },
    Title = { fg = accent, bold = true },
    Visual = { bg = c.overlay },
    VisualNOS = { bg = c.overlay },
    MatchParen = {
      fg = flavor == "deeper-night" and c.magenta or flavor == "winter" and c.lime or c.gold,
      bg = c.overlay,
      bold = true,
    },

    -- Gutter
    LineNr = { fg = c.subtle },
    LineNrAbove = { link = "LineNr" },
    LineNrBelow = { link = "LineNr" },
    CursorLineNr = { fg = flavor == "maron" and c.yellow or c.latte, bold = true },
    SignColumn = { fg = c.border, bg = U.background(c.bg, o.transparent) },
    CursorLineSign = { link = "SignColumn" },
    FoldColumn = { fg = c.border, bg = U.background(c.bg, o.transparent) },
    CursorLineFold = { link = "FoldColumn" },
    Folded = { fg = accent, bg = c.bg_alt },

    -- Search and substitution
    Search = {
      fg = on_accent,
      bg = flavor == "maron" and c.lime or c.cream,
    },
    CurSearch = {
      fg = on_accent,
      bg = flavor == "nightfall" and c.pink or flavor == "maron" and c.gold or c.coral,
      bold = true,
    },
    IncSearch = { fg = on_accent, bg = c.peach, bold = true },
    Substitute = { fg = on_accent, bg = accent, bold = true },
    QuickFixLine = { bg = c.overlay, bold = true },

    -- Diffs
    DiffAdd = { bg = wash(c.green, 0.16) },
    DiffChange = { bg = wash(c.yellow, 0.12) },
    DiffDelete = { bg = wash(c.red, 0.16) },
    DiffText = { bg = wash(c.blue, 0.3), bold = true },
    DiffTextAdd = { bg = wash(c.green, 0.3), bold = true },

    -- Messages
    ErrorMsg = { fg = c.red, bold = true },
    WarningMsg = { fg = c.peach, bold = true },
    OkMsg = { fg = c.green, bold = true },
    StdoutMsg = { fg = c.fg },
    StderrMsg = { fg = c.coral },
    ModeMsg = { fg = accent, bold = true },
    MoreMsg = { fg = c.latte },
    MsgArea = { fg = c.fg },
    MsgSeparator = { fg = c.border, bg = float_bg },
    Question = { fg = accent, bold = true },

    -- Floating windows
    NormalFloat = { fg = c.fg, bg = float_bg },
    FloatBorder = { fg = accent, bg = float_bg },
    FloatTitle = { fg = accent, bg = float_bg, bold = true },
    FloatFooter = { fg = c.gray, bg = float_bg },
    FloatShadow = { bg = c.black, blend = 40 },
    FloatShadowThrough = { bg = c.black, blend = 80 },

    -- Completion popup
    Pmenu = { fg = c.silver, bg = menu_bg },
    PmenuSel = { fg = c.latte, bg = c.overlay, bold = true },
    PmenuKind = { fg = accent, bg = menu_bg },
    PmenuKindSel = { fg = accent, bg = c.overlay, bold = true },
    PmenuExtra = { fg = c.gray, bg = menu_bg },
    PmenuExtraSel = { fg = c.silver, bg = c.overlay },
    PmenuMatch = { fg = c.sky, bg = menu_bg, bold = true },
    PmenuMatchSel = { fg = c.cyan, bg = c.overlay, bold = true },
    PmenuSbar = { bg = c.bg_alt },
    PmenuThumb = { bg = c.border },
    PmenuBorder = { fg = c.border, bg = menu_bg },
    PmenuShadow = { bg = c.black, blend = 40 },
    PmenuShadowThrough = { bg = c.black, blend = 80 },
    WildMenu = { link = "PmenuSel" },
    ComplMatchIns = { fg = c.cyan },
    ComplHint = { fg = c.subtle, italic = true },
    ComplHintMore = { fg = c.subtle },
    PreInsert = { fg = c.subtle },

    -- Snippets
    SnippetTabstop = { bg = wash(accent, 0.2) },
    SnippetTabstopActive = { bg = wash(accent, 0.35), bold = true },

    -- Spelling
    SpellBad = { sp = c.red, undercurl = true },
    SpellCap = { sp = c.yellow, undercurl = true },
    SpellLocal = { sp = c.teal, undercurl = true },
    SpellRare = { sp = c.purple, undercurl = true },

    -- Statusline, tabline and winbar
    StatusLine = { fg = c.silver, bg = bar_bg },
    StatusLineNC = { fg = c.subtle, bg = bar_bg },
    StatusLineTerm = { fg = c.green, bg = bar_bg },
    StatusLineTermNC = { fg = U.darken(c.green, 0.6, c.bg), bg = bar_bg },
    TabLine = { fg = c.gray, bg = bar_bg },
    TabLineFill = { bg = bar_bg },
    TabLineSel = { fg = accent, bg = U.background(c.bg, o.transparent), bold = true },
    WinBar = { fg = c.latte, bg = U.background(c.bg, o.transparent), bold = true },
    WinBarNC = { fg = c.subtle, bg = inactive_bg },
    WinSeparator = { fg = c.border },
    VertSplit = { link = "WinSeparator" },

    -- Debugging, as used by `:h sign-support` and by debug adapters
    debugPC = { bg = wash(c.sky, 0.2) },
    debugBreakpoint = { fg = c.red, bg = wash(c.red, 0.2) },

    -- Graphical interfaces
    Menu = { fg = c.fg, bg = menu_bg },
    Scrollbar = { bg = c.border },
    Tooltip = { fg = c.fg, bg = float_bg },
  }
end

return M
