--- https://github.com/folke/lazy.nvim

local U = require("nightfall.color")
local palette = require("nightfall.palette")
local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)

  return {
    LazyNormal = { link = "NormalFloat" },
    LazyButton = { fg = c.silver, bg = c.surface },
    LazyButtonActive = {
      fg = flavor == "winter" and c.fg or c.silver,
      bg = flavor == "winter" and c.overlay or U.lighten(c.surface, 0.875),
      bold = true,
    },
    LazyH1 = { fg = palette.on_accent(c, flavor), bg = flavor == "maron" and c.yellow or accent, bold = true },
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
