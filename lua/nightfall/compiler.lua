local M = {}
local path_sep = require("nightfall").path_sep

--- Parses style options for highlighting groups and generates Lua code.
---@param highlights table: The highlighting groups and their style options.
---@return string: Lua code representing the applied styles.
local function parse_style(highlights)
  local result = {}
  for group_name, hl_opts in pairs(highlights) do
    if type(hl_opts.style) == "table" then hl_opts = vim.tbl_extend("force", hl_opts, hl_opts.style) end
    hl_opts.style = nil

    local hl_str = string.format('vim.api.nvim_set_hl(0, "%s", %s)', group_name, vim.inspect(hl_opts))
    table.insert(result, hl_str)
  end
  return table.concat(result, "\n")
end

--- Compiles the theme for the specified flavor and writes it to a file.
---@param flavor string: The flavor of the theme to compile.
function M.compile(flavor)
  local Options = require("nightfall").Options
  local cache_dir = Options.compile_path

  if not (vim.uv or vim.loop).fs_stat(cache_dir) then vim.fn.mkdir(cache_dir, "p") end

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

  -- Include terminal colors if enabled
  if Options.terminal_colors then
    for k, v in pairs(terminal_theme) do
      table.insert(theme_lua_code, string.format("vim.g.%s = '%s'", k, v))
    end
  end

  -- Include integration themes
  for integration, integration_opts in pairs(Options.integrations) do
    if integration_opts.enabled then table.insert(theme_lua_code, parse_style(integration_themes[integration])) end
  end

  table.insert(theme_lua_code, "end, true)")

  -- Write theme Lua code to file
  local file_path = cache_dir .. path_sep .. flavor
  local file, err = io.open(file_path, "wb")
  if not file then error("Failed to open file: " .. err) end

  local lua_code = table.concat(theme_lua_code, "\n")
  local compiled_function, compile_err = load(lua_code)
  if not compiled_function then
    file:close()
    error(string.format("Failed to compile '%s' flavor: %s", flavor, compile_err))
  end

  local success, write_err = file:write(compiled_function())
  file:close()

  if not success then error("Failed to write compiled theme: " .. write_err) end
end

return M
