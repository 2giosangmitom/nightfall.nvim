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
        ["deeper-night"] = colors.cream,
        maron = colors.coral,
        nord = colors.sky,
      }, colors.cyan),
    },
    String = {
      fg = utils.vary_color({
        nightfall = colors.yellow,
        ["deeper-night"] = colors.yellow,
        maron = colors.sand,
        nord = colors.green,
      }, colors.blue),
    },
    Character = {
      fg = utils.vary_color({
        nightfall = colors.peach,
        ["deeper-night"] = colors.purple,
        maron = colors.cyan,
        nord = colors.lime,
      }, colors.purple),
      style = styles.characters,
    },
    Number = { fg = utils.vary_color({ nightfall = colors.gold, nord = colors.cream }, colors.teal) },
    Boolean = {
      fg = utils.vary_color({
        nightfall = colors.blue,
        ["deeper-night"] = colors.pink,
        nord = colors.rose,
      }, colors.sky),
      style = styles.booleans,
    },
    Identifier = {
      fg = utils.vary_color({
        nightfall = colors.latte,
        maron = colors.peach,
        nord = colors.white,
      }, colors.yellow),
      style = styles.variables,
    },
    Function = {
      fg = utils.vary_color({
        nightfall = colors.green,
        ["deeper-night"] = colors.sky,
        maron = colors.lime,
        nord = colors.blue,
      }, colors.sky),
      style = styles.functions,
    },
    Statement = {
      fg = utils.vary_color({
        nightfall = colors.cyan,
        ["deeper-night"] = colors.purple,
      }, colors.green),
    },
    Conditional = {
      fg = utils.vary_color({
        nightfall = colors.pink,
        ["deeper-night"] = colors.purple,
        nord = colors.magenta,
      }, colors.pink),
      style = styles.conditionals,
    },
    Repeat = {
      fg = utils.vary_color({
        nightfall = colors.cyan,
        ["deeper-night"] = colors.cyan,
        nord = colors.yellow,
      }, colors.cyan),
      style = styles.loops,
    },
    Label = { fg = utils.vary_color({ nightfall = colors.rose }, colors.cream) },
    Operator = {
      fg = utils.vary_color({ nightfall = colors.latte }, colors.cyan),
      style = styles.operators,
    },
    Keyword = {
      fg = utils.vary_color({
        nightfall = colors.pink,
        ["deeper-night"] = colors.coral,
        maron = colors.orange,
        nord = colors.purple,
      }, colors.coral),
      style = styles.keywords,
    },
    PreProc = { fg = utils.vary_color({ nightfall = colors.sky }, colors.pink) },
    Type = { fg = utils.vary_color({ nightfall = colors.yellow, nord = colors.yellow }, colors.cyan) },
    Special = {
      fg = utils.vary_color({
        nightfall = colors.cyan,
        ["deeper-night"] = colors.sky,
        maron = colors.sand,
        nord = colors.teal,
      }, colors.coral),
    },
    Delimiter = { fg = utils.vary_color({ nightfall = colors.rose }, colors.lavender) },
    Error = { fg = colors.red },
    Todo = { fg = colors.black, bg = colors.sky },

    -- Diff
    Added = { fg = colors.green },
    Changed = { fg = colors.yellow },
    Removed = { fg = colors.red },
  }
end

return M
