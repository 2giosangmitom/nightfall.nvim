local M = {}
local path_sep = require("nightfall").path_sep

---Parses style options for highlighting groups and generates Lua code.
---@param highlights table: The highlighting groups and their style options.
---@return string: Lua code representing the applied styles.
local function parse_style(highlights)
  local result = {}
  for group_name, hl_opts in pairs(highlights) do
    if hl_opts.style then
      if type(hl_opts.style) == "table" then hl_opts = vim.tbl_extend("force", hl_opts, hl_opts.style) end
    end
    hl_opts.style = nil

    local hl_str = string.format('vim.api.nvim_set_hl(0, "%s", %s)', group_name, vim.inspect(hl_opts))
    table.insert(result, hl_str)
  end
  return table.concat(result, "\n")
end

---Compiles the theme for the specified flavor and writes it to a file.
---@param flavor string: The flavor of the theme to compile.
function M.compile(flavor)
  local Options = require("nightfall").Options
  local cache_dir = Options.compile_path
  if not vim.loop.fs_stat(cache_dir) then vim.fn.mkdir(cache_dir, "p") end

  local defaults_theme, terminal_theme, integration_themes = require("nightfall.themes").get_theme(flavor)

  local theme_lua_code = {
    string.format(
      [[return string.dump(function()
vim.opt.termguicolors = true
if vim.g.colors_name then vim.cmd("hi clear") end
vim.opt.background = "dark"
vim.g.colors_name = "%s"
%s]],
      flavor,
      parse_style(defaults_theme)
    ),
  }

  if Options.terminal_colors then
    for k, v in pairs(terminal_theme) do
      table.insert(theme_lua_code, string.format("vim.g.%s = '%s'", k, v))
    end
  end

  for integration, integration_opts in pairs(Options.integrations) do
    if integration_opts.enabled then table.insert(theme_lua_code, parse_style(integration_themes[integration])) end
  end

  table.insert(theme_lua_code, "end, true)")

  -- Write theme Lua code to file
  local file_path = cache_dir .. path_sep .. flavor
  local file = assert(io.open(file_path, "wb"), "Permission denied while writing compiled file")
  local lua_code = table.concat(theme_lua_code, "\n")
  local f = load(lua_code)
  if not f then error(string.format("Could not compile '%s' flavor into '%s'", flavor, cache_dir), 0) end
  file:write(f())
  file:close()
end

return M
