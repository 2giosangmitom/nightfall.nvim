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
  expect.equality(require("nightfall.palettes.nightfall").bg, "#141423")
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

--- The neutrals every flavor orders from the deepest surface to the brightest
--- foreground. Highlights pick a step by role, so the order has to hold.
local RAMP = {
  "black",
  "bg_dim",
  "bg",
  "bg_alt",
  "surface",
  "overlay",
  "border",
  "subtle",
  "gray",
  "silver",
  "fg",
  "latte",
  "white",
}

--- The relative luminance of a color, as defined by WCAG.
---@param hex string
---@return number
local function luminance(hex)
  local channels = {}
  for index = 1, 3 do
    local value = tonumber(hex:sub(index * 2, index * 2 + 1), 16) / 255
    channels[index] = value <= 0.03928 and value / 12.92 or ((value + 0.055) / 1.055) ^ 2.4
  end

  return 0.2126 * channels[1] + 0.7152 * channels[2] + 0.0722 * channels[3]
end

T["flavor"]["orders its neutrals from darkest to brightest"] = function(flavor)
  local colors = palette.get(flavor)

  for index = 2, #RAMP do
    local darker, lighter = RAMP[index - 1], RAMP[index]
    expect.equality(luminance(colors[darker]) < luminance(colors[lighter]), true, {
      fail_reason = string.format("%s: %s is not darker than %s", flavor, darker, lighter),
    })
  end
end

T["flavor"]["keeps comments and hues readable on its background"] = function(flavor)
  local colors = palette.get(flavor)
  local background = luminance(colors.bg) + 0.05

  for name, hex in pairs(colors) do
    -- The surfaces are backgrounds themselves, so contrast does not apply.
    if not vim.tbl_contains(RAMP, name) or name == "gray" or name == "silver" then
      expect.equality((luminance(hex) + 0.05) / background >= 4, true, {
        fail_reason = string.format("%s: %s has too little contrast against the background", flavor, name),
      })
    end
  end
end

T["flavor"]["has a colors file and a lualine theme"] = function(flavor)
  expect.equality(vim.fn.filereadable("colors/" .. flavor .. ".lua"), 1)
  expect.equality(vim.fn.filereadable("lua/lualine/themes/" .. flavor .. ".lua"), 1)
end

return T
