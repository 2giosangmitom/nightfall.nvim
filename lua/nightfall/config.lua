local M = {}

--- Default configuration options.
---@class NightfallOptions
---@field transparent boolean
---@field terminal_colors boolean
---@field dim_inactive boolean
---@field default_integrations boolean
---@field integrations table<string, table>
---@field color_overrides table<string, table>
---@field highlight_overrides table<string, table|function>
local Options = {
  transparent = false,
  terminal_colors = true,
  dim_inactive = true,
  default_integrations = true,
  integrations = {},
  color_overrides = {},
  highlight_overrides = {},
}

--- Set user configurations.
---@param user_config? NightfallOptions
function M.setup(user_config)
  user_config = user_config or {}
  if not user_config.default_integrations then Options.integrations = {} end
  Options = vim.tbl_deep_extend("keep", user_config, Options)
end

--- Get options
---@return NightfallOptions
function M.get_options() return Options end

return M
