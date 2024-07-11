local M = {}

--- Retrieves the color palette for the specified flavor.
---@param flavor string: The flavor of the color palette to retrieve.
---@return NightfallPalette: The color palette table.
function M.get(flavor)
  local colors = require("nightfall.palettes." .. flavor) ---@type NightfallPalette
  local utils = require("nightfall.utils")
  local color_overrides = require("nightfall").Options.color_overrides

  -- Apply color overrides
  colors = vim.tbl_deep_extend("force", colors, color_overrides.all or {}, color_overrides[flavor] or {})
  if not colors then error("Failed to load color palette for flavor: " .. flavor) end

  colors.none = "NONE"
  colors.statusline_bg = utils.darken(colors.background, 0.5)
  colors.bg_float = utils.darken(colors.background, 0.9)
  colors.added = utils.vary_color({ nightfall = utils.lighten(colors.green, 0.95) }, colors.green)
  colors.changed =
    utils.vary_color({ nightfall = utils.darken(colors.pale_yellow, 0.8, colors.sand) }, colors.pale_yellow)

  return colors
end

return M
