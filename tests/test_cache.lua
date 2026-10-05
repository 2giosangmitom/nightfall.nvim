local expect = MiniTest.expect
local cache = require("nightfall.cache")
local config = require("nightfall.config")
local function key(flavor, sources) return cache.key(flavor or "nightfall", config.get(), sources) end
local function get() return cache.get("nightfall", config.get()) end

--- Path of the compiled file for a flavor.
---@param flavor string
---@return string
local function cache_file(flavor) return vim.fs.joinpath(vim.fn.stdpath("cache"), "nightfall", flavor) end

local T = MiniTest.new_set({
  hooks = {
    pre_case = function()
      config.setup({})
      cache.clear()
    end,
    post_once = function()
      config.setup({})
      cache.clear()
    end,
  },
})

T["key"] = MiniTest.new_set()

T["key"]["is stable for the same options"] = function() expect.equality(key(), key()) end

T["key"]["ignores table insertion order"] = function()
  config.setup({ color_overrides = { all = { bg = "#010203", fg = "#040506" } } })
  local before = key(nil, "s")
  local overrides = {}
  overrides.fg = "#040506"
  overrides.bg = "#010203"
  config.setup({ color_overrides = { all = overrides } })
  expect.equality(key(nil, "s"), before)
end

T["key"]["changes with the flavor"] = function() expect.no_equality(key("nightfall", "s"), key("maron", "s")) end

T["key"]["changes with the sources"] = function() expect.no_equality(key(nil, "a"), key(nil, "b")) end

T["key"]["changes with the options"] = function()
  local before = key(nil, "s")
  config.setup({ transparent = true })

  expect.no_equality(key(nil, "s"), before)
end

T["key"]["follows what an override function returns"] = function()
  config.setup({ highlight_overrides = { all = function() return { Normal = { bg = "#010203" } } end } })
  local before = key(nil, "s")

  config.setup({ highlight_overrides = { all = function() return { Normal = { bg = "#040506" } } end } })
  expect.no_equality(key(nil, "s"), before)
end

T["key"]["ignores the identity of an override function"] = function()
  config.setup({ highlight_overrides = { all = function() return { Normal = { bg = "#010203" } } end } })
  local before = key(nil, "s")

  config.setup({ highlight_overrides = { all = function() return { Normal = { bg = "#010203" } } end } })
  expect.equality(key(nil, "s"), before)
end

T["fingerprint"] = MiniTest.new_set()

T["fingerprint"]["is stable while the sources are"] = function()
  expect.equality(cache.fingerprint(), cache.fingerprint())
end

T["fingerprint"]["moves when a source file is rewritten"] = function()
  local source = "lua/nightfall/color.lua"
  local before = cache.fingerprint()
  local stat = vim.uv.fs_stat(source)

  -- An hour into the future, so this file is the newest whatever the others say.
  vim.uv.fs_utime(source, stat.atime.sec, os.time() + 3600)
  local after = cache.fingerprint()
  vim.uv.fs_utime(source, stat.atime.sec, stat.mtime.sec)

  expect.no_equality(after, before)
  expect.equality(cache.fingerprint(), before)
end

T["get"] = MiniTest.new_set()

T["get"]["writes a compiled file"] = function()
  get()
  expect.equality(vim.fn.filereadable(cache_file("nightfall")), 1)
end

T["get"]["returns the same theme from the cache"] = function()
  local built = get()
  local reloaded = get()

  expect.equality(reloaded, built)
end

T["get"]["rebuilds when the options change"] = function()
  local plain = get()

  config.setup({ transparent = true })
  expect.no_equality(get().highlights.Normal, plain.highlights.Normal)
end

T["get"]["survives a corrupt cache file"] = function()
  get()
  vim.fn.writefile({ "this is not lua bytecode" }, cache_file("nightfall"))

  local theme = get()
  expect.equality(theme.highlights.Normal ~= nil, true)
end

T["get"]["caches an override that reuses one table"] = function()
  local shared = { fg = "#010203" }
  config.setup({ highlight_overrides = { all = function() return { Normal = shared, Visual = shared } end } })

  get()
  expect.equality(vim.fn.filereadable(cache_file("nightfall")), 1)
end

T["get"]["skips the cache when asked to"] = function()
  vim.g.nightfall_no_cache = true
  get()
  vim.g.nightfall_no_cache = nil

  expect.equality(vim.fn.filereadable(cache_file("nightfall")), 0)
end

return T
