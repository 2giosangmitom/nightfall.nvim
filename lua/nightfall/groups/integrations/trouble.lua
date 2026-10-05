--- https://github.com/folke/trouble.nvim

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallIntegrationOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)
  local bg = U.background(c.bg_dim, o.transparent)

  return {
    TroubleNormal = { fg = c.fg, bg = bg },
    TroubleNormalNC = { fg = c.fg, bg = bg },
    TroubleText = { fg = c.fg },
    TroubleCount = { fg = accent, bg = c.surface, bold = true },
    TroubleSource = { fg = c.subtle, italic = true },
    TroublePos = { fg = c.gray },
    TroubleCode = { fg = c.subtle },
    TroubleFilename = { fg = c.fg },
    TroubleBasename = { fg = c.fg, bold = true },
    TroubleDirectory = { fg = c.gray },
    TroubleIconDirectory = { fg = accent },
    TroubleIconFilename = { fg = c.silver },
    TroubleIndent = { fg = c.border },
    TroubleIndentFoldClosed = { fg = accent },
    TroubleFoldIcon = { fg = accent },
    TroublePreview = { bg = c.overlay },
  }
end

return M
