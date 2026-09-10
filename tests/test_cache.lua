local expect = MiniTest.expect
local cache = require("nightfall.cache")
local config = require("nightfall.config")
local context = require("nightfall.context")

--- A context built from the current options.
---@param flavor? string
---@return table
local function ctx(flavor) return context.new(flavor or "nightfall", config.get()) end

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

T["key"]["is stable for the same options"] = function() expect.equality(cache.key(ctx()), cache.key(ctx())) end

T["key"]["changes with the flavor"] = function()
  expect.no_equality(cache.key(ctx("nightfall"), "s"), cache.key(ctx("maron"), "s"))
end

T["key"]["changes with the sources"] = function() expect.no_equality(cache.key(ctx(), "a"), cache.key(ctx(), "b")) end

T["key"]["changes with the options"] = function()
  local before = cache.key(ctx(), "s")
  config.setup({ transparent = true })

  expect.no_equality(cache.key(ctx(), "s"), before)
end

T["key"]["follows what an override function returns"] = function()
  config.setup({ highlight_overrides = { all = function() return { Normal = { bg = "#010203" } } end } })
  local before = cache.key(ctx(), "s")

  config.setup({ highlight_overrides = { all = function() return { Normal = { bg = "#040506" } } end } })
  expect.no_equality(cache.key(ctx(), "s"), before)
end

T["key"]["ignores the identity of an override function"] = function()
  config.setup({ highlight_overrides = { all = function() return { Normal = { bg = "#010203" } } end } })
  local before = cache.key(ctx(), "s")

  config.setup({ highlight_overrides = { all = function() return { Normal = { bg = "#010203" } } end } })
  expect.equality(cache.key(ctx(), "s"), before)
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
  cache.get(ctx())
  expect.equality(vim.fn.filereadable(cache_file("nightfall")), 1)
end

T["get"]["returns the same theme from the cache"] = function()
  local built = cache.get(ctx())
  local reloaded = cache.get(ctx())

  expect.equality(reloaded, built)
end

T["get"]["rebuilds when the options change"] = function()
  local plain = cache.get(ctx())

  config.setup({ transparent = true })
  expect.no_equality(cache.get(ctx()).highlights.Normal, plain.highlights.Normal)
end

T["get"]["survives a corrupt cache file"] = function()
  cache.get(ctx())
  vim.fn.writefile({ "this is not lua bytecode" }, cache_file("nightfall"))

  local theme = cache.get(ctx())
  expect.equality(theme.highlights.Normal ~= nil, true)
end

T["get"]["caches an override that reuses one table"] = function()
  local shared = { fg = "#010203" }
  config.setup({ highlight_overrides = { all = function() return { Normal = shared, Visual = shared } end } })

  cache.get(ctx())
  expect.equality(vim.fn.filereadable(cache_file("nightfall")), 1)
end

T["get"]["skips the cache when asked to"] = function()
  vim.g.nightfall_no_cache = true
  cache.get(ctx())
  vim.g.nightfall_no_cache = nil

  expect.equality(vim.fn.filereadable(cache_file("nightfall")), 0)
end

return T
