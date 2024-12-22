local M = {}

local CACHE_DIR = vim.fn.stdpath("cache") .. "/nightfall/"

--- Compiles the theme for a given flavor.
---@param flavor string The flavor of the theme to compile.
function M.compile(flavor)
  -- Get the core, terminal, and integration highlights for the given flavor
  local core, terminal, integrations = require("nightfall.groups").get(flavor)

  -- Encode the highlights into a JSON string
  local json = vim.json.encode({
    core = core,
    integrations = integrations,
    terminal = terminal,
  })

  -- Create the cache directory if it doesn't exist
  if not vim.uv.fs_stat(CACHE_DIR) then vim.fn.mkdir(CACHE_DIR, "p") end

  -- Define the file name based on the flavor
  local file_name = CACHE_DIR .. string.format("%s.json", flavor)

  -- Open the file for writing
  local file, err = io.open(file_name, "w")
  if not file then error("Failed to open file '" .. file_name .. "': " .. err) end

  -- Write the JSON string to the file
  local success, write_err = file:write(json)
  file:close()

  if not success then error("Failed to write compiled theme to file '" .. file_name .. "': " .. write_err) end
end

return M
