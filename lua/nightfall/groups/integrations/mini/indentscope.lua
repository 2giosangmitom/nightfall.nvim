--- mini.indentscope highlights.
local palette = require("nightfall.palette")
local M = {}

---@param c NightfallPalette
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, flavor)
  return {
    MiniIndentscopePrefix = { nocombine = true },
    MiniIndentscopeSymbol = { fg = palette.accent(c, flavor) },
    MiniIndentscopeSymbolOff = { fg = c.border },
  }
end

return M
