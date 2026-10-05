--- Indent guides.
local U = require("nightfall.color")
local palette = require("nightfall.palette")
local M = {}

---@param c NightfallPalette
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, flavor)
  local accent = palette.accent(c, flavor)
  return {
    SnacksIndent = { fg = U.blend(c.border, c.bg, 0.6) },
    SnacksIndentBlank = { fg = U.blend(c.border, c.bg, 0.6) },
    SnacksIndentScope = { fg = accent },
    SnacksIndentChunk = { fg = accent },
  }
end

return M
