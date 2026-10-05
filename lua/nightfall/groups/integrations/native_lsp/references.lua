--- Reference highlighting and inline server annotations.
local U = require("nightfall.color")
local palette = require("nightfall.palette")
local M = {}

---@param c NightfallPalette
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, flavor)
  local accent = palette.accent(c, flavor)
  return {
    LspReferenceText = { bg = c.overlay },
    LspReferenceRead = { bg = c.overlay },
    LspReferenceWrite = { bg = c.overlay },
    LspReferenceTarget = { bg = c.overlay },
    LspInlayHint = { fg = c.subtle, bg = U.blend(c.subtle, c.bg, 0.12), italic = true },
    LspCodeLens = { fg = c.gray, italic = true },
    LspCodeLensSeparator = { fg = c.border },
    LspSignatureActiveParameter = { fg = accent, bg = U.blend(accent, c.bg, 0.16), bold = true },
    LspInfoBorder = { link = "FloatBorder" },
  }
end

return M
