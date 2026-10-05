--- Reuse of already-built themes across Neovim sessions.
---
--- Building a theme costs a few milliseconds, so the result is written to the
--- cache directory as precompiled Lua and reloaded on the next start. The cache
--- is an implementation detail: it has no user command and never reports an
--- error, because a cache problem must not stop the colorscheme from loading.
--- Set `vim.g.nightfall_no_cache` to skip it while developing.
---@tag nightfall-cache

local M = {}

--- Where compiled themes live, one file per flavor.
local DIR = vim.fs.joinpath(vim.fn.stdpath("cache"), "nightfall")

--- Directory holding this plugin's Lua sources.
---
--- Made absolute, because the runtimepath entry this file was loaded from may
--- be relative, and the fingerprint must not depend on the working directory.
local SOURCE_DIR = vim.fn.fnamemodify(
  -- This file is `<source dir>/nightfall/cache.lua`, so climb two levels.
  vim.fs.dirname(vim.fs.dirname(vim.fs.normalize(debug.getinfo(1, "S").source:sub(2)))),
  ":p"
)

--- A fingerprint of this plugin's own sources.
---
--- The plugin is not versioned and users track its latest commit, so the cache
--- has to notice an update on its own. The newest modification time across the
--- Lua sources moves whenever any of them is rewritten by a pull.
---@return string
---@private
function M.fingerprint()
  local newest = 0

  for name, kind in vim.fs.dir(SOURCE_DIR, { depth = 8 }) do
    if kind == "file" then
      local stat = vim.uv.fs_stat(vim.fs.joinpath(SOURCE_DIR, name))
      -- Seconds alone are too coarse for edits made in quick succession.
      local mtime = stat and (stat.mtime.sec + stat.mtime.nsec * 1e-9) or 0
      newest = math.max(newest, mtime)
    end
  end

  return string.format("%.9f", newest)
end

--- The cache key for a flavor and its options.
---
--- Overrides are resolved to plain tables first, so a `highlight_overrides`
--- function is compared by what it returns rather than by its identity, which
--- changes on every reload.
---@param flavor NightfallFlavor
---@param options NightfallOptions
---@param sources? string Source fingerprint. Defaults to |nightfall.cache.fingerprint()|.
---@return string
function M.key(flavor, options, sources)
  local colors = require("nightfall.palette").resolve(flavor, options)
  local opts = vim.tbl_extend("force", options, {
    highlight_overrides = require("nightfall.theme").overrides(colors, options, flavor),
  })

  return vim.fn.sha256(vim.inspect({ flavor = flavor, sources = sources or M.fingerprint(), options = opts }))
end

--- Path of the compiled file for one flavor.
---@param flavor NightfallFlavor
---@return string
---@private
local function path_for(flavor) return vim.fs.joinpath(DIR, flavor) end

--- Read a compiled theme, if one is there and still matches `key`.
---@param flavor NightfallFlavor
---@param key string
---@return NightfallTheme|nil
---@private
local function read(flavor, key)
  local chunk = loadfile(path_for(flavor))
  if not chunk then return nil end

  local ok, compiled = pcall(chunk)
  if not ok or type(compiled) ~= "table" or compiled.key ~= key then return nil end

  return compiled.theme
end

--- Write a compiled theme, ignoring any failure to do so.
---@param flavor NightfallFlavor
---@param key string
---@param theme NightfallTheme
---@private
local function write(flavor, key, theme)
  -- `vim.inspect` writes a back reference rather than a table it has already
  -- seen, which is not valid Lua to read back. A user override may well return
  -- one table for several groups, so the copy drops shared references first.
  local source = string.format("return { key = %q, theme = %s }", key, vim.inspect(vim.deepcopy(theme, true)))
  local chunk = load(source, "@nightfall." .. flavor)
  if not chunk then return end

  vim.fn.mkdir(DIR, "p")

  local file = io.open(path_for(flavor), "wb")
  if not file then return end

  file:write(string.dump(chunk))
  file:close()
end

--- The theme for a flavor, built only when the cache cannot supply it.
---@param flavor NightfallFlavor
---@param opts NightfallOptions
---@return NightfallTheme
function M.get(flavor, opts)
  local enabled = not vim.g.nightfall_no_cache
  local key = M.key(flavor, opts)

  if enabled then
    local cached = read(flavor, key)
    if cached then return cached end
  end

  local theme = require("nightfall.theme").build(flavor, opts)
  if enabled then pcall(write, flavor, key, theme) end

  return theme
end

--- Delete every compiled theme.
---@private
function M.clear() vim.fn.delete(DIR, "rf") end

return M
