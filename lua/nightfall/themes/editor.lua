local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local Options = require("nightfall").Options
  local utils = require("nightfall.utils")

  return {
    -- Base Colors
    Normal = { fg = colors.foreground, bg = Options.transparent and colors.none or colors.background }, -- Default text background
    NormalNC = {
      fg = colors.foreground,
      bg = Options.dim_inactive and utils.darken(colors.background, 0.8) or colors.background,
    }, -- Non-current buffer text background
    NormalSB = { fg = colors.foreground, bg = utils.darken(colors.background, 0.8) }, -- Normal text in sidebar

    -- UI Elements
    Pmenu = { bg = colors.dark_blue }, -- Popup menu background
    PmenuSbar = { bg = colors.dark_blue }, -- Popup menu scrollbar background
    PmenuSel = { bg = colors.lavender, fg = colors.black }, -- Selected popup menu item background
    PmenuThumb = { bg = colors.grey }, -- Popup menu thumb background
    FloatBorder = { fg = colors.dark_slate_blue, bg = colors.background }, -- Floating window border colors
    NormalFloat = { bg = utils.darken(colors.background, 0.8) }, -- Floating window text background
    FloatTitle = { fg = colors.foreground, bg = colors.background }, -- Floating window title colors
    TabLine = { bg = colors.statusline_bg, fg = colors.foreground }, -- Tabline colors
    TabLineFill = { bg = colors.black }, -- Tabline fill color
    TabLineSel = { fg = colors.black, bg = colors.dark_blue }, -- Selected tabline item colors
    StatusLine = { fg = colors.foreground, bg = colors.statusline_bg }, -- Statusline colors
    StatusLineNC = { fg = colors.statusline_bg, bg = colors.statusline_bg }, -- Non-current buffer statusline colors

    -- Syntax Highlighting
    MatchWord = { bg = colors.grey, fg = colors.ghost_white }, -- Background and foreground color for matching words
    MatchParen = { fg = colors.lavender, style = { bold = true } }, -- Color for matching parentheses
    Directory = { fg = colors.pink }, -- Color for directory names
    ModeMsg = { fg = colors.black }, -- Color for mode messages
    SpecialKey = { fg = colors.dark_slate_blue }, -- Color for special keys
    Visual = { bg = colors.deep_navy, style = { bold = true } }, -- Color for visual selection
    VisualNOS = { link = "Visual" }, -- Linked to Visual
    WarningMsg = { fg = colors.violet }, -- Color for warning messages
    WildMenu = { fg = colors.violet, bg = colors.sky }, -- Color for wild menu
    Whitespace = { fg = colors.dark_slate_blue }, -- Color for whitespace characters
    Conceal = { fg = colors.grey }, -- Color for concealed characters
    NonText = { fg = colors.dark_slate_blue }, -- Color for non-text characters
    SignColumn = { fg = colors.dark_slate_blue }, -- Color for sign column
    WinSeparator = { fg = colors.dark_slate_blue }, -- Color for window separator
    VertSplit = { fg = Options.transparent and colors.dark_navy or colors.dark_slate_blue }, -- Color for vertical split line
    EndOfBuffer = { fg = colors.grey }, -- Color for end of buffer
    Folded = { fg = colors.lavender, bg = colors.deep_navy },
    FoldColumn = { bg = Options.transparent and colors.none or colors.background, fg = colors.grey },

    -- Cursor and Line Numbers
    CursorLineNr = { fg = colors.lavender }, -- Color for line numbers in the cursor line
    LineNr = { fg = colors.grey }, -- Color for line numbers
    Cursor = { fg = colors.black, bg = colors.ghost_white }, -- Color for cursor
    lCursor = { link = "Cursor" }, -- Linked to Cursor
    CursorIM = { link = "Cursor" }, -- Linked to Cursor
    CursorLine = { bg = colors.deep_navy }, -- Color for cursor line background
    CursorColumn = { bg = colors.dark_navy }, -- Color for cursor column background
    QuickFixLine = { bg = colors.dark_navy, sp = "none" }, -- Color for quickfix line

    -- Search and Spell
    Search = { bg = colors.violet, fg = colors.black }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = colors.peach, fg = colors.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = { link = "IncSearch" },
    Substitute = { fg = colors.black, bg = colors.violet }, -- Color for substitution
    SpellBad = { sp = colors.violet, style = { undercurl = true } }, -- Color for bad spelling
    SpellLocal = { sp = colors.light_cyan, style = { undercurl = true } }, -- Color for local spelling
    SpellCap = { sp = colors.turquoise, style = { undercurl = true } }, -- Color for capitalization in spelling
    SpellRare = { sp = colors.pink, style = { undercurl = true } }, -- Color for rare words in spelling
    healthSuccess = { bg = colors.green, fg = colors.black }, -- Color for health success

    -- Diff Colors
    DiffAdd = { bg = utils.darken(colors.green, 0.12, colors.background) }, -- Color for added lines in diff
    DiffChange = { bg = utils.darken(colors.pale_yellow, 0.02, colors.background) }, -- Color for changed lines in diff
    DiffDelete = { bg = utils.darken(colors.red, 0.12, colors.background) }, -- Color for deleted lines in diff
    DiffText = { bg = utils.darken(colors.ghost_white, 0.2, colors.background) }, -- Color for diff text
    diffAdded = { fg = colors.green }, -- Color for added lines in diff
    diffRemoved = { fg = colors.red }, -- Color for removed lines in diff
    diffChanged = { fg = colors.pale_yellow }, -- Color for changed lines in diff
    diffOldFile = { fg = colors.peach }, -- Color for old file in diff
    diffNewFile = { fg = colors.pink }, -- Color for new file in diff
    diffFile = { fg = colors.nord_blue }, -- Color for file in diff
    diffLine = { fg = colors.dark_navy }, -- Color for line in diff
    diffIndexLine = { fg = colors.violet }, -- Color for index line in diff

    -- Error and Message Colors
    ErrorMsg = { fg = colors.violet, style = { bold = true, italic = true } }, -- Color for error messages
    Question = { fg = colors.violet }, -- Color for questions
  }
end

return M
