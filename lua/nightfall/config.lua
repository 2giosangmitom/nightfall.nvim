local M = {}

---@class NightfallOptions
---@field transparent? boolean
---@field terminal_colors? boolean
---@field dim_inactive? boolean
---@field default_integrations? boolean
---@field styles? table
---@field integrations? table
---@field color_overrides? table
---@field highlight_overrides? table

--- Default options
---@type NightfallOptions
local default_options = {
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  default_integrations = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    numbers = {},
    exceptions = {},
    conditionals = {},
    constants = {},
    operators = {},
    coroutines = { italic = true },
    strings = {},
    types = {},
    parameters = {},
    booleans = {},
    loops = {},
    properties = {},
    characters = {},
  },
  integrations = {
    lazy = { enabled = true },
    treesitter = { enabled = true, context = true },
    render_markdown = { enabled = true },
    native_lsp = { enabled = true, semantic_tokens = true },
    snacks = { enabled = true, dashboard = true },
    mini = { enabled = true, icons = true },
  },
  color_overrides = {},
  highlight_overrides = {},
}

local Options = default_options

--- Merge user configurations with defaults
---@param user_config? NightfallOptions
function M.setup(user_config)
  user_config = user_config or {}
  if user_config.default_integrations == false then Options.integrations = {} end
  Options = vim.tbl_deep_extend("force", Options, user_config)
end

--- Get options
---@return NightfallOptions
function M.get_options() return Options end

return M
