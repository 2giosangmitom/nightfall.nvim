local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    -- Kind
    CmpItemKindText = { fg = colors.lavender },
    CmpItemKindMethod = { link = "Function" },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindConstructor = { fg = colors.cyan },
    CmpItemKindField = { link = "@property" },
    CmpItemKindVariable = { link = "Identifier" },
    CmpItemKindClass = { fg = colors.magenta },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindModule = { fg = colors.cream },
    CmpItemKindProperty = { link = "@property" },
    CmpItemKindUnit = { fg = colors.cyan },
    CmpItemKindValue = { fg = colors.sky },
    CmpItemKindEnum = { fg = colors.coral },
    CmpItemKindKeyword = { fg = colors.yellow },
    CmpItemKindSnippet = { fg = colors.gray },
    CmpItemKindColor = { fg = colors.blue },
    CmpItemKindFile = { fg = colors.green },
    CmpItemKindReference = { fg = colors.lime },
    CmpItemKindFolder = { link = "Directory" },
    CmpItemKindEnumMember = { fg = colors.peach },
    CmpItemKindConstant = { link = "Constant" },
    CmpItemKindStruct = { fg = colors.purple },
    CmpItemKindEvent = { fg = colors.teal },
    CmpItemKindOperator = { fg = colors.rose },
    CmpItemKindTypeParameter = { fg = colors.rose },
  }
end

return M
