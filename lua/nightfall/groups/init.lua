local M = {}

--- Load color override and highlight override
---@param flavor NightfallFlavor
---@param options NightfallOptions
---@return table, table: Returns the color and highlight overrides
local function load_overrides(flavor, options)
  -- Get the base color and highlight overrides for all flavors
  local colors = options.color_overrides.all or {}
  local highlights = options.highlight_overrides.all or {}

  -- Extend the base overrides with the specific overrides for the given flavor
  colors = vim.tbl_deep_extend(
    "keep",
    type(options.color_overrides[flavor]) == "function" and options.color_overrides[flavor]()
      or options.color_overrides[flavor]
      or {},
    colors
  )
  highlights = vim.tbl_deep_extend(
    "keep",
    type(options.highlight_overrides[flavor]) == "function" and options.highlight_overrides[flavor]()
      or options.highlight_overrides[flavor]
      or {},
    highlights
  )

  return colors, highlights
end

--- Get core theme
---@param flavor NightfallFlavor
---@return table, table, table: Core highlights, terminal highlights, integration highlights
function M.get(flavor)
  local config = require("nightfall.config")
  local options = config.get_options()

  -- Load color and highlight overrides
  local color_overrides, highlight_overrides = load_overrides(flavor, options)

  -- Get the palette for the given flavor with the color overrides
  local colors = require("nightfall.palettes").get_palette(flavor, color_overrides)

  -- Get the highlight groups and merge them
  local highlights = vim.tbl_deep_extend(
    "error",
    require("nightfall.groups.editor").get(colors),
    require("nightfall.groups.syntax").get(colors)
  )
  highlights = vim.tbl_deep_extend("keep", highlight_overrides, highlights)

  -- Get terminal highlights if terminal colors are enabled
  local terminal_highlights = options.terminal_colors and require("nightfall.groups.terminal").get(colors) or {}

  -- Get integration highlights for enabled integrations
  local integration_highlights = {}
  for integration, integration_config in pairs(options.integrations) do
    if integration_config.enabled then
      local ok, integration_f = pcall(require, "nightfall.groups.integrations." .. integration)
      if ok then
        integration_highlights =
          vim.tbl_deep_extend("error", integration_f.get(colors, integration_config), integration_highlights)
      else
        vim.notify(
          string.format("%s integration is not supported or not found", integration),
          vim.log.levels.WARN,
          { title = "Nightfall" }
        )
      end
    end
  end

  return highlights, terminal_highlights, integration_highlights
end

return M
