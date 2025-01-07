local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local utils = require("nightfall.utils.colors")

  return {
    TreesitterContext = { bg = utils.lighten(colors.navy, 0.9) },
    TreesitterContextBottom = { sp = colors.charcoal },
    TreesitterContextLineNumber = { fg = colors.lavender },
  }
end

return M
