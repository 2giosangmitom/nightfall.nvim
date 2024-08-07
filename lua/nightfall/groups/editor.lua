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
    PmenuSel = { bg = colors.lavender, fg = colors.black },
    PmenuThumb = { bg = colors.grey },
    FloatBorder = { fg = colors.dark_slate_blue, bg = colors.bg_float },
    NormalFloat = { bg = colors.bg_float },
    FloatTitle = { fg = colors.foreground, bg = colors.bg_float },
    TabLine = { bg = colors.statusline_bg, fg = colors.foreground },
    TabLineFill = { bg = colors.black },
    TabLineSel = { fg = colors.black, bg = colors.dark_blue },
    StatusLine = { fg = colors.foreground, bg = colors.statusline_bg },
    StatusLineNC = { fg = colors.statusline_bg, bg = colors.statusline_bg },

    -- Syntax Highlighting
    MatchWord = { bg = colors.grey, fg = colors.ghost_white },
    MatchParen = { fg = colors.lavender, style = { bold = true } },
    Directory = { fg = utils.vary_color({ maron = colors.green, deepernight = colors.nord_blue }, colors.pink) },
    ModeMsg = { fg = colors.foreground },
    SpecialKey = { fg = colors.dark_slate_blue },
    Visual = { bg = colors.deep_navy, style = { bold = true } },
    VisualNOS = { link = "Visual" },
    WarningMsg = { fg = colors.violet },
    WildMenu = { fg = colors.violet, bg = colors.sky },
    Whitespace = { fg = colors.dark_slate_blue },
    Conceal = { fg = colors.grey },
    NonText = { fg = colors.dark_slate_blue },
    SignColumn = { fg = colors.dark_slate_blue },
    WinSeparator = { fg = colors.dark_slate_blue },
    VertSplit = { fg = Options.transparent and colors.dark_navy or colors.dark_slate_blue },
    EndOfBuffer = { fg = colors.grey },
    Folded = { fg = colors.lavender, bg = colors.deep_navy },
    FoldColumn = { bg = Options.transparent and colors.none or colors.background, fg = colors.grey },

    -- Cursor and Line Numbers
    CursorLineNr = { fg = colors.lavender },
    LineNr = { fg = colors.grey },
    Cursor = { fg = colors.black, bg = colors.ghost_white },
    lCursor = { link = "Cursor" },
    CursorIM = { link = "Cursor" },
    CursorLine = { bg = colors.deep_navy },
    CursorColumn = { bg = colors.dark_navy },
    QuickFixLine = { bg = colors.dark_navy, sp = "none" },

    -- Search and Spell
    Search = { bg = utils.vary_color({ maron = colors.pale_yellow }, colors.violet), fg = colors.black },
    IncSearch = { bg = colors.peach, fg = colors.black },
    CurSearch = { link = "IncSearch" },
    Substitute = { fg = colors.black, bg = colors.violet },
    SpellBad = { sp = colors.violet, style = { undercurl = true } },
    SpellLocal = { sp = colors.light_cyan, style = { undercurl = true } },
    SpellCap = { sp = colors.turquoise, style = { undercurl = true } },
    SpellRare = { sp = colors.pink, style = { undercurl = true } },
    healthSuccess = { bg = colors.green, fg = colors.black },

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
    Question = { fg = colors.violet },
  }
end

return M
