local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    MiniIconsAzure = { fg = colors.sky },
    MiniIconsBlue = { fg = colors.blue },
    MiniIconsCyan = { fg = colors.cyan },
    MiniIconsGreen = { fg = colors.green },
    MiniIconsGrey = { fg = colors.gray },
    MiniIconsOrange = { fg = colors.orange },
    MiniIconsPurple = { fg = colors.purple },
    MiniIconsRed = { fg = colors.coral },
    MiniIconsYellow = { fg = colors.yellow },
  }
end

return M
