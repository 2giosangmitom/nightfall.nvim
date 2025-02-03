local M = {}

-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#completionItemKind

---@param colors NightfallPalette
function M.get(colors)
  return {
    BlinkCmpLabel = { link = "NonText" },
    BlinkCmpLabelDeprecated = { fg = colors.gray, strikethrough = true },
    BlinkCmpLabelMatch = { fg = colors.magenta },
    BlinkCmpMenuBorder = { fg = colors.purple },
    BlinkCmpDocBorder = { fg = colors.purple },
    BlinkCmpSignatureHelpBorder = { fg = colors.purple },

    -- Kind
    BlinkCmpKindText = { fg = colors.lavender },
    BlinkCmpKindMethod = { link = "Function" },
    BlinkCmpKindFunction = { link = "Function" },
    BlinkCmpKindConstructor = { fg = colors.cyan },
    BlinkCmpKindField = { link = "@property" },
    BlinkCmpKindVariable = { link = "Identifier" },
    BlinkCmpKindClass = { fg = colors.magenta },
    BlinkCmpKindInterface = { link = "Type" },
    BlinkCmpKindModule = { fg = colors.cream },
    BlinkCmpKindProperty = { link = "@property" },
    BlinkCmpKindUnit = { fg = colors.cyan },
    BlinkCmpKindValue = { fg = colors.sky },
    BlinkCmpKindEnum = { fg = colors.coral },
    BlinkCmpKindKeyword = { fg = colors.yellow },
    BlinkCmpKindSnippet = { fg = colors.gray },
    BlinkCmpKindColor = { fg = colors.blue },
    BlinkCmpKindFile = { fg = colors.green },
    BlinkCmpKindReference = { fg = colors.lime },
    BlinkCmpKindFolder = { link = "Directory" },
    BlinkCmpKindEnumMember = { fg = colors.peach },
    BlinkCmpKindConstant = { link = "Constant" },
    BlinkCmpKindStruct = { fg = colors.purple },
    BlinkCmpKindEvent = { fg = colors.teal },
    BlinkCmpKindOperator = { fg = colors.rose },
    BlinkCmpKindTypeParameter = { fg = colors.rose },
  }
end

return M
