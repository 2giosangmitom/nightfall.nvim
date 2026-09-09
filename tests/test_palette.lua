local expect = MiniTest.expect
local palette = require("nightfall.palette")

local T = MiniTest.new_set()

T["lists every shipped flavor"] = function() expect.equality(palette.flavors, { "nightfall", "deeper-night", "maron" }) end

T["get"] = MiniTest.new_set()

T["get"]["rejects an unknown flavor"] = function()
  expect.error(function() palette.get("solarized") end, "unknown flavor")
end

T["get"]["returns the palette untouched without overrides"] = function()
  expect.equality(palette.get("nightfall"), require("nightfall.palettes.nightfall"))
end

T["get"]["applies overrides"] = function() expect.equality(palette.get("nightfall", { bg = "#000000" }).bg, "#000000") end

T["get"]["leaves colors that were not overridden"] = function()
  local defaults = require("nightfall.palettes.nightfall")
  expect.equality(palette.get("nightfall", { bg = "#000000" }).fg, defaults.fg)
end

T["get"]["does not mutate the palette it reads"] = function()
  palette.get("nightfall", { bg = "#000000" })
  expect.equality(require("nightfall.palettes.nightfall").bg, "#141523")
end

--- Every flavor is checked the same way, so the cases are parametrized by name.
T["flavor"] = MiniTest.new_set({
  parametrize = { { "nightfall" }, { "deeper-night" }, { "maron" } },
})

T["flavor"]["defines the same colors as nightfall"] = function(flavor)
  local reference = vim.tbl_keys(palette.get("nightfall"))
  local keys = vim.tbl_keys(palette.get(flavor))

  table.sort(reference)
  table.sort(keys)
  expect.equality(keys, reference)
end

T["flavor"]["defines every color as a hex string"] = function(flavor)
  for name, hex in pairs(palette.get(flavor)) do
    expect.equality(type(hex) == "string" and hex:match("^#%x%x%x%x%x%x$") ~= nil, true, {
      fail_reason = string.format("%s.%s is %s", flavor, name, vim.inspect(hex)),
    })
  end
end

T["flavor"]["has a colors file and a lualine theme"] = function(flavor)
  expect.equality(vim.fn.filereadable("colors/" .. flavor .. ".lua"), 1)
  expect.equality(vim.fn.filereadable("lua/lualine/themes/" .. flavor .. ".lua"), 1)
end

return T
