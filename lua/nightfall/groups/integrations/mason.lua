--- https://github.com/mason-org/mason.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, accent = ctx.c, ctx.accent

  return {
    MasonNormal = { link = "NormalFloat" },
    MasonHeader = { fg = c.black, bg = accent, bold = true },
    MasonHeaderSecondary = { fg = c.black, bg = c.teal, bold = true },
    MasonHeading = { fg = c.latte, bold = true },
    MasonHighlight = { fg = accent },
    MasonHighlightBlock = { fg = c.black, bg = accent },
    MasonHighlightBlockBold = { fg = c.black, bg = accent, bold = true },
    MasonHighlightSecondary = { fg = c.teal },
    MasonHighlightBlockSecondary = { fg = c.black, bg = c.teal },
    MasonHighlightBlockBoldSecondary = { fg = c.black, bg = c.teal, bold = true },
    MasonLink = { fg = c.sky, underline = true },
    MasonMuted = { fg = c.gray },
    MasonMutedBlock = { fg = c.gray, bg = c.surface },
    MasonMutedBlockBold = { fg = c.gray, bg = c.surface, bold = true },
    MasonError = { fg = c.red },
    MasonWarning = { fg = c.yellow },
  }
end

return M
