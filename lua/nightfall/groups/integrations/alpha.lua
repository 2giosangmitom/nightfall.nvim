--- https://github.com/goolord/alpha-nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, accent = ctx.c, ctx.accent

  return {
    AlphaHeader = { fg = accent, bold = true },
    AlphaHeaderLabel = { fg = c.gold },
    AlphaButtons = { fg = c.fg },
    AlphaShortcut = { fg = ctx.vary({ ["deeper-night"] = c.pink, maron = c.cyan }, c.yellow) },
    AlphaFooter = { fg = c.gray, italic = true },
  }
end

return M
