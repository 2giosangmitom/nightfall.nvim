--- https://github.com/SmiteshP/nvim-navic

local kinds = require("nightfall.groups.kinds")

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return vim.tbl_extend("error", {
    NavicText = { fg = c.fg },
    NavicSeparator = { fg = c.border },
  }, kinds.groups(ctx, "NavicIcons"))
end

return M
