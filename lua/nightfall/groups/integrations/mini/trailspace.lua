local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    MiniTrailspace = { bg = colors.cream },
  }
end

return M
