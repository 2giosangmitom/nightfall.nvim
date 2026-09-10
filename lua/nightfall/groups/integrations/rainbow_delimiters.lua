--- https://github.com/HiPhish/rainbow-delimiters.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return {
    RainbowDelimiterRed = { fg = c.red },
    RainbowDelimiterOrange = { fg = c.orange },
    RainbowDelimiterYellow = { fg = c.yellow },
    RainbowDelimiterGreen = { fg = c.green },
    RainbowDelimiterCyan = { fg = c.cyan },
    RainbowDelimiterBlue = { fg = c.sky },
    RainbowDelimiterViolet = { fg = c.purple },
  }
end

return M
