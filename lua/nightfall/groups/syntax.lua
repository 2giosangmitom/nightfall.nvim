local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local Options = require("nightfall").Options
  local utils = require("nightfall.utils")

  return {
    -- Text Styles
    Bold = { style = { bold = true } },
    Underlined = { style = { underline = true } },
    Italic = { style = { italic = true } },

    -- Syntax Highlighting
    Comment = { fg = utils.lighten(colors.light_grey, 0.9), style = Options.styles.comments },
    Special = {
      fg = utils.vary_color({ deepernight = colors.light_cyan, maron = colors.nord_blue }, colors.pale_yellow),
    },
    Constant = { fg = utils.vary_color({ nightfall = colors.violet }, colors.red) },
    String = {
      fg = utils.vary_color({ maron = colors.pale_yellow }, colors.pale_yellow),
      style = Options.styles.strings or {},
    },
    Character = { fg = colors.violet },
    Number = { fg = colors.peach, style = Options.styles.numbers or {} },
    Float = { link = "Number" },
    Boolean = { fg = colors.peach, style = Options.styles.booleans or {} },
    Identifier = {
      fg = utils.vary_color({ maron = colors.ghost_white, deepernight = colors.pale_yellow }, colors.foreground),
      style = Options.styles.variables or {},
    },
    Function = {
      fg = utils.vary_color({ maron = colors.green, deepernight = colors.sky }, colors.turquoise),
      style = Options.styles.functions or {},
    },
    Statement = { fg = colors.violet },
    Conditional = {
      fg = utils.vary_color({ deepernight = colors.violet }, colors.pink),
      style = Options.styles.conditionals or {},
    },
    Repeat = { fg = colors.light_cyan, style = Options.styles.loops or {} },
    Label = { fg = utils.vary_color({ maron = colors.nord_blue }, colors.sky) },
    Operator = { fg = colors.ghost_white, style = Options.styles.operators or {} },
    Keyword = {
      fg = utils.vary_color({ maron = colors.peach, deepernight = colors.red }, colors.pink),
      style = Options.styles.keywords or {},
    },
    Exception = { fg = colors.pink, style = Options.styles.keywords or {} },

    -- Preprocessor Directives
    PreProc = { fg = colors.pink },
    Include = { fg = colors.turquoise, style = Options.styles.keywords or {} },
    Define = { link = "PreProc" },
    Macro = { fg = colors.turquoise },
    PreCondit = { link = "PreProc" },

    -- Type Definitions and Declarations
    StorageClass = { fg = colors.pale_yellow },
    Structure = { fg = colors.pink },
    Type = {
      fg = utils.vary_color({ deepernight = colors.light_cyan }, colors.pale_yellow),
      style = Options.styles.types or {},
    },
    Typedef = { fg = colors.sky },

    -- Special Characters and Tags
    SpecialChar = { fg = colors.lavender },
    Tag = { fg = colors.light_cyan, style = { bold = true } },
    Delimiter = { fg = colors.lavender },
    Debug = { link = "Special" },

    -- Error and Warning
    Error = { fg = colors.red },
    Todo = { fg = colors.background, bg = colors.pink, style = { bold = true } },
  }
end

return M
