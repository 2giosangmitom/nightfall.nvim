--- Enable `dashboard-nvim` support by adding the following to your Nightfall
--- integrations config:
--- >lua
---   dashboard = { enabled = true }
--- <
---@tag nightfall.nvim_dashboard

local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  local utils = require("nightfall.utils")
  local accent = utils.vary_color({ maron = colors.pale_yellow, deepernight = colors.sky }, colors.violet)
  return {
    DashboardShortCut = { fg = accent },
    DashboardHeader = { fg = accent },
    DashboardCenter = { fg = colors.green },
    DashboardFooter = { fg = colors.pale_yellow, style = { italic = true } },
    DashboardMruTitle = { fg = colors.foreground },
    DashboardProjectTitle = { fg = colors.foreground },
    DashboardFiles = { fg = colors.light_cyan },
    DashboardKey = { fg = accent },
    DashboardDesc = { fg = colors.light_cyan },
    DashboardIcon = { fg = accent, bold = true },
  }
end

return M
