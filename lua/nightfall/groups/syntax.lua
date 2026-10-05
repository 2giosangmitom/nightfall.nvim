--- Highlights for the language-agnostic syntax groups. See `:h group-name`.

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

-- Palette keys for the syntax groups whose colors differ between flavors.
local FLAVOR_COLORS = {
  nightfall = {
    Constant = "purple",
    String = "yellow",
    Character = "peach",
    Number = "lavender",
    Boolean = "lavender",
    Identifier = "latte",
    Function = "teal",
    Statement = "pink",
    Conditional = "pink",
    Repeat = "green",
    Operator = "silver",
    Keyword = "pink",
    Exception = "coral",
    PreProc = "sky",
    Include = "pink",
    Type = "blue",
    StorageClass = "cyan",
    Special = "cyan",
    SpecialChar = "coral",
    Tag = "magenta",
    Delimiter = "silver",
  },
  ["deeper-night"] = {
    Constant = "cream",
    String = "yellow",
    Character = "purple",
    Number = "teal",
    Boolean = "pink",
    Identifier = "yellow",
    Function = "green",
    Statement = "purple",
    Conditional = "purple",
    Repeat = "cyan",
    Operator = "yellow",
    Keyword = "coral",
    Exception = "blue",
    PreProc = "pink",
    Include = "cyan",
    Type = "cyan",
    StorageClass = "cyan",
    Special = "sky",
    SpecialChar = "coral",
    Tag = "magenta",
    Delimiter = "lavender",
  },
  maron = {
    Constant = "coral",
    String = "sand",
    Character = "cyan",
    Number = "teal",
    Boolean = "sky",
    Identifier = "peach",
    Function = "lime",
    Statement = "green",
    Conditional = "pink",
    Repeat = "cyan",
    Operator = "yellow",
    Keyword = "orange",
    Exception = "blue",
    PreProc = "pink",
    Include = "cyan",
    Type = "cyan",
    StorageClass = "cyan",
    Special = "lavender",
    SpecialChar = "coral",
    Tag = "magenta",
    Delimiter = "lavender",
  },
  winter = {
    Constant = "purple",
    String = "green",
    Character = "cyan",
    Number = "orange",
    Boolean = "magenta",
    Identifier = "fg",
    Function = "teal",
    Statement = "magenta",
    Conditional = "purple",
    Repeat = "teal",
    Operator = "silver",
    Keyword = "purple",
    Exception = "red",
    PreProc = "blue",
    Include = "cyan",
    Type = "blue",
    StorageClass = "purple",
    Special = "cyan",
    SpecialChar = "orange",
    Tag = "rose",
    Delimiter = "silver",
  },
}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local styles = o.styles or {}
  local keys = FLAVOR_COLORS[flavor]
  local fg = {}
  for group, key in pairs(keys) do
    fg[group] = c[key]
  end

  return {
    Comment = { fg = c.gray, style = styles.comments },
    SpecialComment = { fg = U.lighten(c.gray, 0.7, c.silver), style = styles.comments },

    Constant = { fg = fg.Constant, style = styles.constants },
    String = { fg = fg.String, style = styles.strings },
    Character = { fg = fg.Character, style = styles.characters },
    Number = { fg = fg.Number, style = styles.numbers },
    Float = { link = "Number" },
    Boolean = {
      fg = fg.Boolean,
      style = styles.booleans,
    },

    Identifier = {
      fg = fg.Identifier,
      style = styles.variables,
    },
    Function = { fg = fg.Function, style = styles.functions },

    Statement = { fg = fg.Statement },
    Conditional = { fg = fg.Conditional, style = styles.conditionals },
    Repeat = { fg = fg.Repeat, style = styles.loops },
    Label = { fg = c.coral },
    Operator = { fg = fg.Operator, style = styles.operators },
    Keyword = {
      fg = fg.Keyword,
      style = styles.keywords,
    },
    Exception = { fg = fg.Exception, style = styles.exceptions },

    PreProc = { fg = fg.PreProc },
    Include = { fg = fg.Include },
    Define = { link = "PreProc" },
    Macro = { link = "PreProc" },
    PreCondit = { link = "PreProc" },

    Type = { fg = fg.Type, style = styles.types },
    StorageClass = { fg = fg.StorageClass },
    Structure = { fg = fg.Type },
    Typedef = { link = "Type" },

    Special = { fg = fg.Special },
    SpecialChar = { fg = fg.SpecialChar },
    Tag = { fg = fg.Tag },
    Delimiter = { fg = fg.Delimiter },
    Debug = { fg = flavor == "winter" and c.magenta or c.purple },

    Underlined = { fg = palette.accent(c, flavor), underline = true },
    Ignore = { fg = c.subtle },
    Error = { fg = c.red },
    Todo = { fg = palette.on_accent(c, flavor), bg = c.sky, bold = true },

    -- Diff summary groups, used by `:h diff` and by plugins showing hunks.
    Added = { fg = c.green },
    Changed = { fg = c.yellow },
    Removed = { fg = c.red },
  }
end

return M
