--- Assembly of a complete theme from the individual group modules.
---@tag nightfall-theme
---@toc_entry Themes

local palette = require("nightfall.palette")

local M = {}

---@class NightfallIntegrationOptions: table
---@field transparent boolean
---@field styles NightfallStyles
---@private

---@tag NightfallTheme
---@class NightfallTheme
---@field highlights table<string,table> Groups ready for |nvim_set_hl()|.
---@field terminal table<string,string> `terminal_color_*` globals.

--- Turn a `highlight_overrides` entry into a plain table of groups.
---
--- An entry is either a table of groups or a function of the palette.
---@param entry table|fun(colors: NightfallPalette): table|nil
---@param colors NightfallPalette
---@return table<string,table>
---@private
local function as_groups(entry, colors)
  if type(entry) == "function" then return entry(colors) or {} end
  return entry or {}
end

--- The highlight overrides that apply to this flavor.
---
--- Entries under the flavor's own key win over entries under `all`.
---@param colors NightfallPalette
---@param opts NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.overrides(colors, opts, flavor)
  local entries = opts.highlight_overrides or {}
  local all = as_groups(entries.all, colors)
  local specific = as_groups(entries[flavor], colors)

  return vim.tbl_deep_extend("force", vim.deepcopy(all), specific)
end

--- Fold each spec's `style` sub-table into the spec itself.
---
--- Group modules write `style = opts.styles.comments` so a user's style table
--- drops straight in. Neovim wants those attributes at the top level, so they
--- are folded up once here rather than at every call site.
---@param highlights table<string,table>
---@return table<string,table>
---@private
local function flatten_styles(highlights)
  for _, spec in pairs(highlights) do
    if type(spec.style) == "table" then
      for attribute, value in pairs(spec.style) do
        spec[attribute] = value
      end
    end
    spec.style = nil
  end

  return highlights
end

--- Highlights contributed by every enabled integration.
---@param colors NightfallPalette
---@param options NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
---@private
local function integration_highlights(colors, options, flavor)
  local result = {}

  for name, opts in pairs(options.integrations) do
    if opts.enabled then
      local ok, module = pcall(require, "nightfall.groups.integrations." .. name)
      if ok then
        -- Integrations receive their own settings plus shared rendering options.
        local settings = vim.tbl_extend("force", opts, {
          transparent = options.transparent,
          styles = options.styles,
        })
        result = vim.tbl_extend("force", result, module.get(colors, settings, flavor))
      else
        vim.notify_once(
          string.format("nightfall: no integration named %q", name),
          vim.log.levels.WARN,
          { title = "Nightfall" }
        )
      end
    end
  end

  return result
end

--- Build every highlight for one flavor.
---@param flavor NightfallFlavor Flavor to build.
---@param opts NightfallOptions Resolved user options.
---@return NightfallTheme
function M.build(flavor, opts)
  local colors = palette.resolve(flavor, opts)
  local highlights = vim.tbl_extend(
    "error",
    require("nightfall.groups.editor").get(colors, opts, flavor),
    require("nightfall.groups.syntax").get(colors, opts, flavor)
  )
  highlights = vim.tbl_extend("force", highlights, integration_highlights(colors, opts, flavor))
  highlights = vim.tbl_deep_extend("force", highlights, M.overrides(colors, opts, flavor))

  return {
    highlights = flatten_styles(highlights),
    terminal = opts.terminal_colors and require("nightfall.groups.terminal").get(colors) or {},
  }
end

return M
