--- https://github.com/mason-org/mason.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, accent = ctx.c, ctx.accent

  return {
    MasonHeader = { fg = c.black, bg = accent },
    MasonLink = { fg = c.black, bg = c.purple },
    MasonHighlight = { fg = accent },
    MasonHeading = { fg = c.fg, bold = true },
    MasonHighlightBlock = { fg = c.black, bg = accent },
    MasonHighlightBlockBold = { fg = c.black, bg = accent },
    MasonMutedBlock = {
      fg = ctx.lighten(c.gray, 0.6),
      bg = ctx.lighten(c.navy, 0.85, c.latte),
    },
  }
end

return M
