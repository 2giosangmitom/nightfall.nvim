--- https://github.com/folke/trouble.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, accent = ctx.c, ctx.accent

  return {
    TroubleNormal = { fg = c.fg, bg = ctx.solid(c.bg_dim) },
    TroubleNormalNC = { fg = c.fg, bg = ctx.solid(c.bg_dim) },
    TroubleText = { fg = c.fg },
    TroubleCount = { fg = accent, bg = c.surface, bold = true },
    TroubleSource = { fg = c.subtle, italic = true },
    TroublePos = { fg = c.gray },
    TroubleCode = { fg = c.subtle },
    TroubleFilename = { fg = c.fg },
    TroubleBasename = { fg = c.fg, bold = true },
    TroubleDirectory = { fg = c.gray },
    TroubleIconDirectory = { fg = accent },
    TroubleIconFilename = { fg = c.silver },
    TroubleIndent = { fg = c.border },
    TroubleIndentFoldClosed = { fg = accent },
    TroubleFoldIcon = { fg = accent },
    TroublePreview = { bg = c.overlay },
  }
end

return M
