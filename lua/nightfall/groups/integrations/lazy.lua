--- https://github.com/folke/lazy.nvim

local U = require("nightfall.color")
local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, accent = ctx.c, ctx.accent

  return {
    LazyNormal = { link = "NormalFloat" },
    LazyButton = { fg = c.silver, bg = c.surface },
    LazyButtonActive = { fg = c.silver, bg = U.lighten(c.surface, 0.875), bold = true },
    LazyH1 = { fg = c.black, bg = ctx.vary({ maron = c.yellow }, accent), bold = true },
    LazyH2 = { fg = accent, bold = true },
    LazyComment = { link = "Comment" },
    LazyProp = { fg = c.gray },
    LazyValue = { fg = c.cyan },
    LazyDir = { fg = c.sky },
    LazyUrl = { fg = c.sky, underline = true },
    LazyDimmed = { fg = c.subtle },
    LazyNoCond = { fg = c.red },
    LazyLocal = { fg = c.gold },
    LazySpecial = { fg = c.lavender },
    LazyProgressDone = { fg = c.green, bold = true },
    LazyProgressTodo = { fg = c.border, bold = true },
    LazyCommit = { fg = c.silver },
    LazyCommitIssue = { fg = c.pink },
    LazyCommitScope = { fg = c.teal, italic = true },
    LazyCommitType = { fg = c.yellow, bold = true },
    LazyTaskOutput = { fg = c.fg },
    LazyTaskError = { fg = c.red },
    LazyReasonCmd = { fg = c.cream },
    LazyReasonEvent = { fg = c.yellow },
    LazyReasonFt = { fg = c.green },
    LazyReasonImport = { fg = c.blue },
    LazyReasonKeys = { fg = c.teal },
    LazyReasonPlugin = { fg = c.purple },
    LazyReasonRuntime = { fg = c.orange },
    LazyReasonSource = { fg = c.cyan },
    LazyReasonStart = { fg = c.pink },
  }
end

return M
