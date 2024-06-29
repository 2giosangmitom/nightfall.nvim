local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local Options = require("nightfall").Options
  local utils = require("nightfall.utils")

  -- Define color groups with descriptions
  return {
    -- Text Styles
    Bold = { style = { bold = true } }, -- Bold text style
    Underlined = { style = { underline = true } }, -- Underlined text style
    Italic = { style = { italic = true } }, -- Italic text style

    -- Syntax Highlighting
    Comment = { fg = utils.lighten(colors.light_grey, 0.9), style = Options.styles.comments }, -- Comment text
    Special = { fg = colors.light_cyan }, -- Special text
    Constant = { fg = colors.violet }, -- Constant text
    String = { fg = colors.pale_yellow, style = Options.styles.strings or {} }, -- String text
    Character = { fg = colors.violet }, -- Character text
    Number = { fg = colors.peach, style = Options.styles.numbers or {} }, -- Number text
    Float = { link = "Number" }, -- Linked to Number
    Boolean = { fg = colors.peach, style = Options.styles.booleans or {} }, -- Boolean text
    Identifier = { fg = colors.foreground, style = Options.styles.variables or {} }, -- Identifier text
    Function = { fg = colors.turquoise, style = Options.styles.functions or {} }, -- Function text
    Statement = { fg = colors.violet }, -- Statement text
    Conditional = { fg = colors.pink, style = Options.styles.conditionals or {} }, -- Conditional statement text
    Repeat = { fg = colors.light_cyan, style = Options.styles.loops or {} }, -- Repeat statement text
    Label = { fg = colors.sky }, -- Label text
    Operator = { fg = colors.ghost_white, style = Options.styles.operators or {} }, -- Operator text
    Keyword = { fg = utils.vary_color({ maron = colors.red }, colors.pink), style = Options.styles.keywords or {} }, -- Keyword text
    Exception = { fg = colors.pink, style = Options.styles.keywords or {} }, -- Exception text

    -- Preprocessor Directives
    PreProc = { fg = colors.pink }, -- Preprocessor directive text
    Include = { fg = colors.turquoise, style = Options.styles.keywords or {} }, -- Include directive text
    Define = { link = "PreProc" }, -- Linked to PreProc
    Macro = { fg = colors.turquoise }, -- Macro directive text
    PreCondit = { link = "PreProc" }, -- Linked to PreProc

    -- Type Definitions and Declarations
    StorageClass = { fg = colors.pale_yellow }, -- Storage class text
    Structure = { fg = colors.pink }, -- Structure text
    Type = { fg = colors.pale_yellow, style = Options.styles.types or {} }, -- Type text
    Typedef = { fg = colors.sky }, -- Typedef text

    -- Special Characters and Tags
    SpecialChar = { fg = colors.lavender }, -- Special character text
    Tag = { fg = colors.light_cyan, style = { bold = true } }, -- Tag text
    Delimiter = { fg = colors.lavender }, -- Delimiter text
    Debug = { link = "Special" }, -- Linked to Special (Debug text)

    -- Error and Warning
    Error = { fg = colors.red }, -- Error text
    Todo = { bg = colors.pink, fg = colors.background, style = { bold = true } }, -- Todo text
  }
end

return M
