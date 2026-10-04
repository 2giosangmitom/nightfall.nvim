--- https://github.com/ggandor/leap.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return {
    LeapBackdrop = { fg = c.subtle },
    LeapMatch = { fg = ctx.on_accent(), bg = ctx.vary({ nightfall = c.cyan }, c.sky), bold = true },
    LeapLabel = { fg = ctx.on_accent(), bg = c.pink, bold = true },
    LeapLabelPrimary = { fg = ctx.on_accent(), bg = c.pink, bold = true },
    LeapLabelSecondary = { fg = ctx.on_accent(), bg = c.gold, bold = true },
  }
end

return M
