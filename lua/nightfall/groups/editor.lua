local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local Options = require("nightfall").Options
  local utils = require("nightfall.utils")

  return {
    -- Base Colors
    Normal = { fg = colors.foreground, bg = Options.transparent and colors.none or colors.background },
    NormalNC = {
      fg = colors.foreground,
      bg = Options.dim_inactive and utils.darken(colors.background, 0.8) or colors.background,
    },
    NormalSB = { fg = colors.foreground, bg = utils.darken(colors.background, 0.8) },

    -- UI Elements
    Pmenu = { bg = colors.bg_float },
    PmenuSbar = { bg = colors.dark_blue },
    PmenuSel = { fg = colors.black, bg = colors.lavender },
    PmenuThumb = { bg = colors.grey },
    FloatBorder = { fg = colors.dark_slate_blue, bg = colors.bg_float },
    NormalFloat = { bg = colors.bg_float },
    FloatTitle = { fg = colors.foreground, bg = colors.bg_float },
    TabLine = { fg = utils.lighten(colors.light_grey, 0.97), bg = utils.lighten(colors.statusline_bg, 0.99) },
    TabLineFill = { bg = colors.black },
    TabLineSel = { fg = colors.foreground, bg = colors.background, style = { bold = true } },
    StatusLine = { fg = colors.foreground, bg = colors.statusline_bg },
    StatusLineNC = { fg = colors.statusline_bg, bg = colors.statusline_bg },
    WinBar = { fg = colors.foreground, style = { bold = true } },
    WinBarNC = { fg = utils.lighten(colors.light_grey, 0.97) },

    -- Syntax Highlighting
    MatchWord = { fg = colors.ghost_white, bg = colors.grey },
    MatchParen = { fg = colors.lavender, style = { bold = true } },
    Directory = { fg = utils.vary_color({ maron = colors.green, deepernight = colors.nord_blue }, colors.pink) },
    Title = { fg = colors.pink, style = { bold = true } },
    ModeMsg = { fg = colors.foreground },
    MoreMsg = { fg = colors.light_cyan },
    SpecialKey = { fg = colors.dark_slate_blue },
    Visual = { bg = colors.deep_navy, style = { bold = true } },
    VisualNOS = { link = "Visual" },
    Whitespace = { fg = colors.dark_slate_blue },
    Conceal = { fg = colors.grey },
    NonText = { fg = colors.dark_slate_blue },
    ColorColumn = { bg = colors.dark_blue },
    SignColumn = { fg = colors.dark_slate_blue },
    WinSeparator = { fg = colors.dark_slate_blue },
    VertSplit = { fg = Options.transparent and colors.dark_navy or colors.dark_slate_blue },
    EndOfBuffer = { fg = colors.grey },
    Folded = { fg = colors.lavender, bg = colors.deep_navy },
    FoldColumn = { fg = colors.grey, bg = Options.transparent and colors.none or colors.background },

    -- Cursor and Line Numbers
    CursorLineNr = { fg = colors.lavender },
    LineNr = { fg = colors.grey },
    Cursor = { fg = colors.black, bg = colors.ghost_white },
    lCursor = { link = "Cursor" },
    CursorIM = { link = "Cursor" },
    CursorLine = { bg = colors.deep_navy },
    CursorColumn = { link = "CursorLine" },
    QuickFixLine = { bg = colors.dark_navy, sp = "none" },

    -- Search and Spell
    Search = { fg = colors.black, bg = utils.vary_color({ maron = colors.pale_yellow }, colors.violet) },
    IncSearch = { fg = colors.black, bg = colors.peach },
    CurSearch = { link = "IncSearch" },
    Substitute = { fg = colors.black, bg = colors.violet },
    SpellBad = { sp = colors.violet, style = { undercurl = true } },
    SpellLocal = { sp = colors.light_cyan, style = { undercurl = true } },
    SpellCap = { sp = colors.turquoise, style = { undercurl = true } },
    SpellRare = { sp = colors.pink, style = { undercurl = true } },

    -- Diff Colors
    DiffAdd = { bg = colors.added },
    DiffChange = { bg = colors.changed },
    DiffDelete = { bg = colors.deleted },
    DiffText = { bg = utils.darken(colors.ghost_white, 0.2, colors.background) },
    diffAdded = { fg = colors.green },
    diffRemoved = { fg = colors.red },
    diffChanged = { fg = colors.nord_blue },
    diffOldFile = { fg = colors.sand },
    diffNewFile = { fg = colors.peach },
    diffFile = { fg = colors.nord_blue },
    diffIndexLine = { fg = colors.turquoise },

    -- Error and Message Colors
    ErrorMsg = { fg = colors.violet, style = { bold = true, italic = true } },
    WarningMsg = { fg = colors.violet },
    Question = { fg = colors.violet },
  }
end

return M
