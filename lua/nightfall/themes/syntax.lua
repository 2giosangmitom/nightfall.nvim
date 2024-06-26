local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local Options = require("nightfall").Options
  local utils = require("nightfall.utils")
  return {
    Bold = { style = { bold = true } },
    Comment = { fg = utils.lighten(colors.light_grey, 0.9), style = Options.styles.comments },
    Special = { fg = colors.light_cyan },
    SpecialComment = { link = "Special" },
    Constant = { fg = colors.violet },
    String = { fg = colors.pale_yellow, style = Options.styles.strings or {} },
    Character = { fg = colors.violet },
    Number = { fg = colors.peach, style = Options.styles.numbers or {} },
    Float = { link = "Number" },
    Boolean = { fg = colors.peach, style = Options.styles.booleans or {} },
    Identifier = { fg = colors.foreground, style = Options.styles.variables or {} },
    Function = { fg = colors.turquoise, style = Options.styles.functions or {} },
    Statement = { fg = colors.violet },
    Conditional = { fg = colors.pink, style = Options.styles.conditionals or {} },
    Repeat = { fg = colors.light_cyan, style = Options.styles.loops or {} },
    Label = { fg = colors.sky },
    Operator = { fg = colors.ghost_white, style = Options.styles.operators or {} },
    Keyword = { fg = colors.pink, style = Options.styles.keywords or {} },
    Exception = { fg = colors.pink, style = Options.styles.keywords or {} },

    PreProc = { fg = colors.pink },
    Include = { fg = colors.turquoise, style = Options.styles.keywords or {} },
    Define = { link = "PreProc" },
    Macro = { fg = colors.turquoise },
    PreCondit = { link = "PreProc" },

    StorageClass = { fg = colors.pale_yellow },
    Structure = { fg = colors.pink },
    Type = { fg = colors.pale_yellow, style = Options.styles.types or {} },
    Typedef = { fg = colors.sky },
    SpecialChar = { fg = colors.lavender },
    Tag = { fg = colors.light_cyan, style = { bold = true } },
    Delimiter = { fg = colors.lavender },
    Debug = { link = "Special" },

    Underlined = { style = { underline = true } },
    Italic = { style = { italic = true } },

    Error = { fg = colors.red },
    Todo = { bg = colors.pink, fg = colors.background, style = { bold = true } },
  }
end

return M
