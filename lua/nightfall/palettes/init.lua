local M = {}

--- Retrieves the color palette for the specified flavor.
---@param flavor string: The flavor of the color palette to retrieve.
---@return NightfallPalette: The color palette table.
function M.get(flavor)
  local colors = require("nightfall.palettes." .. flavor)
  local utils = require("nightfall.utils")

  -- Handle the case where the specified flavor does not exist or cannot be loaded
  if not colors then error("Failed to load color palette for flavor: " .. flavor) end

  -- Update the color palette with additional colors or modifications
  colors.none = "NONE"
  colors.statusline_bg = utils.darken(colors.background, 0.5)

  return colors
end

return M
