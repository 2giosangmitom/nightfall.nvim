local M = {}

--- Get core theme
---@param flavor NightfallFlavor
---@return table, table, table: Core highlights, terminal highlights, integration highlights
function M.get(flavor)
  local config = require("nightfall.config")
  local options = config.get_options()

  -- Merge user's custom colors
  local color_overrides = options.color_overrides.all or {}
  color_overrides = vim.tbl_deep_extend("keep", options.color_overrides[flavor] or {}, color_overrides)
  local colors = require("nightfall.palettes").get_palette(flavor, color_overrides)

  -- Merge user's custom highlights
  local highlight_overrides = options.highlight_overrides.all or {}
  highlight_overrides = vim.tbl_deep_extend(
    "keep",
    type(options.highlight_overrides[flavor]) == "function" and options.highlight_overrides[flavor](colors)
      or options.highlight_overrides[flavor]
      or {},
    highlight_overrides
  )

  -- Get core highlights
  local highlights = vim.tbl_deep_extend(
    "error",
    require("nightfall.groups.editor").get(
      colors,
      { transparent = options.transparent, dim_inactive = options.dim_inactive }
    ),
    require("nightfall.groups.syntax").get(
      colors,
      { transparent = options.transparent, dim_inactive = options.dim_inactive }
    )
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
