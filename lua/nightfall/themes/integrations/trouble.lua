local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    TroubleCount = { fg = colors.pink },
    TroubleDirectory = { fg = colors.violet },
    TroubleIconDirectory = { fg = colors.violet },
  }
end

return M
