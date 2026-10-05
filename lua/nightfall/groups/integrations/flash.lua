--- https://github.com/folke/flash.nvim

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallIntegrationOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local on_accent = palette.on_accent(c, flavor)

  return {
    FlashBackdrop = { fg = c.subtle },
    FlashMatch = { fg = on_accent, bg = flavor == "nightfall" and c.cyan or c.sky },
    FlashCurrent = { fg = on_accent, bg = c.gold, bold = true },
    FlashLabel = { fg = on_accent, bg = c.pink, bold = true },
    FlashCursor = { fg = c.bg, bg = c.fg },
    FlashPrompt = { fg = c.fg, bg = U.background(c.bg_dim, o.transparent) },
    FlashPromptIcon = { fg = palette.accent(c, flavor) },
  }
end

return M
