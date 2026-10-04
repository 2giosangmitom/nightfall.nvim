--- https://github.com/folke/flash.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return {
    FlashBackdrop = { fg = c.subtle },
    FlashMatch = { fg = ctx.on_accent(), bg = ctx.vary({ nightfall = c.cyan }, c.sky) },
    FlashCurrent = { fg = ctx.on_accent(), bg = c.gold, bold = true },
    FlashLabel = { fg = ctx.on_accent(), bg = c.pink, bold = true },
    FlashCursor = { fg = c.bg, bg = c.fg },
    FlashPrompt = { fg = c.fg, bg = ctx.solid(c.bg_dim) },
    FlashPromptIcon = { fg = ctx.accent },
  }
end

return M
