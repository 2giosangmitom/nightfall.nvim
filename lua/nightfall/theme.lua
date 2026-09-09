--- Assembly of a complete theme from the individual group modules.
---@tag nightfall-theme
---@toc_entry Themes

local M = {}

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
---@param ctx NightfallCtx
---@return table<string,table>
function M.overrides(ctx)
  local all = as_groups(ctx.o.highlight_overrides.all, ctx.c)
  local flavor = as_groups(ctx.o.highlight_overrides[ctx.flavor], ctx.c)

  return vim.tbl_deep_extend("force", vim.deepcopy(all), flavor)
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
---@param ctx NightfallCtx
---@return table<string,table>
---@private
local function integration_highlights(ctx)
  local result = {}

  for name, opts in pairs(ctx.o.integrations) do
    if opts.enabled then
      local ok, module = pcall(require, "nightfall.groups.integrations." .. name)
      if ok then
        result = vim.tbl_extend("force", result, module.get(ctx, opts))
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
---@param ctx NightfallCtx Context to build for.
---@return NightfallTheme
function M.build(ctx)
  local highlights =
    vim.tbl_extend("error", require("nightfall.groups.editor").get(ctx), require("nightfall.groups.syntax").get(ctx))
  highlights = vim.tbl_extend("force", highlights, integration_highlights(ctx))
  highlights = vim.tbl_deep_extend("force", highlights, M.overrides(ctx))

  return {
    highlights = flatten_styles(highlights),
    terminal = ctx.o.terminal_colors and require("nightfall.groups.terminal").get(ctx) or {},
  }
end

return M
