--- https://github.com/hrsh7th/nvim-cmp

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return {
    -- Completion item kinds, following the order in the LSP specification.
    CmpItemKindText = { fg = c.lavender },
    CmpItemKindMethod = { link = "Function" },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindConstructor = { fg = c.cyan },
    CmpItemKindField = { link = "@property" },
    CmpItemKindVariable = { link = "Identifier" },
    CmpItemKindClass = { fg = c.magenta },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindModule = { fg = c.cream },
    CmpItemKindProperty = { link = "@property" },
    CmpItemKindUnit = { fg = c.cyan },
    CmpItemKindValue = { fg = c.sky },
    CmpItemKindEnum = { fg = c.coral },
    CmpItemKindKeyword = { fg = c.yellow },
    CmpItemKindSnippet = { fg = c.gray },
    CmpItemKindColor = { fg = c.blue },
    CmpItemKindFile = { fg = c.green },
    CmpItemKindReference = { fg = c.lime },
    CmpItemKindFolder = { link = "Directory" },
    CmpItemKindEnumMember = { fg = c.peach },
    CmpItemKindConstant = { link = "Constant" },
    CmpItemKindStruct = { fg = c.purple },
    CmpItemKindEvent = { fg = c.teal },
    CmpItemKindOperator = { fg = c.rose },
    CmpItemKindTypeParameter = { fg = c.rose },
  }
end

return M
