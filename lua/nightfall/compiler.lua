local M = {}

local compile_path = vim.fn.stdpath("cache") .. "/nightfall/"

--- Writes compiled theme code to a file.
---@param file_path string The path to write the compiled theme to.
---@param lua_code string The Lua code to compile and write.
local function write_compiled_theme(file_path, lua_code)
  local f, compile_err = load(lua_code)
  if not f then error(string.format("Failed to compile theme: %s", compile_err)) end

  local file, err = io.open(file_path, "wb")
  if not file then error(string.format("Failed to open file '%s': %s", file_path, err)) end

  local ok, write_err = file:write(f())
  file:close()

  if not ok then error(string.format("Failed to write compiled theme: %s", write_err)) end
end

--- Parses style options for highlighting groups and generates Lua code.
---@param highlights table Highlighting groups and their style options.
---@return string Lua code representing the applied styles.
local function parse_highlights(highlights)
  local result = {}
  for group, opts in pairs(highlights) do
    if type(opts.style) == "table" then opts = vim.tbl_extend("force", opts, opts.style) end
    opts.style = nil

    local hl_str = string.format('vim.api.nvim_set_hl(0, "%s", %s)', group, vim.inspect(opts))
    table.insert(result, hl_str)
  end
  return table.concat(result, "\n")
end

--- Compiles the theme for a given flavor.
---@param flavor string The flavor of the theme to compile.
function M.compile(flavor)
  -- Ensure compile directory
  if not vim.uv.fs_stat(compile_path) then vim.fn.mkdir(compile_path, "p") end

  local config = require("nightfall.config").get_options()
  local theme = require("nightfall.groups").get_theme(flavor)

  local theme_code = {
    string.format(
      [[return string.dump(function()
vim.opt.termguicolors = true
vim.cmd("hi clear")
vim.opt.background = "dark"
vim.g.colors_name = "%s"
%s]],
      flavor,
      parse_highlights(theme)
    ),
  }

  -- Add terminal colors if enabled in the config
  if config.terminal_colors then
    local terminal_theme = require("nightfall.groups").get_terminal_theme(flavor)
    for k, v in pairs(terminal_theme) do
      table.insert(theme_code, string.format("vim.g.%s = '%s'", k, v))
    end
  end

  table.insert(theme_code, "end, true)")

  -- Write the compiled theme to a file
  local file_path = compile_path .. flavor
  local lua_code = table.concat(theme_code, "\n")
  write_compiled_theme(file_path, lua_code)
end

return M
