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
--- >
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
---       all = {
---         Normal = { bg = "#120809" },
---       },
---       -- @param colors NightfallPalette
---       nightfall = function(colors)
---         return {
---           Normal = { bg = colors.black },
---         }
---       end,
---     },
---   })
--- <
---@tag nightfall.nvim_overriding

--- Retrieves the theme for the specified flavor.
---@param flavor string: The flavor of the theme.
---@return table, table, table: The default theme, terminal theme, and integrations theme.
---@private
function M.get_theme(flavor)
  local Options = require("nightfall").Options
  local colors = require("nightfall.palettes").get(flavor)

  local color_overrides = Options.color_overrides
  local hl_overrides = Options.highlight_overrides

  -- Apply color overrides
  colors = vim.tbl_deep_extend("force", colors, color_overrides.all or {}, color_overrides[flavor] or {})

  local defaults_theme = {}
  defaults_theme = vim.tbl_deep_extend(
    "error",
    defaults_theme,
    require("nightfall.themes.syntax").get(colors),
    require("nightfall.themes.editor").get(colors)
  )

  local integrations_theme = {}
  for integration, _ in pairs(M.supported_plugins) do
    local path = string.format("nightfall.themes.integrations.%s", integration)
    local integration_ok, v = pcall(require, path)
    assert(integration_ok, string.format("Could not load %s integration", integration))
    integrations_theme[integration] = v.get(colors)
  end

  local terminal_theme = require("nightfall.themes.terminal").get(colors)

  -- Apply highlight overrides
  if type(hl_overrides[flavor]) == "function" then hl_overrides[flavor] = hl_overrides[flavor](colors) end
  if type(hl_overrides.all) == "function" then hl_overrides.all = hl_overrides.all(colors) end
  defaults_theme = vim.tbl_deep_extend("force", defaults_theme, hl_overrides.all or {}, hl_overrides[flavor] or {})

  return defaults_theme, terminal_theme, integrations_theme
end

M.supported_plugins = {
  lazy = "https://github.com/folke/lazy.nvim",
  illuminate = "https://github.com/RRethy/vim-illuminate",
  lspconfig = "https://github.com/neovim/nvim-lspconfig",
  treesitter = "https://github.com/nvim-treesitter/nvim-treesitter",
  telescope = "https://github.com/nvim-telescope/telescope.nvim",
  flash = "https://github.com/folke/flash.nvim",
}

return M
