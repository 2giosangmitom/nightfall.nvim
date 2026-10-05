--- https://github.com/hrsh7th/nvim-cmp

local kinds = require("nightfall.groups.kinds")

local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallIntegrationOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)

  return vim.tbl_extend("error", {
    CmpItemAbbr = { fg = c.silver },
    CmpItemAbbrDeprecated = { fg = c.gray, strikethrough = true },
    CmpItemAbbrMatch = { fg = accent, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = accent },
    CmpItemMenu = { fg = c.subtle, italic = true },
    CmpItemKindDefault = { fg = accent },
    CmpGhostText = { fg = c.subtle, italic = true },
  }, kinds.groups(c, flavor, "CmpItemKind"))
end

return M
