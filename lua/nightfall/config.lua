local M = {}

--- Default configuration options.
---@class NightfallOptions
M.Options = {
  transparent = false,
  terminal_colors = true,
  dim_inactive = true,
  default_integrations = true,
  integrations = {
    lazy = { enabled = true },
    snacks = { enabled = true },
  },
  color_overrides = {},
  highlight_overrides = {},
}

--- Set user configurations.
---@param user_config NightfallOptions
function M.setup(user_config)
  if user_config.default_integrations == false then M.Options.integrations = {} end
  M.Options = vim.tbl_deep_extend("keep", user_config, M.Options)
end

return M
