local M = {}

--- Default options
---@class NightfallOptions
local Options = {
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  default_integrations = true,
  integrations = {},
  color_overrides = {},
  highlight_overrides = {},
}

--- Merge user configurations with defaults
---@param user_config? NightfallOptions
function M.setup(user_config)
  user_config = user_config or {}
  if user_config.default_integrations == false then Options.integrations = {} end
  Options = vim.tbl_deep_extend("keep", user_config, Options)
end

--- Get options
---@return NightfallOptions
function M.get_options() return Options end

return M
