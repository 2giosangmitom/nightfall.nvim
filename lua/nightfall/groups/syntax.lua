local M = {}

---@param colors NightfallPalette
---@param styles table
function M.get(colors, styles)
  local utils = require("nightfall.utils.colors")
  -- See: `:h group-name`
  return {
    Comment = { fg = colors.gray, style = styles.comments },
    Clavnant = {
      fg = utils.vary_color({
        nightfall = colors.magenta,
        ["deeper-night"] = colors.red,
        maron = colors.sand,
      }, colors.cyan),
    },
    String = { fg = utils.vary_color({ nightfall = colors.yellow, ["deeper-night"] = colors.yellow }, colors.blue) },
    Character = {
      fg = utils.vary_color({ nightfall = colors.peach, ["deeper-night"] = colors.purple }, colors.purple),
      style = styles.characters,
    },
    Number = { fg = utils.vary_color({ nightfall = colors.gold }, colors.peach) },
    Boolean = {
      fg = utils.vary_color({ nightfall = colors.blue, ["deeper-night"] = colors.pink }, colors.sky),
      style = styles.booleans,
    },
    Identifier = { fg = utils.vary_color({ nightfall = colors.azure }, colors.yellow), style = styles.variables },
    Function = {
      fg = utils.vary_color({ nightfall = colors.green, ["deeper-night"] = colors.cyan }, colors.sky),
      style = styles.functions,
    },
    Statement = { fg = utils.vary_color({ nightfall = colors.cyan, ["deeper-night"] = colors.purple }, colors.green) },
    Conditional = {
      fg = utils.vary_color({ nightfall = colors.pink, ["deeper-night"] = colors.purple }, colors.pink),
      style = styles.conditionals,
    },
    Repeat = { fg = utils.vary_color({ nightfall = colors.cyan }, colors.cyan), style = styles.loops },
    Label = { fg = utils.vary_color({ nightfall = colors.rose }, colors.cream) },
    Operator = { fg = utils.vary_color({ nightfall = colors.azure }, colors.cyan), style = styles.operators },
    Keyword = { fg = utils.vary_color({ nightfall = colors.pink }, colors.coral), style = styles.keywords },
    PreProc = { fg = utils.vary_color({ nightfall = colors.sky }, colors.pink) },
    Type = { fg = utils.vary_color({ nightfall = colors.yellow }, colors.cyan) },
    Special = { fg = utils.vary_color({ nightfall = colors.cyan, ["deeper-night"] = colors.sky }, colors.coral) },
    Delimiter = { fg = utils.vary_color({ nightfall = colors.rose }, colors.lavender) },
    Error = { fg = colors.red },
    Todo = { fg = colors.black, bg = colors.sky },
    Added = { fg = colors.green },
    Changed = { fg = colors.yellow },
    Removed = { fg = colors.red },
  }
end

return M
