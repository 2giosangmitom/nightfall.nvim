local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    IblIndent = { fg = colors.charcoal },
    IblScope = { fg = colors.cream },
  }
end

return M
