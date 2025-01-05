local M = {}

---@param colors NightfallPalette
---@param styles table
function M.get(colors, styles)
  local utils = require("nightfall.utils.colors")
  -- See: `:h group-name`
  return {
    Comment = { fg = colors.gray, style = styles.comments },
    Constant = {
      fg = utils.vary_color({
        nightfall = colors.magenta,
        ["deeper-night"] = colors.charcoal,
        maron = colors.sand,
      }, colors.cyan),
    },
    String = { fg = utils.vary_color({ nightfall = colors.yellow }, colors.blue) },
    Character = { fg = utils.vary_color({ nightfall = colors.peach }, colors.charcoal) },
    Number = { fg = utils.vary_color({ nightfall = colors.gold }, colors.brown) },
    Boolean = { fg = utils.vary_color({ nightfall = colors.magenta }, colors.sky) },
    Identifier = { fg = utils.vary_color({ nightfall = colors.azure }, colors.brown), style = styles.variables },
    Function = { fg = utils.vary_color({ nightfall = colors.green }, colors.blue) },
    Statement = { fg = utils.vary_color({ nightfall = colors.cyan }, colors.green) },
    Conditional = { fg = utils.vary_color({ nightfall = colors.magenta }, colors.pink) },
    Repeat = { fg = utils.vary_color({ nightfall = colors.rose }, colors.azure) },
    Label = { fg = utils.vary_color({ nightfall = colors.rose }, colors.rose) },
    Operator = { fg = utils.vary_color({ nightfall = colors.azure }, colors.sky) },
    Keyword = { fg = utils.vary_color({ nightfall = colors.pink }, colors.sky), style = styles.keywords },
    PreProc = { fg = utils.vary_color({ nightfall = colors.purple }, colors.pink) },
    Type = { fg = utils.vary_color({ nightfall = colors.yellow }, colors.yellow) },
    Special = { fg = utils.vary_color({ nightfall = colors.cyan }, colors.coral) },
    Delimiter = { fg = utils.vary_color({ nightfall = colors.rose }, colors.pink) },
    Error = { fg = colors.fg, bg = colors.red },
    Todo = { fg = colors.cream, bg = colors.sky },
    Added = { fg = colors.green },
    Changed = { fg = colors.yellow },
    Removed = { fg = colors.red },
  }
end

return M
