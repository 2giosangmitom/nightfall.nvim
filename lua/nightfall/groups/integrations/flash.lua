local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local utils = require("nightfall.utils.colors")
  return {
    FlashMatch = { fg = utils.vary_color({ nightfall = colors.yellow, nord = colors.green }, colors.cyan) },
    FlashCurrent = { fg = colors.sky },
    FlashLabel = { fg = colors.pink, bold = true },
    FlashPrompt = { fg = colors.cyan },
    FlashPromptIcon = { fg = colors.cyan },
  }
end

return M
