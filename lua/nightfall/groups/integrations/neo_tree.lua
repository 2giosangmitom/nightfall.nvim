local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local utils = require("nightfall.utils.colors")
  return {
    NeoTreeFloatTitle = { link = "FloatTitle" },
    NeoTreeFloatBorder = { link = "FloatBorder" },
    NeoTreeDimText = { link = "Comment" },
    NeoTreeIndentMarker = { fg = colors.charcoal },
    NeoTreeTitleBar = {
      fg = colors.black,
      bg = utils.vary_color({ nightfall = colors.purple, ["deeper-night"] = colors.sky }, colors.peach),
    },
  }
end

return M
