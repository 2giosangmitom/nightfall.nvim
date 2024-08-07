--- To enable `telescope.nvim` support, add the following to your Nightfall
--- integrations config, choosing between two styles: 'borderless' and
--- 'bordered'.
--- >lua
---   telescope = { enabled = true, style = "borderless" }
--- <
---@tag nightfall.nvim_telescope

local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  local Options = require("nightfall").Options
  local telescope = Options.integrations.telescope or {}
  local telescope_style = telescope.style or "borderless"
  local utils = require("nightfall.utils")
  local bg = utils.darken(colors.background, 0.8)

  local result = {
    TelescopePromptPrefix = { fg = colors.red, bg = bg },
    TelescopeNormal = { bg = bg },
    TelescopePromptTitle = { fg = colors.black, bg = utils.vary_color({ maron = colors.pale_yellow }, colors.red) },
    TelescopeSelection = { bg = colors.dark_navy, fg = colors.foreground },
    TelescopeResultsDiffAdd = { fg = colors.green },
    TelescopeResultsDiffChange = { fg = colors.pale_yellow },
    TelescopeResultsDiffDelete = { fg = colors.red },
    TelescopeMatching = { bg = colors.dark_navy, fg = colors.violet },
  }

  local styles = {
    borderless = {
      TelescopeBorder = { fg = bg, bg = bg },
      TelescopePromptBorder = { fg = bg, bg = bg },
      TelescopePromptNormal = { fg = colors.foreground, bg = bg },
      TelescopeResultsTitle = { fg = colors.black, bg = utils.vary_color({ maron = colors.green }, colors.light_cyan) },
      TelescopePreviewTitle = { fg = colors.black, bg = utils.vary_color({ maron = colors.violet }, colors.green) },
    },

    bordered = {
      TelescopeBorder = { fg = colors.lavender, bg = colors.black },
      TelescopeNormal = { fg = colors.foreground, bg = colors.black },
      TelescopePromptBorder = { fg = colors.violet, bg = colors.black },
      TelescopePromptTitle = { fg = colors.violet, bg = colors.black },
    },
  }

  return vim.tbl_deep_extend("force", result, styles[telescope_style])
end

return M
