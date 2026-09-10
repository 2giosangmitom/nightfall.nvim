--- https://github.com/hrsh7th/nvim-cmp

local kinds = require("nightfall.groups.kinds")

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return vim.tbl_extend("error", {
    CmpItemAbbr = { fg = c.silver },
    CmpItemAbbrDeprecated = { fg = c.gray, strikethrough = true },
    CmpItemAbbrMatch = { fg = ctx.accent, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = ctx.accent },
    CmpItemMenu = { fg = c.subtle, italic = true },
    CmpItemKindDefault = { fg = ctx.accent },
    CmpGhostText = { fg = c.subtle, italic = true },
  }, kinds.groups(ctx, "CmpItemKind"))
end

return M
