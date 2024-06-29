--- Enable `nvim-dap` support by adding the following to your Nightfall
--- integrations config:
--- >lua
---   nvim_dap = { enabled = true }
--- <
---@tag nightfall.nvim_dap

local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  return {
    DapBreakpoint = { fg = colors.violet },
    DapBreakpointCondition = { fg = colors.violet },
    DapBreakpointRejected = { fg = colors.red },
    DapLogPoint = { fg = colors.light_cyan },
    DapStopped = { fg = colors.pink },
  }
end

return M
