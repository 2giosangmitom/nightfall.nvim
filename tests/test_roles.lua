local expect = MiniTest.expect
local palette = require("nightfall.palette")
local roles = require("nightfall.roles")

local T = MiniTest.new_set()

T["get"] = MiniTest.new_set()

T["get"]["reads the color a flavor gives a role"] = function()
  local colors = palette.get("nightfall")
  expect.equality(roles.get(colors, "nightfall", "string"), colors[roles.roles.string.nightfall])
end

T["get"]["rejects an unknown role"] = function()
  expect.error(function() roles.get(palette.get("nightfall"), "nightfall", "semicolon") end, "unknown syntax role")
end

T["get"]["rejects a flavor the role says nothing about"] = function()
  expect.error(function() roles.get(palette.get("nightfall"), "solarized", "string") end, "no color for flavor")
end

T["roles"] = MiniTest.new_set()

T["roles"]["name a color of every flavor"] = function()
  for name, role in pairs(roles.roles) do
    for _, flavor in ipairs(palette.flavors) do
      expect.equality(type(role[flavor]), "string", {
        fail_reason = string.format("role %s says nothing about the %s flavor", name, flavor),
      })
    end
  end
end

T["roles"]["name colors the palettes define"] = function()
  for _, flavor in ipairs(palette.flavors) do
    local colors = palette.get(flavor)

    for name, role in pairs(roles.roles) do
      expect.equality(colors[role[flavor]] ~= nil, true, {
        fail_reason = string.format("role %s wants %q, which %s does not define", name, role[flavor], flavor),
      })
    end
  end
end

return T
