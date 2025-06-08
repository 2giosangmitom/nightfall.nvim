local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local utils = require("nightfall.utils.colors")
  local accent = utils.vary_color({
    nightfall = colors.purple,
    maron = colors.lavender,
  }, colors.sky)

  return {
    MasonHeader = { fg = colors.black, bg = accent },
    MasonLink = { fg = colors.black, bg = colors.purple },
    MasonHighlight = { fg = accent },
    MasonHeading = { fg = colors.fg, bold = true },
    MasonHighlightBlockBold = { fg = colors.black, bg = accent },
    MasonMutedBlock = { fg = utils.lighten(colors.gray, 0.6), bg = utils.lighten(colors.navy, 0.85, colors.latte) },
    MasonHighlightBlock = { fg = colors.black, bg = accent },
  }
end

return M
