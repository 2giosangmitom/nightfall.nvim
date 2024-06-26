local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    illuminatedWord = { bg = colors.deep_navy },
    illuminatedCurWord = { bg = colors.deep_navy },
    IlluminatedWordText = { bg = colors.deep_navy },
    IlluminatedWordRead = { bg = colors.deep_navy },
    IlluminatedWordWrite = { bg = colors.deep_navy },
  }
end

return M
