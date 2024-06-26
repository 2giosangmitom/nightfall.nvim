local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    LazyH1 = { bg = colors.violet, fg = colors.black },
    LazyButtonActive = { bg = colors.deep_navy },
    LazyButton = { bg = colors.dark_navy, fg = colors.ghost_white },
    LazyH2 = { fg = colors.ghost_white, style = { bold = true } },
    LazyReasonPlugin = { fg = colors.sky },
    LazyValue = { fg = colors.green, style = { italic = true } },
    LazyTaskError = { fg = colors.red },
    LazyDir = { fg = colors.violet },
    LazyUrl = { fg = colors.nord_blue },
    LazyCommit = { fg = colors.green },
    LazyNoCond = { fg = colors.pale_yellow },
    LazySpecial = { fg = colors.lavender },
    LazyReasonFt = { fg = colors.violet },
    LazyOperator = { fg = colors.ghost_white },
    LazyReasonKeys = { fg = colors.pink },
    LazyTaskOutput = { fg = colors.ghost_white },
    LazyCommitIssue = { fg = colors.pink },
    LazyReasonEvent = { fg = colors.peach },
    LazyReasonStart = { fg = colors.turquoise },
    LazyReasonRuntime = { fg = colors.nord_blue },
    LazyReasonCmd = { fg = colors.pale_yellow },
    LazyReasonSource = { fg = colors.light_cyan },
    LazyReasonImport = { fg = colors.pink },
    LazyProgressDone = { fg = colors.violet },
  }
end

return M
