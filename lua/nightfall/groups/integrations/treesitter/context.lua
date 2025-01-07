local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local utils = require("nightfall.utils.colors")
  local options = require("nightfall.config").get_options()

  return {
    TreesitterContext = { bg = options.transparent and "NONE" or utils.lighten(colors.navy, 0.9) },
    TreesitterContextBottom = { sp = colors.gray },
    TreesitterContextLineNumber = { fg = colors.cream },
  }
end

return M
