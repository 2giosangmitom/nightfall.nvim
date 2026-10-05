--- Highlights for the language-agnostic syntax groups. See `:h group-name`.

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local styles = o.styles or {}
  local deeper = flavor == "deeper-night"
  local maron = flavor == "maron"
  local winter = flavor == "winter"
  local type_fg = (deeper or maron) and c.cyan or c.blue

  return {
    Comment = { fg = c.gray, style = styles.comments },
    SpecialComment = { fg = U.lighten(c.gray, 0.7, c.silver), style = styles.comments },

    Constant = { fg = deeper and c.cream or maron and c.coral or c.purple, style = styles.constants },
    String = { fg = maron and c.sand or winter and c.green or c.yellow, style = styles.strings },
    Character = { fg = flavor == "nightfall" and c.peach or deeper and c.purple or c.cyan, style = styles.characters },
    Number = { fg = flavor == "nightfall" and c.lavender or winter and c.orange or c.teal, style = styles.numbers },
    Float = { link = "Number" },
    Boolean = {
      fg = deeper and c.pink or maron and c.sky or winter and c.magenta or c.lavender,
      style = styles.booleans,
    },

    Identifier = {
      fg = deeper and c.yellow or maron and c.peach or winter and c.fg or c.latte,
      style = styles.variables,
    },
    Function = { fg = deeper and c.green or maron and c.lime or c.teal, style = styles.functions },

    Statement = { fg = deeper and c.purple or maron and c.green or winter and c.magenta or c.pink },
    Conditional = { fg = (deeper or winter) and c.purple or c.pink, style = styles.conditionals },
    Repeat = { fg = flavor == "nightfall" and c.green or winter and c.teal or c.cyan, style = styles.loops },
    Label = { fg = c.coral },
    Operator = { fg = (deeper or maron) and c.yellow or c.silver, style = styles.operators },
    Keyword = {
      fg = deeper and c.coral or maron and c.orange or winter and c.purple or c.pink,
      style = styles.keywords,
    },
    Exception = { fg = flavor == "nightfall" and c.coral or winter and c.red or c.blue, style = styles.exceptions },

    PreProc = { fg = flavor == "nightfall" and c.sky or winter and c.blue or c.pink },
    Include = { fg = flavor == "nightfall" and c.pink or c.cyan },
    Define = { link = "PreProc" },
    Macro = { link = "PreProc" },
    PreCondit = { link = "PreProc" },

    Type = { fg = type_fg, style = styles.types },
    StorageClass = { fg = winter and c.purple or c.cyan },
    Structure = { fg = type_fg },
    Typedef = { link = "Type" },

    Special = { fg = deeper and c.sky or maron and c.lavender or c.cyan },
    SpecialChar = { fg = winter and c.orange or c.coral },
    Tag = { fg = winter and c.rose or c.magenta },
    Delimiter = { fg = (deeper or maron) and c.lavender or c.silver },
    Debug = { fg = winter and c.magenta or c.purple },

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
