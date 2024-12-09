local M = {}

local config = require("nightfall.config")

--- Constants
local CACHE_DIR = vim.fn.stdpath("cache") .. "/nightfall/"
local HASH_FILE = CACHE_DIR .. "cached_hash"
local SUPPORTED_FLAVORS = { "nightfall" }

--- Setup options for Nightfall.
M.setup = config.setup

--- Compute the current hash based on config and file modification time.
---@return string Current hash
local function compute_current_hash()
  local me = debug.getinfo(1).source:sub(2):gsub("/[^/]+$", "") .. "/.git"
  return require("nightfall.hashing").hash(config.get_options()) .. vim.fn.getftime(me)
end

--- Read the cached hash from file.
---@return string|nil Cached hash
local function read_cached_hash()
  if vim.fn.filereadable(HASH_FILE) == 1 then return vim.fn.readfile(HASH_FILE)[1] end
  return nil
end

--- Write the current hash to the cache file.
---@param hash string Hash to write
local function write_hash(hash)
  local file, err = io.open(HASH_FILE, "wb")
  if file then
    file:write(hash)
    file:close()
  else
    vim.notify(("Failed to write hash file: %s"):format(err), vim.log.levels.ERROR, { title = "Nightfall" })
  end
end

--- Compile all supported flavors.
function M.compile()
  local compiler = require("nightfall.compiler")
  for _, flavor in ipairs(SUPPORTED_FLAVORS) do
    compiler.compile(flavor)
  end
end

--- Load a colorscheme.
---@param flavor string Flavor to load
function M.load(flavor)
  if not vim.tbl_contains(SUPPORTED_FLAVORS, flavor) then
    vim.notify(("Unsupported flavor: %s"):format(flavor), vim.log.levels.ERROR, { title = "Nightfall" })
    return
  end

  local cached_hash = read_cached_hash()
  local current_hash = compute_current_hash()

  if cached_hash ~= current_hash then
    M.compile()
    write_hash(current_hash)
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
