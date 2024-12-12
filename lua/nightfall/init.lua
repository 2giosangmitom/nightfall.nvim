local M = {}

local config = require("nightfall.config")
local CACHE_DIR = vim.fn.stdpath("cache") .. "/nightfall/"
local HASH_FILE = CACHE_DIR .. "cached_hash"
local SUPPORTED_FLAVORS = { "nightfall", "deeper-night" }

--- Setup options for Nightfall.
M.setup = config.setup

--- Compile all supported flavors.
function M.compile()
  local compiler = require("nightfall.compiler")
  for _, flavor in ipairs(SUPPORTED_FLAVORS) do
    compiler.compile(flavor)
    vim.notify(("Theme '%s' compiled successfully!"):format(flavor), vim.log.levels.INFO, { title = "Nightfall" })
  end
end

--- Load a colorscheme.
---@param flavor string Flavor to load
function M.load(flavor)
  if not vim.tbl_contains(SUPPORTED_FLAVORS, flavor) then
    vim.notify(("Unsupported flavor: %s"):format(flavor), vim.log.levels.ERROR, { title = "Nightfall" })
    return
  end

  local me = debug.getinfo(1).source:sub(2):gsub("/[^/]+$", "") .. "/.git"
  local cached_hash = vim.fn.filereadable(HASH_FILE) == 1 and vim.fn.readfile(HASH_FILE)[1] or nil
  local current_hash = require("nightfall.hashing").hash(config.get_options()) .. vim.fn.getftime(me)

  if cached_hash ~= current_hash then
    M.compile()

    local file, err = io.open(HASH_FILE, "wb")
    if file then
      file:write(current_hash)
      file:close()
    else
      vim.notify(("Failed to write hash file: %s"):format(err), vim.log.levels.ERROR, { title = "Nightfall" })
    end
  end

  local flavor_file = CACHE_DIR .. flavor
  local f = loadfile(flavor_file)
  if not f then
    vim.notify(
      ("Cache for flavor '%s' not found. Recompiling..."):format(flavor),
      vim.log.levels.WARN,
      { title = "Nightfall" }
    )
    M.compile()
    f = assert(loadfile(flavor_file), "could not load compiled flavor")
  end
  f()
end

return M
