--- https://github.com/Saghen/blink.cmp

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return {
    BlinkCmpLabel = { link = "NonText" },
    BlinkCmpLabelDeprecated = { fg = c.gray, strikethrough = true },
    BlinkCmpLabelMatch = { fg = c.magenta },
    BlinkCmpMenuBorder = { fg = c.purple },
    BlinkCmpDocBorder = { fg = c.purple },
    BlinkCmpSignatureHelpBorder = { fg = c.purple },

    -- Completion item kinds, following the order in the LSP specification.
    BlinkCmpKindText = { fg = c.lavender },
    BlinkCmpKindMethod = { link = "Function" },
    BlinkCmpKindFunction = { link = "Function" },
    BlinkCmpKindConstructor = { fg = c.cyan },
    BlinkCmpKindField = { link = "@property" },
    BlinkCmpKindVariable = { link = "Identifier" },
    BlinkCmpKindClass = { fg = c.magenta },
    BlinkCmpKindInterface = { link = "Type" },
    BlinkCmpKindModule = { fg = c.cream },
    BlinkCmpKindProperty = { link = "@property" },
    BlinkCmpKindUnit = { fg = c.cyan },
    BlinkCmpKindValue = { fg = c.sky },
    BlinkCmpKindEnum = { fg = c.coral },
    BlinkCmpKindKeyword = { fg = c.yellow },
    BlinkCmpKindSnippet = { fg = c.gray },
    BlinkCmpKindColor = { fg = c.blue },
    BlinkCmpKindFile = { fg = c.green },
    BlinkCmpKindReference = { fg = c.lime },
    BlinkCmpKindFolder = { link = "Directory" },
    BlinkCmpKindEnumMember = { fg = c.peach },
    BlinkCmpKindConstant = { link = "Constant" },
    BlinkCmpKindStruct = { fg = c.purple },
    BlinkCmpKindEvent = { fg = c.teal },
    BlinkCmpKindOperator = { fg = c.rose },
    BlinkCmpKindTypeParameter = { fg = c.rose },
  }
end

return M
