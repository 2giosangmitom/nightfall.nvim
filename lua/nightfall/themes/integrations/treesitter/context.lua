local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local utils = require("nightfall.utils")

  return {
    TreesitterContext = { bg = utils.darken(colors.dark_blue, 0.9, colors.background) },
    TreesitterContextBottom = {
      sp = colors.dark_navy,
      style = { underline = true },
    },
    TreesitterContextLineNumber = {
      fg = colors.light_grey,
      bg = colors.black,
    },
  }
end

return M
