--- Enable `nvim-dap` support by adding the following to your Nightfall
--- integrations config:
---
--- >lua
---   nvim_dap = { enabled = true }
--- <
---
--- You must define sign icons to make it work. Here is a snippet for you:
---
--- >lua
---   local signs = {
---     { name = 'DapBreakpoint', text = '', texthl = 'DapBreakpoint' },
---     { name = 'DapBreakpointCondition', text = '', texthl = 'DapBreakpointCondition' },
---     { name = 'DapBreakpointRejected', text = '', texthl = 'DapBreakpointRejected' },
---     { name = 'DapLogPoint', text = '󰛿', texthl = 'DapLogPoint' },
---     { name = 'DapStopped', text = '󰁕', texthl = 'DapStopped' },
---   }
---
---   for _, sign in ipairs(signs) do
---     vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.texthl })
---   end
--- <
---
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
