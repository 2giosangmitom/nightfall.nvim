--- https://github.com/folke/noice.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return {
    NoiceCmdline = { fg = c.rose },
    NoiceCmdlineIcon = { fg = c.yellow },
    NoiceCmdlineIconLua = { fg = c.blue },
    NoiceCmdlinePopupBorder = { fg = c.lavender },
    NoiceCmdlinePopup = { link = "NormalFloat" },
    NoiceLspProgressSpinner = { fg = c.pink },
    NoiceLspProgressTitle = { fg = c.gray },
    NoiceLspProgressClient = { fg = c.cyan },
  }
end

return M
