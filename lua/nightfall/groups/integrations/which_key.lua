local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    WhichKey = { fg = colors.pink },
    WhichKeyDesc = { fg = colors.latte },
    WhichKeyGroup = { fg = colors.cyan },
    WhichKeyIconAzure = { fg = colors.sky },
    WhichKeyIconBlue = { fg = colors.blue },
    WhichKeyIconCyan = { fg = colors.cyan },
    WhichKeyIconGreen = { fg = colors.green },
    WhichKeyIconGrey = { fg = colors.gray },
    WhichKeyIconOrange = { fg = colors.orange },
    WhichKeyIconPurple = { fg = colors.purple },
    WhichKeyIconRed = { fg = colors.coral },
    WhichKeyIconYellow = { fg = colors.yellow },
    WhichKeySeparator = { fg = colors.charcoal },
  }
end

return M
