--- https://github.com/mfussenegger/nvim-dap and
--- https://github.com/rcarriga/nvim-dap-ui

local M = {}

---@param ctx NightfallCtx
---@param opts table Integration options: `ui` for nvim-dap-ui.
---@return table<string,table>
function M.get(ctx, opts)
  local c, accent = ctx.c, ctx.accent

  local result = {
    DapBreakpoint = { fg = c.red },
    DapBreakpointCondition = { fg = c.orange },
    DapBreakpointRejected = { fg = c.subtle },
    DapLogPoint = { fg = c.sky },
    DapStopped = { fg = c.gold },
    DapStoppedLine = { bg = ctx.blend(c.gold, c.bg, 0.18) },
  }

  if opts.ui then
    result = vim.tbl_extend("error", result, {
      DapUINormal = { link = "NormalFloat" },
      DapUIFloatNormal = { link = "NormalFloat" },
      DapUIFloatBorder = { link = "FloatBorder" },
      DapUIEndofBuffer = { fg = c.bg_dim },
      DapUIWinSelect = { fg = accent, bold = true },
      DapUIScope = { fg = c.cyan },
      DapUIType = { fg = ctx.role("type") },
      DapUIVariable = { fg = c.fg },
      DapUIValue = { fg = c.silver },
      DapUIModifiedValue = { fg = c.gold, bold = true },
      DapUIDecoration = { fg = c.border },
      DapUIThread = { fg = c.green },
      DapUIStoppedThread = { fg = c.gold },
      DapUIFrameName = { fg = c.fg },
      DapUICurrentFrameName = { fg = accent, bold = true },
      DapUISource = { fg = c.lavender },
      DapUILineNumber = { fg = c.subtle },
      DapUIWatchesEmpty = { fg = c.subtle },
      DapUIWatchesValue = { fg = c.green },
      DapUIWatchesError = { fg = c.red },
      DapUIBreakpointsPath = { fg = c.sky },
      DapUIBreakpointsInfo = { fg = c.teal },
      DapUIBreakpointsCurrentLine = { fg = c.gold, bold = true },
      DapUIBreakpointsLine = { fg = c.subtle },
      DapUIBreakpointsDisabledLine = { fg = c.border },
      DapUIStepOver = { fg = accent },
      DapUIStepInto = { fg = accent },
      DapUIStepBack = { fg = accent },
      DapUIStepOut = { fg = accent },
      DapUIStop = { fg = c.red },
      DapUIRestart = { fg = c.green },
      DapUIPlayPause = { fg = c.green },
      DapUIUnavailable = { fg = c.border },
    })
  end

  return result
end

return M
