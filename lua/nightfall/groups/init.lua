local M = {}

--- Enhance the customization of Nightfall even further by overriding colors and
--- highlight groups to suit your preferences. Nightfall.nvim offers extensive
--- options for tailoring the colorscheme precisely to your liking. You can
--- achieve this by utilizing `color_overrides` and `highlight_overrides` in the
--- configuration.
---
--- It's important to note that flavor-specific overrides always have the highest
--- priority.
---
--- Example:
--- >lua
---   require("nightfall").setup({
---     color_overrides = {
---       all = {
---         foreground = "#ffffff",
---       },
---       nightfall = {
---         background = "#ff0000",
---       },
---     },
---     highlight_overrides = {
---       all = { -- User can only use table for `all`, this will apply for all flavors
---         Normal = { bg = "#120809" },
---       },
---       -- @param colors NightfallPalette
---       nightfall = function(colors) -- Can be a function or a table for specific flavor
---         return {
---           Normal = { bg = colors.black },
---         }
---       end,
---       maron = {
---         Normal = { fg = "#ffffff" }
---       },
---     },
---   })
--- <
---@tag nightfall.nvim_overriding

--- Retrieves the theme for the specified flavor.
---@param flavor string: The flavor of the theme.
---@return table, table, table: The default theme, terminal theme, and integrations theme.
---@private
function M.setup(flavor)
  local Options = require("nightfall").Options
  local colors = require("nightfall.palettes").get(flavor)

  local hl_overrides = Options.highlight_overrides

  local defaults_theme = {}
  defaults_theme = vim.tbl_deep_extend(
    "error",
    defaults_theme,
    require("nightfall.groups.syntax").get(colors),
    require("nightfall.groups.editor").get(colors)
  )

  local integrations_theme = {}
  for _, integration in ipairs(M.supported_plugins) do
    local path = string.format("nightfall.groups.integrations.%s", integration)
    local integration_ok, v = pcall(require, path)
    assert(integration_ok, string.format("Could not load %s integration", integration))
    integrations_theme[integration] = v.get(colors)
  end

  local terminal_theme = require("nightfall.groups.terminal").get(colors)

  -- Apply highlight overrides
  if type(hl_overrides[flavor]) == "function" then hl_overrides[flavor] = hl_overrides[flavor](colors) end
  defaults_theme = vim.tbl_deep_extend("force", defaults_theme, hl_overrides.all or {}, hl_overrides[flavor] or {})

  return defaults_theme, terminal_theme, integrations_theme
end

--- Nightfall.nvim seamlessly integrates with various Neovim plugins through
--- its integration feature. This allows for enhanced functionality and a
--- more cohesive user experience.
---
--- Example:
--- >lua
---   require("nightfall").setup({
---     integrations = {
---       lazy = { enabled = true },
---       telescope = { enabled = true, style = "borderless" },
---       illuminate = { enabled = true },
---       treesitter = { enabled = true, context = true },
---       lspconfig = { enabled = true },
---       flash = { enabled = false },
---     }
---   })
--- <
---
--- Certain integrations are enabled by default to provide a smooth
--- out-of-the-box experience. If you prefer to customize which integrations
--- are active, set `default_integrations` to `false`. For more details, see
--- |nightfall.nvim_defaults|.
---@tag nightfall.nvim_integrations

M.supported_plugins = {
  "lazy",
  "illuminate",
  "lspconfig",
  "treesitter",
  "telescope",
  "flash",
  "trouble",
  "headlines",
  "dashboard",
  "nvim_dap",
  "cmp",
  "neo_tree",
  "mini",
  "noice",
  "snacks",
}

return M
