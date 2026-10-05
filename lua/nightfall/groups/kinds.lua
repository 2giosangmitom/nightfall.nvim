--- The color of each LSP completion item kind.
---
--- blink.cmp, nvim-cmp and the pickers all show the same kinds under different
--- group prefixes, so the colors live here once and each integration prefixes
--- them with the name its plugin expects.

local M = {}

--- The color of every kind, keyed by kind name.
---@param c NightfallPalette
---@param flavor NightfallFlavor
---@return table<string,string>
function M.colors(c, flavor)
  local deeper = flavor == "deeper-night"
  local maron = flavor == "maron"
  local winter = flavor == "winter"
  local function_fg = deeper and c.green or maron and c.lime or c.teal
  local property = maron and c.peach or winter and c.blue or c.lavender
  local type_fg = (deeper or maron) and c.cyan or c.blue
  local number = flavor == "nightfall" and c.lavender or winter and c.orange or c.teal
  local constant = deeper and c.cream or maron and c.coral or c.purple

  return {
    Text = c.silver,
    Method = function_fg,
    Function = function_fg,
    Constructor = winter and c.blue or c.cyan,
    Field = property,
    Variable = deeper and c.yellow or maron and c.peach or winter and c.fg or c.latte,
    Class = type_fg,
    Interface = type_fg,
    Module = winter and c.teal or c.cream,
    Property = property,
    Unit = number,
    Value = number,
    Enum = type_fg,
    Keyword = deeper and c.coral or maron and c.orange or winter and c.purple or c.pink,
    Snippet = c.magenta,
    Color = c.cyan,
    File = c.sky,
    Reference = c.lime,
    Folder = c.gold,
    EnumMember = constant,
    Constant = constant,
    Struct = type_fg,
    Event = c.orange,
    Operator = (deeper or maron) and c.yellow or c.silver,
    TypeParameter = (deeper or maron) and c.cyan or c.sky,
  }
end

--- One highlight group per kind, named `<prefix><Kind>`.
---@param c NightfallPalette
---@param flavor NightfallFlavor
---@param prefix string Group name prefix, such as `"BlinkCmpKind"`.
---@return table<string,table>
function M.groups(c, flavor, prefix)
  local result = {}

  for name, fg in pairs(M.colors(c, flavor)) do
    result[prefix .. name] = { fg = fg }
  end

  return result
end

return M
