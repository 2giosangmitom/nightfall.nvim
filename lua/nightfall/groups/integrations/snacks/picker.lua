local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    SnacksPickerTree = { fg = colors.charcoal }
  }
end

return M
