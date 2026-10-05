--- https://github.com/mfussenegger/nvim-dap and
--- https://github.com/rcarriga/nvim-dap-ui

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local opts = o.integrations.dap
  local accent = palette.accent(c, flavor)

  local result = {
    DapBreakpoint = { fg = c.red },
    DapBreakpointCondition = { fg = c.orange },
    DapBreakpointRejected = { fg = c.subtle },
    DapLogPoint = { fg = c.sky },
    DapStopped = { fg = c.gold },
    DapStoppedLine = { bg = U.blend(c.gold, c.bg, 0.18) },
  }

  if opts.ui then
    result = vim.tbl_extend("error", result, {
      DapUINormal = { link = "NormalFloat" },
      DapUIFloatNormal = { link = "NormalFloat" },
      DapUIFloatBorder = { link = "FloatBorder" },
      DapUIEndofBuffer = { fg = c.bg_dim },
      DapUIWinSelect = { fg = accent, bold = true },
      DapUIScope = { fg = c.cyan },
      DapUIType = { fg = (flavor == "nightfall" or flavor == "winter") and c.blue or c.cyan },
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
