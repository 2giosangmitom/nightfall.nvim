local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    MiniIndentscopeSymbol = { fg = colors.pink },
  }
end

return M
