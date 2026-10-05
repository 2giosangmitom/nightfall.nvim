--- mini.icons highlights.
local M = {}

---@param c NightfallPalette
---@return table<string,table>
function M.get(c)
  return {
    MiniIconsAzure = { fg = c.sky },
    MiniIconsBlue = { fg = c.blue },
    MiniIconsCyan = { fg = c.cyan },
    MiniIconsGreen = { fg = c.green },
    MiniIconsGrey = { fg = c.silver },
    MiniIconsOrange = { fg = c.orange },
    MiniIconsPurple = { fg = c.purple },
    MiniIconsRed = { fg = c.coral },
    MiniIconsYellow = { fg = c.yellow },
  }
end

return M
