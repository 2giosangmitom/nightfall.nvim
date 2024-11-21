--- Enable `snacks.nvim` support by adding the following to your Nightfall
--- integrations config:
--- >lua
---   snacks = { enabled = true }
--- <
---@tag nightfall.nvim_snacks

local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  local utils = require("nightfall.utils")
  local accent = utils.vary_color({ maron = colors.pale_yellow, deepernight = colors.sky }, colors.violet)
  local Options = require("nightfall").Options
  return {
    SnacksNotifierDebug = { fg = colors.foreground, bg = Options.transparent and colors.none or colors.background },
    SnacksNotifierBorderDebug = {
      fg = colors.dark_slate_blue,
      bg = Options.transparent and colors.none or colors.background,
    },
    SnacksNotifierIconDebug = { fg = colors.light_grey },
    SnacksNotifierTitleDebug = { fg = colors.light_grey },
    SnacksNotifierError = { fg = colors.foreground, bg = Options.transparent and colors.none or colors.background },
    SnacksNotifierBorderError = { fg = colors.red, bg = Options.transparent and colors.none or colors.background },
    SnacksNotifierIconError = { fg = colors.red },
    SnacksNotifierTitleError = { fg = colors.red },
    SnacksNotifierInfo = { fg = colors.light_cyan, bg = Options.transparent and colors.none or colors.background },
    SnacksNotifierBorderInfo = { fg = colors.light_cyan, bg = Options.transparent and colors.none or colors.background },
    SnacksNotifierIconInfo = { fg = colors.light_cyan },
    SnacksNotifierTitleInfo = { fg = colors.light_cyan },
    SnacksNotifierTrace = { fg = colors.foreground, bg = Options.transparent and colors.none or colors.background },
    SnacksNotifierBorderTrace = { fg = colors.lavender, bg = Options.transparent and colors.none or colors.background },
    SnacksNotifierIconTrace = { fg = colors.lavender },
    SnacksNotifierTitleTrace = { fg = colors.lavender },
    SnacksNotifierWarn = { fg = colors.foreground, bg = Options.transparent and colors.none or colors.background },
    SnacksNotifierBorderWarn = {
      fg = colors.pale_yellow,
      bg = Options.transparent and colors.none or colors.background,
    },
    SnacksNotifierIconWarn = { fg = colors.pale_yellow },
    SnacksNotifierTitleWarn = { fg = colors.pale_yellow },

    -- Dashboard
    SnacksDashboardDesc = { fg = colors.light_cyan },
    SnacksDashboardFooter = { fg = accent },
    SnacksDashboardHeader = { fg = accent },
    SnacksDashboardIcon = { fg = colors.nord_blue },
    SnacksDashboardKey = { fg = colors.light_cyan },
    SnacksDashboardSpecial = { fg = colors.pink },
    SnacksDashboardDir = { fg = colors.lavender },
  }
end

return M
