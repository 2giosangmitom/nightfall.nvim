--- https://github.com/ggandor/leap.nvim

local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local on_accent = palette.on_accent(c, flavor)

  return {
    LeapBackdrop = { fg = c.subtle },
    LeapMatch = { fg = on_accent, bg = flavor == "nightfall" and c.cyan or c.sky, bold = true },
    LeapLabel = { fg = on_accent, bg = c.pink, bold = true },
    LeapLabelPrimary = { fg = on_accent, bg = c.pink, bold = true },
    LeapLabelSecondary = { fg = on_accent, bg = c.gold, bold = true },
  }
end

return M
