--- https://github.com/ggandor/leap.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return {
    LeapBackdrop = { fg = c.subtle },
    LeapMatch = { fg = c.black, bg = ctx.vary({ nightfall = c.cyan }, c.sky), bold = true },
    LeapLabel = { fg = c.black, bg = c.pink, bold = true },
    LeapLabelPrimary = { fg = c.black, bg = c.pink, bold = true },
    LeapLabelSecondary = { fg = c.black, bg = c.gold, bold = true },
  }
end

return M
