--- Enable `flash.nvim` support by adding the following to your Nightfall
--- integrations config:
--- >lua
---   flash = { enabled = true }
--- <
---@tag nightfall.nvim_flash

local M = {}

---@param colors NightfallPalette
---@private
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
