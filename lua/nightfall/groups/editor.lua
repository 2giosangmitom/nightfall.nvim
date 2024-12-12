local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    ColorColumn = { fg = colors.fg, bg = colors.bg },
    Normal = { fg = colors.fg, bg = colors.bg },
  }
end

return M
