local M = {}

local CACHE_DIR = vim.fn.stdpath("cache") .. "/nightfall/"

--- Compiles the theme for a given flavor.
---@param flavor string The flavor of the theme to compile.
function M.compile(flavor)
  local core, terminal, integrations = require("nightfall.groups").get(flavor)
  local json_data = vim.json.encode({
    core = core,
    integrations = integrations,
    terminal = terminal,
  })

  if not vim.uv.fs_stat(CACHE_DIR) then vim.fn.mkdir(CACHE_DIR, "p") end

  local file_name = CACHE_DIR .. string.format("%s.json", flavor)
  local file, err = io.open(file_name, "w")
  if not file then error(string.format("Failed to open file '%s': %s", file_name, err)) end

  local success, write_err = file:write(json_data)
  file:close()

  if not success then error(string.format("Failed to write compiled theme to file '%s': %s", file_name, write_err)) end
end

return M
