local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local utils = require("nightfall.utils.colors")
  local accent = utils.vary_color({
    nightfall = colors.purple,
    maron = colors.lavender,
  }, colors.sky)

  return {
    MasonHeader = { fg = colors.black, bg = colors.purple },
    MasonLink = { fg = colors.black, bg = colors.purple },
    MasonHighlight = { fg = colors.green },
    MasonHeading = { fg = colors.lavender, bold = true },
    MasonHighlightBlockBold = { fg = colors.black, bg = accent },
  }
end

return M
