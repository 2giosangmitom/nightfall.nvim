--- https://github.com/lukas-reineke/indent-blankline.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return {
    IblIndent = { fg = ctx.blend(c.border, c.bg, 0.6) },
    IblWhitespace = { fg = ctx.blend(c.border, c.bg, 0.6) },
    IblScope = { fg = ctx.accent },
  }
end

return M
