local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    NoiceCmdline = { fg = colors.rose },
    NoiceCmdlineIcon = { fg = colors.yellow },
    NoiceCmdlineIconLua = { fg = colors.blue },
    NoiceCmdlinePopupBorder = { fg = colors.lavender },
    NoiceCmdlinePopup = { link = "NormalFloat" },
    NoiceLspProgressSpinner = { fg = colors.pink },
    NoiceLspProgressTitle = { fg = colors.gray },
    NoiceLspProgressClient = { fg = colors.cyan },
  }
end

return M
