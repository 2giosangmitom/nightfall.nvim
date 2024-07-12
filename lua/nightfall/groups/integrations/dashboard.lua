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
  return {
    DashboardShortCut = { fg = colors.violet },
    DashboardHeader = { fg = colors.violet },
    DashboardCenter = { fg = colors.green },
    DashboardFooter = { fg = colors.pale_yellow, style = { italic = true } },
    DashboardMruTitle = { fg = colors.sky },
    DashboardProjectTitle = { fg = colors.sky },
    DashboardFiles = { fg = colors.lavender },
    DashboardKey = { fg = colors.peach },
    DashboardDesc = { fg = colors.light_cyan },
    DashboardIcon = { fg = colors.violet, bold = true },
  }
end

return M
