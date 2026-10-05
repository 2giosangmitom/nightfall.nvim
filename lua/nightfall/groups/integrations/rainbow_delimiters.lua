--- https://github.com/HiPhish/rainbow-delimiters.nvim

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
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
