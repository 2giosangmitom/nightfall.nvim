--- https://github.com/lukas-reineke/indent-blankline.nvim

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  return {
    IblIndent = { fg = U.blend(c.border, c.bg, 0.6) },
    IblWhitespace = { fg = U.blend(c.border, c.bg, 0.6) },
    IblScope = { fg = palette.accent(c, flavor) },
  }
end

return M
