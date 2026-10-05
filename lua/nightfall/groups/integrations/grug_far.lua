--- https://github.com/MagicDuck/grug-far.nvim

local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)

  return {
    GrugFarHelpHeader = { fg = c.gray },
    GrugFarHelpHeaderKey = { fg = c.gold, bold = true },
    GrugFarHelpWinHeader = { fg = accent, bold = true },
    GrugFarHelpWinActionKey = { fg = c.gold, bold = true },
    GrugFarHelpWinActionDescription = { fg = c.fg },
    GrugFarHelpWinActionPrefix = { fg = c.border },
    GrugFarInputLabel = { fg = accent, bold = true },
    GrugFarInputPlaceholder = { fg = c.subtle, italic = true },
    GrugFarResultsHeader = { fg = c.cyan, bold = true },
    GrugFarResultsStats = { fg = c.gray },
    GrugFarResultsActionMessage = { fg = c.gold },
    GrugFarResultsMatch = { fg = palette.on_accent(c, flavor), bg = c.gold },
    GrugFarResultsMatchAdded = { fg = c.green },
    GrugFarResultsMatchRemoved = { fg = c.red, strikethrough = true },
    GrugFarResultsPath = { fg = accent, bold = true },
    GrugFarResultsLineNo = { fg = c.subtle },
    GrugFarResultsLineColumn = { fg = c.subtle },
    GrugFarResultsNumberLabel = { fg = c.gray },
    GrugFarResultsComment = { link = "Comment" },
    GrugFarResultsLongLineStr = { fg = c.subtle },
  }
end

return M
