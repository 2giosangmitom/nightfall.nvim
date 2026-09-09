--- User options and their defaults.
---
--- Overriding colors ~
---
--- `color_overrides` replaces entries of the palette before any highlight is
--- built, so a replaced color reaches every group that uses it. Keys are flavor
--- names, or `all` for every flavor, and a flavor's own entry wins.
---
--- >lua
---   require("nightfall").setup({
---     color_overrides = {
---       all = { fg = "#ffffff" },
---       nightfall = { bg = "#0b0b14" },
---     },
---   })
--- <
--- Overriding highlights ~
---
--- `highlight_overrides` replaces highlight groups after they are built. An
--- entry is a table of groups, or a function receiving the palette and
--- returning one, under `all` or under a flavor name. Keys a group does not
--- mention keep the value the colorscheme gave them.
---
--- >lua
---   require("nightfall").setup({
---     highlight_overrides = {
---       all = { Normal = { bg = "#120809" } },
---       nightfall = function(colors)
---         return { Comment = { fg = colors.teal, italic = false } }
---       end,
---     },
---   })
--- <
--- Integrations ~
---
--- Each key of `integrations` names a plugin and carries at least `enabled`.
--- Some take more: `fzf` and `telescope` accept a `style` of `"bordered"` or
--- `"borderless"`, and `mini`, `snacks`, `native_lsp` and `treesitter` have a
--- switch per feature. Set `default_integrations = false` to start from none
--- of them and opt back in one at a time.
---
--- >lua
---   require("nightfall").setup({
---     default_integrations = false,
---     integrations = {
---       telescope = { enabled = true, style = "borderless" },
---       treesitter = { enabled = true, context = true },
---     },
---   })
--- <
---@tag nightfall-config
---@toc_entry Options

local M = {}

---@tag NightfallStyles
---@class NightfallStyles
---@field comments? table
---@field keywords? table
---@field functions? table
---@field variables? table
---@field numbers? table
---@field exceptions? table
---@field conditionals? table
---@field constants? table
---@field operators? table
---@field coroutines? table
---@field strings? table
---@field types? table
---@field parameters? table
---@field booleans? table
---@field loops? table
---@field properties? table
---@field characters? table

---@tag NightfallOptions
---@class NightfallOptions
---@field transparent? boolean Skip every background color so the terminal shows through.
---@field terminal_colors? boolean Set the `terminal_color_*` globals from the palette.
---@field dim_inactive? boolean Darken windows that do not hold the cursor.
---@field default_integrations? boolean Start from every integration enabled.
---@field styles? NightfallStyles Extra attributes per syntax category.
---@field integrations? table<string,table> Per-plugin settings, keyed by integration name.
---@field color_overrides? table<string,table<string,string>> Palette colors to replace.
---@field highlight_overrides? table<string,table|fun(colors: NightfallPalette): table> Highlight groups to replace.

--- Default options.
---
--- Each key of `color_overrides` and `highlight_overrides` is either a flavor
--- name or `all`, which applies to every flavor. A `highlight_overrides` entry
--- may be a table, or a function receiving the palette and returning one.
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
---@type NightfallOptions
--minidoc_replace_start defaults = {
M.defaults = {
  --minidoc_replace_end
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
    blink = { enabled = true },
    flash = { enabled = true },
    fzf = { enabled = true, style = "bordered" },
    indent_blankline = { enabled = true },
    lazy = { enabled = true },
    mason = { enabled = true },
    mini = { enabled = true, icons = true, trailspace = true, indentscope = true },
    native_lsp = { enabled = true, semantic_tokens = true },
    neo_tree = { enabled = true },
    noice = { enabled = true },
    nvim_cmp = { enabled = true },
    render_markdown = { enabled = true },
    snacks = { enabled = true, dashboard = true, indent = true, picker = true },
    telescope = { enabled = true, style = "bordered" },
    treesitter = { enabled = true, context = true },
    which_key = { enabled = true },
  },
  color_overrides = {},
  highlight_overrides = {},
}
--minidoc_afterlines_end

--- Options in effect, rebuilt from the defaults on every |nightfall.setup()|.
---@type NightfallOptions
---@private
local options = vim.deepcopy(M.defaults)

--- Report a configuration mistake and where it was made.
---@param path string Dotted path of the offending key.
---@param expected string What that key accepts.
---@param got any What the user passed.
---@private
local function reject(path, expected, got)
  error(string.format("nightfall: `%s` expects %s, got %s", path, expected, type(got)), 0)
end

--- Reject unknown keys and values of the wrong type.
---@param user NightfallOptions
---@private
local function validate(user)
  for key, value in pairs(user) do
    if M.defaults[key] == nil then error(string.format("nightfall: unknown option `%s`", key), 0) end

    local expected = type(M.defaults[key])
    if type(value) ~= expected then reject(key, "a " .. expected, value) end
  end

  for name, integration in pairs(user.integrations or {}) do
    if type(integration) ~= "table" then reject("integrations." .. name, "a table", integration) end
  end

  for flavor, colors in pairs(user.color_overrides or {}) do
    if type(colors) ~= "table" then reject("color_overrides." .. flavor, "a table", colors) end
  end

  for flavor, groups in pairs(user.highlight_overrides or {}) do
    if type(groups) ~= "table" and type(groups) ~= "function" then
      reject("highlight_overrides." .. flavor, "a table or a function", groups)
    end
  end
end

--- Merge user options over the defaults and keep the result.
---
--- Safe to call more than once: every call starts from a fresh copy of the
--- defaults, so options never accumulate across calls.
---@param user? NightfallOptions Options to apply. Anything omitted keeps its default.
---@usage >lua
---   require("nightfall").setup({
---     transparent = true,
---     integrations = { flash = { enabled = false } },
---   })
--- <
function M.setup(user)
  user = user or {}
  validate(user)

  local base = vim.deepcopy(M.defaults)
  if user.default_integrations == false then base.integrations = {} end

  options = vim.tbl_deep_extend("force", base, user)
end

--- The options currently in effect.
---@return NightfallOptions
function M.get() return options end

return M
