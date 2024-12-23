local M = {}

---@param palettes table<NightfallFlavor,NightfallPalette>
---@param default NightfallPalette
---@return NightfallPalette: The selected color based on flavor name
function M.vary_color(palettes, default)
  local flavor = require("nightfall").flavor
  return palettes[flavor] or default
end

return M
