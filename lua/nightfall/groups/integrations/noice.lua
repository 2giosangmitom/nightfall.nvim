--- https://github.com/folke/noice.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, accent = ctx.c, ctx.accent

  return {
    NoiceCmdline = { fg = c.fg, bg = ctx.solid(c.bg_dim) },
    NoiceCmdlineIcon = { fg = accent },
    NoiceCmdlineIconSearch = { fg = c.gold },
    NoiceCmdlineIconFilter = { fg = c.teal },
    NoiceCmdlineIconLua = { fg = c.blue },
    NoiceCmdlineIconHelp = { fg = c.green },
    NoiceCmdlinePopup = { link = "NormalFloat" },
    NoiceCmdlinePopupBorder = { link = "FloatBorder" },
    NoiceCmdlinePopupBorderSearch = { fg = c.gold },
    NoiceCmdlinePopupTitle = { link = "FloatTitle" },
    NoiceCmdlinePrompt = { fg = accent, bold = true },

    NoicePopup = { link = "NormalFloat" },
    NoicePopupBorder = { link = "FloatBorder" },
    NoicePopupmenu = { link = "Pmenu" },
    NoicePopupmenuBorder = { link = "PmenuBorder" },
    NoicePopupmenuMatch = { link = "PmenuMatch" },
    NoicePopupmenuSelected = { link = "PmenuSel" },

    NoiceConfirm = { link = "NormalFloat" },
    NoiceConfirmBorder = { link = "FloatBorder" },
    NoiceMini = { fg = c.gray, bg = ctx.solid(c.bg_dim) },
    NoiceScrollbar = { bg = c.surface },
    NoiceScrollbarThumb = { bg = c.border },
    NoiceSplit = { link = "NormalFloat" },
    NoiceSplitBorder = { link = "FloatBorder" },
    NoiceVirtualText = { fg = c.gray, italic = true },

    NoiceLspProgressSpinner = { fg = accent },
    NoiceLspProgressTitle = { fg = c.gray },
    NoiceLspProgressClient = { fg = c.cyan, bold = true },

    NoiceFormatProgressDone = { fg = c.black, bg = c.green },
    NoiceFormatProgressTodo = { fg = c.silver, bg = c.surface },
    NoiceFormatEvent = { fg = c.gray },
    NoiceFormatKind = { fg = c.subtle },
    NoiceFormatDate = { fg = c.subtle },
    NoiceFormatLevelDebug = { fg = c.gray },
    NoiceFormatLevelError = { fg = c.red },
    NoiceFormatLevelInfo = { fg = c.sky },
    NoiceFormatLevelOff = { fg = c.subtle },
    NoiceFormatLevelTrace = { fg = c.lavender },
    NoiceFormatLevelWarn = { fg = c.yellow },
  }
end

return M
