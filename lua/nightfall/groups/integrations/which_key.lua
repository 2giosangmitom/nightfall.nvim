--- https://github.com/folke/which-key.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return {
    WhichKey = { fg = ctx.accent, bold = true },
    WhichKeyNormal = { link = "NormalFloat" },
    WhichKeyBorder = { link = "FloatBorder" },
    WhichKeyTitle = { link = "FloatTitle" },
    WhichKeyDesc = { fg = c.fg },
    WhichKeyGroup = { fg = c.cyan },
    WhichKeySeparator = { fg = c.subtle },
    WhichKeyValue = { fg = c.gray },
    WhichKeyIconAzure = { fg = c.sky },
    WhichKeyIconBlue = { fg = c.blue },
    WhichKeyIconCyan = { fg = c.cyan },
    WhichKeyIconGreen = { fg = c.green },
    WhichKeyIconGrey = { fg = c.gray },
    WhichKeyIconOrange = { fg = c.orange },
    WhichKeyIconPurple = { fg = c.purple },
    WhichKeyIconRed = { fg = c.coral },
    WhichKeyIconYellow = { fg = c.yellow },
  }
end

return M
