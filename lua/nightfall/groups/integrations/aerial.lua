--- https://github.com/stevearc/aerial.nvim

local kinds = require("nightfall.groups.kinds")

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, accent = ctx.c, ctx.accent

  return vim.tbl_extend("error", {
    AerialNormal = { fg = c.fg, bg = ctx.solid(c.bg_dim) },
    AerialLine = { bg = c.overlay, bold = true },
    AerialLineNC = { bg = c.bg_alt },
    AerialGuide = { fg = c.border },
    AerialGuide1 = { fg = c.border },
    AerialGuide2 = { fg = c.subtle },
    AerialGuide3 = { fg = accent },
  }, kinds.groups(ctx, "Aerial"))
end

return M
