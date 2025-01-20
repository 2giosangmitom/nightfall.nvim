local M = {}

local config = require("nightfall.config")
local CACHE_DIR = vim.fn.stdpath("cache") .. "/nightfall/"
local HASH_FILE = CACHE_DIR .. "cached_hash"
local SUPPORTED_FLAVORS = { "nightfall", "deeper-night", "maron", "nord", "white-night" }

--- Setup options for Nightfall.
M.setup = config.setup

--- Compile all supported flavors.
function M.compile()
  local compiler = require("nightfall.compiler")
  for _, flavor in ipairs(SUPPORTED_FLAVORS) do
    M.flavor = flavor
    compiler.compile(flavor)
  end
  vim.notify("Cached highlight values", vim.log.levels.INFO, { title = "Nightfall" })
end

--- User command for compile highlight values manually
vim.api.nvim_create_user_command("NightfallCompile", M.compile, {})

--- Load a colorscheme.
---@param flavor NightfallFlavor
function M.load(flavor)
  local me = debug.getinfo(1).source:sub(2):gsub("/[^/]+$", "") .. "/.git"
  local cached_hash = vim.fn.filereadable(HASH_FILE) == 1 and vim.fn.readfile(HASH_FILE)[1] or nil
  local options = config.get_options()
  local current_hash = require("nightfall.hashing").hash(options) .. vim.fn.getftime(me)

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

  -- Load the cached theme file
  local cache_file = CACHE_DIR .. string.format("%s.json", flavor)
  local theme = vim.fn.filereadable(cache_file) == 1 and vim.json.decode(vim.fn.readfile(cache_file)[1]) or nil
  if not theme then
    vim.notify(
      "An error occurred while reading the cache file.\nTry deleting the cache directory and restarting Neovim.\n"
        .. "Cache directory: "
        .. CACHE_DIR,
      vim.log.levels.ERROR,
      { title = "Nightfall" }
    )
    return
  end

  -- Clear existing highlights if any
  if vim.g.colors_name then vim.cmd("hi clear") end
  vim.g.colors_name = flavor
  if flavor == "white-night" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end

  local sethl = vim.api.nvim_set_hl

  -- Load core highlights
  for group, group_opts in pairs(theme.core) do
    if group_opts.style then
      for style, style_opts in pairs(group_opts.style) do
        group_opts[style] = style_opts
      end
    end
    group_opts.style = nil
    sethl(0, group, group_opts)
  end

  -- Load integration highlights
  for group, group_opts in pairs(theme.integrations) do
    if group_opts.style then
      for style, style_opts in pairs(group_opts.style) do
        group_opts[style] = style_opts
      end
    end
    group_opts.style = nil
    sethl(0, group, group_opts)
  end

  -- Load terminal highlights if enabled
  if options.terminal_colors then
    for name, color in pairs(theme.terminal) do
      vim.g[name] = color
    end
  end
end

return M
