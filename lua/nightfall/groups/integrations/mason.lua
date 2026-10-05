--- https://github.com/mason-org/mason.nvim

local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallIntegrationOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)
  local on_accent = palette.on_accent(c, flavor)

  return {
    MasonNormal = { link = "NormalFloat" },
    MasonHeader = { fg = on_accent, bg = accent, bold = true },
    MasonHeaderSecondary = { fg = on_accent, bg = c.teal, bold = true },
    MasonHeading = { fg = c.latte, bold = true },
    MasonHighlight = { fg = accent },
    MasonHighlightBlock = { fg = on_accent, bg = accent },
    MasonHighlightBlockBold = { fg = on_accent, bg = accent, bold = true },
    MasonHighlightSecondary = { fg = c.teal },
    MasonHighlightBlockSecondary = { fg = on_accent, bg = c.teal },
    MasonHighlightBlockBoldSecondary = { fg = on_accent, bg = c.teal, bold = true },
    MasonLink = { fg = c.sky, underline = true },
    MasonMuted = { fg = c.gray },
    MasonMutedBlock = { fg = c.gray, bg = c.surface },
    MasonMutedBlockBold = { fg = c.gray, bg = c.surface, bold = true },
    MasonError = { fg = c.red },
    MasonWarning = { fg = c.yellow },
  }
end

return M
