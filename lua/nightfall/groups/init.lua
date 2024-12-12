local M = {}

local function load_module(module_path)
  local ok, module = pcall(require, module_path)
  if not ok then
    vim.notify(string.format("Failed to load module '%s': %s", module_path, module), vim.log.levels.WARN)
    return nil
  end
  return module
end

local function apply_highlight_overrides(flavor, colors, overrides)
  local flavor_overrides = overrides[flavor]
  if type(flavor_overrides) == "function" then
    local ok, result = pcall(flavor_overrides, colors)
    if not ok then
      vim.notify(
        string.format("Failed to process highlight overrides for %s: %s", flavor, result),
        vim.log.levels.ERROR
      )
      return {}
    end
    return result
  end
  return flavor_overrides or {}
end

---@param flavor NightfallFlavor
---@return table theme
function M.get_theme(flavor)
  local nightfall_config = require("nightfall.config")
  local palettes = require("nightfall.palettes")
  local options = nightfall_config.get_options()
  local colors = palettes.get_palette(flavor, options.color_overrides[flavor])

  -- Load core themes
  local theme = {}
  local syntax = load_module("nightfall.groups.syntax")
  local editor = load_module("nightfall.groups.editor")
  if syntax and editor then
    local core_ok, core_theme = pcall(vim.tbl_deep_extend, "force", {}, syntax.get(colors), editor.get(colors))
    if not core_ok then error(string.format("Failed to load core themes: %s", core_theme)) end
    theme = core_theme
  end

  -- Load integration themes
  for name, config in pairs(options.integrations) do
    if config.enabled then
      local path = string.format("nightfall.groups.integrations.%s", name)
      local module = load_module(path)
      if module then
        local integration_ok, highlights = pcall(module.get, colors)
        if integration_ok then
          theme = vim.tbl_deep_extend("force", theme, highlights)
        else
          vim.notify(string.format("Failed to get highlights for %s: %s", name, highlights), vim.log.levels.WARN)
        end
      end
    end
  end

  -- Apply highlight overrides
  local overrides = options.highlight_overrides or {}
  local override_theme = apply_highlight_overrides(flavor, colors, overrides)

  return vim.tbl_deep_extend("force", theme, overrides.all or {}, override_theme)
end

---@param flavor NightfallFlavor
---@return table terminal_colors
function M.get_terminal_theme(flavor)
  local nightfall_config = require("nightfall.config")
  local options = nightfall_config.get_options()

  -- Get colors with overrides
  local palettes = require("nightfall.palettes")
  local colors = palettes.get_palette(flavor, options.color_overrides[flavor])

  -- Load terminal colors
  local terminal_module = load_module("nightfall.groups.terminal")
  if not terminal_module then return {} end

  local ok, terminal_colors = pcall(terminal_module.get, colors)
  if not ok then
    vim.notify(string.format("Failed to load terminal colors: %s", terminal_colors), vim.log.levels.WARN)
    return {}
  end

  return terminal_colors
end

return M
