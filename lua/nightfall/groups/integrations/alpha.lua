--- https://github.com/goolord/alpha-nvim

local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)

  return {
    AlphaHeader = { fg = accent, bold = true },
    AlphaHeaderLabel = { fg = c.gold },
    AlphaButtons = { fg = c.fg },
    AlphaShortcut = { fg = flavor == "deeper-night" and c.pink or flavor == "maron" and c.cyan or c.yellow },
    AlphaFooter = { fg = c.gray, italic = true },
  }
end

return M
