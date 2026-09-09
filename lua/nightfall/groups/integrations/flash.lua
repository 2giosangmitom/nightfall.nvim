--- https://github.com/folke/flash.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return {
    FlashMatch = { fg = ctx.vary({ nightfall = c.yellow }, c.cyan) },
    FlashCurrent = { fg = c.sky },
    FlashLabel = { fg = c.pink, bold = true },
    FlashPrompt = { fg = c.cyan },
    FlashPromptIcon = { fg = c.cyan },
  }
end

return M
