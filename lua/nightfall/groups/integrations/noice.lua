--- To enable `noice.nvim` support, add the following to your Nightfall
--- integration config.
--- >lua
---   noice = { enabled = true }
--- <
---@tag nightfall.nvim_noice
local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  return {
    NoiceCmdline = { fg = colors.green },
    NoiceCmdlinePopupBorder = { fg = colors.lavender },
    NoiceCmdlinePopupTitle = { fg = colors.lavender },
    NoiceCmdlinePrompt = { fg = colors.peach },
    NoiceCmdlinePopupBorderLua = { fg = colors.nord_blue },
    NoiceLspProgressClient = { fg = colors.pink },
    NoiceLspProgressTitle = { fg = colors.light_grey },
  }
end

return M
