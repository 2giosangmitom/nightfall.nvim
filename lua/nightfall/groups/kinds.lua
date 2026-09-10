--- The color of each LSP completion item kind.
---
--- blink.cmp, nvim-cmp and the pickers all show the same kinds under different
--- group prefixes, so the colors live here once and each integration prefixes
--- them with the name its plugin expects.

local M = {}

--- Completion item kinds, in the order the LSP specification lists them.
---@type string[]
M.names = {
  "Text",
  "Method",
  "Function",
  "Constructor",
  "Field",
  "Variable",
  "Class",
  "Interface",
  "Module",
  "Property",
  "Unit",
  "Value",
  "Enum",
  "Keyword",
  "Snippet",
  "Color",
  "File",
  "Reference",
  "Folder",
  "EnumMember",
  "Constant",
  "Struct",
  "Event",
  "Operator",
  "TypeParameter",
}

--- The color of every kind, keyed by kind name.
---@param ctx NightfallCtx
---@return table<string,string>
function M.colors(ctx)
  local c, role = ctx.c, ctx.role

  return {
    Text = c.silver,
    Method = role("func"),
    Function = role("func"),
    Constructor = role("constructor"),
    Field = role("property"),
    Variable = role("identifier"),
    Class = role("type"),
    Interface = role("type"),
    Module = role("module"),
    Property = role("property"),
    Unit = role("number"),
    Value = role("number"),
    Enum = role("type"),
    Keyword = role("keyword"),
    Snippet = c.magenta,
    Color = c.cyan,
    File = c.sky,
    Reference = c.lime,
    Folder = c.gold,
    EnumMember = role("constant"),
    Constant = role("constant"),
    Struct = role("type"),
    Event = c.orange,
    Operator = role("operator"),
    TypeParameter = role("type_builtin"),
  }
end

--- One highlight group per kind, named `<prefix><Kind>`.
---@param ctx NightfallCtx
---@param prefix string Group name prefix, such as `"BlinkCmpKind"`.
---@return table<string,table>
function M.groups(ctx, prefix)
  local colors = M.colors(ctx)
  local result = {}

  for _, name in ipairs(M.names) do
    result[prefix .. name] = { fg = colors[name] }
  end

  return result
end

return M
