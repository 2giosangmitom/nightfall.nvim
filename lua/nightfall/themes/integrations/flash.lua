local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    FlashBackdrop = { fg = colors.light_grey },
    FlashMatch = { fg = colors.violet },
    FlashCurrent = { fg = colors.peach },
    FlashLabel = { fg = colors.pink, bg = colors.black },
    FlashPrompt = { fg = colors.nord_blue },
    FlashPromptIcon = { fg = colors.green },
    FlashCursor = { fg = colors.violet },
  }
end

return M
