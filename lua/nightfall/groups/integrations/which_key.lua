--- https://github.com/folke/which-key.nvim

local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  return {
    WhichKey = { fg = palette.accent(c, flavor), bold = true },
    WhichKeyNormal = { link = "NormalFloat" },
    WhichKeyBorder = { link = "FloatBorder" },
    WhichKeyTitle = { link = "FloatTitle" },
    WhichKeyDesc = { fg = c.fg },
    WhichKeyGroup = { fg = c.cyan },
    WhichKeySeparator = { fg = c.subtle },
    WhichKeyValue = { fg = c.gray },
    WhichKeyIconAzure = { fg = c.sky },
    WhichKeyIconBlue = { fg = c.blue },
    WhichKeyIconCyan = { fg = c.cyan },
    WhichKeyIconGreen = { fg = c.green },
    WhichKeyIconGrey = { fg = c.gray },
    WhichKeyIconOrange = { fg = c.orange },
    WhichKeyIconPurple = { fg = c.purple },
    WhichKeyIconRed = { fg = c.coral },
    WhichKeyIconYellow = { fg = c.yellow },
  }
end

return M
