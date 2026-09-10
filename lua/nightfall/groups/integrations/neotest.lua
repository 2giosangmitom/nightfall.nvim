--- https://github.com/nvim-neotest/neotest

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, accent = ctx.c, ctx.accent

  return {
    NeotestPassed = { fg = c.green },
    NeotestFailed = { fg = c.red },
    NeotestRunning = { fg = c.gold },
    NeotestSkipped = { fg = c.sky },
    NeotestUnknown = { fg = c.subtle },
    NeotestWatching = { fg = c.orange },
    NeotestTest = { fg = c.fg },
    NeotestNamespace = { fg = ctx.role("module") },
    NeotestFile = { fg = c.cyan },
    NeotestDir = { link = "Directory" },
    NeotestFocused = { fg = accent, bold = true, underline = true },
    NeotestAdapterName = { fg = c.magenta, bold = true },
    NeotestIndent = { fg = c.border },
    NeotestExpandMarker = { fg = c.border },
    NeotestMarked = { fg = c.gold, bold = true },
    NeotestTarget = { fg = accent },
    NeotestWinSelect = { fg = accent, bold = true },
    NeotestBorder = { link = "FloatBorder" },
  }
end

return M
