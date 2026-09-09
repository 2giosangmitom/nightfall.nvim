--- https://github.com/lukas-reineke/indent-blankline.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  return {
    IblIndent = { fg = ctx.c.charcoal },
    IblScope = { fg = ctx.c.cream },
  }
end

return M
