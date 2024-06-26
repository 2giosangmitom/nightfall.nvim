local M = {}

--- Nightfall.nvim provides a set of default configuration values that can be
--- overridden to customize your colorscheme experience. Refer to the
--- |nightfall.nvim_setup| function documentation for details on how to override
--- these defaults.
---
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
---@tag nightfall.nvim_defaults
local defaults = {
  compile_path = vim.fn.stdpath("cache") .. "/nightfall",
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    numbers = {},
    conditionals = {},
    constants = {},
    operators = {},
    strings = {},
    types = {},
    booleans = {},
    loops = {},
  },
  default_integrations = true,
  integrations = {
    lazy = { enabled = true },
    telescope = { enabled = true, style = "borderless" },
    illuminate = { enabled = true },
    treesitter = { enabled = true, context = true },
    lspconfig = { enabled = true },
    flash = { enabled = false },
  },
  color_overrides = {},
  highlight_overrides = {},
}

--- Merges user configuration with defaults and returns the resulting options table.
---@param user_config table: User configuration table.
---@return table: Merged options table.
---@private
function M.set_options(user_config)
  -- Validate user_config
  vim.validate({ user_config = { user_config, "table" } })

  -- Apply user configuration, overwriting default integrations if necessary
  if user_config.default_integrations == false then defaults.integrations = {} end

  -- Merge user configuration with defaults
  return vim.tbl_deep_extend("keep", user_config, defaults)
end

return M
