local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    Normal = { fg = colors.fg, bg = colors.bg },
  }
end

return M
