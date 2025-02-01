local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    NeoTreeFloatTitle = { link = "FloatTitle" },
    NeoTreeFloatBorder = { link = "FloatBorder" },
    NeoTreeDimText = { link = "Comment" },
    NeoTreeIndentMarker = { fg = colors.charcoal },
  }
end

return M
