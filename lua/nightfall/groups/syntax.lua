--- Highlights for the language-agnostic syntax groups. See `:h group-name`.

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, styles = ctx.c, ctx.styles

  return {
    Comment = { fg = c.gray, style = styles.comments },
    Constant = {
      fg = ctx.vary({
        nightfall = c.magenta,
        ["deeper-night"] = c.cream,
        maron = c.coral,
      }, c.cyan),
    },
    String = {
      fg = ctx.vary({
        nightfall = c.yellow,
        ["deeper-night"] = c.yellow,
        maron = c.sand,
      }, c.blue),
      style = styles.strings,
    },
    Character = {
      fg = ctx.vary({
        nightfall = c.peach,
        ["deeper-night"] = c.purple,
        maron = c.cyan,
      }, c.purple),
      style = styles.characters,
    },
    Number = {
      fg = ctx.vary({ nightfall = c.gold }, c.teal),
      style = styles.numbers,
    },
    Boolean = {
      fg = ctx.vary({
        nightfall = c.blue,
        ["deeper-night"] = c.pink,
      }, c.sky),
      style = styles.booleans,
    },
    Identifier = {
      fg = ctx.vary({
        nightfall = c.latte,
        maron = c.peach,
      }, c.yellow),
      style = styles.variables,
    },
    Function = {
      fg = ctx.vary({
        nightfall = c.green,
        maron = c.lime,
      }, c.green),
      style = styles.functions,
    },
    Statement = {
      fg = ctx.vary({ nightfall = c.cyan, ["deeper-night"] = c.purple }, c.green),
    },
    Conditional = {
      fg = ctx.vary({
        nightfall = c.pink,
        ["deeper-night"] = c.purple,
      }, c.pink),
      style = styles.conditionals,
    },
    Repeat = {
      fg = ctx.vary({
        nightfall = c.cyan,
        ["deeper-night"] = c.cyan,
      }, c.cyan),
      style = styles.loops,
    },
    Label = { fg = ctx.vary({ nightfall = c.rose }, c.cream) },
    Operator = {
      fg = ctx.vary({ nightfall = c.latte }, c.cyan),
      style = styles.operators,
    },
    Keyword = {
      fg = ctx.vary({
        nightfall = c.pink,
        ["deeper-night"] = c.coral,
        maron = c.orange,
      }, c.rose),
      style = styles.keywords,
    },
    PreProc = { fg = ctx.vary({ nightfall = c.sky }, c.pink) },
    Type = {
      fg = ctx.vary({ nightfall = c.yellow }, c.cyan),
      style = styles.types,
    },
    Special = { fg = ctx.accent },
    Delimiter = { fg = ctx.vary({ nightfall = c.rose }, c.lavender) },
    Error = { fg = c.red },
    Todo = { fg = c.black, bg = c.sky },

    -- Diff summary groups, used by `:h diff` and by plugins showing hunks.
    Added = { fg = c.green },
    Changed = { fg = c.yellow },
    Removed = { fg = c.red },
  }
end

return M
