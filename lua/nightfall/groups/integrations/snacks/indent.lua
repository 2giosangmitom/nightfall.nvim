local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    SnacksIndent = { fg = colors.charcoal },
  }
end

return M
