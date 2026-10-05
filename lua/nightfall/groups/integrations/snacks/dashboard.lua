--- Dashboard highlights.
local U = require("nightfall.color")
local palette = require("nightfall.palette")
local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)
  return {
    SnacksDashboardNormal = { fg = c.fg, bg = U.background(c.bg, o.transparent) },
    SnacksDashboardHeader = {
      fg = flavor == "deeper-night" and c.blue or flavor == "maron" and c.peach or accent,
      bold = true,
    },
    SnacksDashboardTitle = { fg = c.teal, bold = true },
    SnacksDashboardIcon = { fg = c.pink },
    SnacksDashboardKey = { fg = flavor == "deeper-night" and c.pink or flavor == "maron" and c.cyan or c.blue },
    SnacksDashboardDesc = { fg = c.fg },
    SnacksDashboardFile = { fg = c.sky },
    SnacksDashboardDir = { fg = c.gray },
    SnacksDashboardFooter = { fg = c.gray, italic = true },
    SnacksDashboardSpecial = { fg = c.lavender },
    SnacksDashboardTerminal = { fg = c.fg },
  }
end

return M
