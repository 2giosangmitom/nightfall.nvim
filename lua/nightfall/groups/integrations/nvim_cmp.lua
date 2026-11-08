--- https://github.com/hrsh7th/nvim-cmp

local kinds = require("nightfall.groups.kinds")

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallIntegrationOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)
  local on_accent = palette.on_accent(c, flavor)
  local menu_bg = U.background(c.bg_dim, o.transparent)

  return vim.tbl_extend("error", {
    CmpPmenu = { fg = c.silver, bg = menu_bg },
    CmpBorder = { fg = c.border, bg = menu_bg },
    CmpDoc = { fg = c.fg, bg = c.bg_dim },
    CmpDocBorder = { fg = c.border, bg = c.bg_dim },
    CmpSel = { fg = on_accent, bg = accent, bold = true },
    CmpItemAbbr = { fg = c.silver },
    CmpItemAbbrDeprecated = { fg = c.gray, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.sky, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.sky },
    CmpItemMenu = { fg = c.subtle, italic = true },
    CmpItemKindDefault = { fg = accent },
    CmpGhostText = { fg = c.subtle, italic = true },
  }, kinds.groups(c, flavor, "CmpItemKind"))
end

return M
