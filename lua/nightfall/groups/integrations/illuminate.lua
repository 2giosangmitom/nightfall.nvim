--- https://github.com/RRethy/vim-illuminate

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return {
    IlluminatedWordText = { bg = c.overlay },
    IlluminatedWordRead = { bg = c.overlay },
    IlluminatedWordWrite = { bg = c.overlay, underline = true },
  }
end

return M
