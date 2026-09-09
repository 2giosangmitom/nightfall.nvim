local expect = MiniTest.expect
local color = require("nightfall.color")

local T = MiniTest.new_set()

T["blend"] = MiniTest.new_set()

T["blend"]["keeps the foreground at alpha 1"] = function()
  expect.equality(color.blend("#ff0000", "#00ff00", 1), "#ff0000")
end

T["blend"]["keeps the background at alpha 0"] = function()
  expect.equality(color.blend("#ff0000", "#00ff00", 0), "#00ff00")
end

T["blend"]["mixes evenly at alpha 0.5"] = function() expect.equality(color.blend("#ffffff", "#000000", 0.5), "#808080") end

T["blend"]["accepts uppercase input"] = function() expect.equality(color.blend("#FFFFFF", "#000000", 1), "#ffffff") end

T["blend"]["rejects a malformed color"] = function()
  expect.error(function() color.blend("ffffff", "#000000", 1) end, "invalid hex color")
  expect.error(function() color.blend("#fff", "#000000", 1) end, "invalid hex color")
  expect.error(function() color.blend("#gggggg", "#000000", 1) end, "invalid hex color")
end

T["darken"] = MiniTest.new_set()

T["darken"]["blends towards black by default"] = function() expect.equality(color.darken("#ffffff", 0.5), "#808080") end

T["darken"]["blends towards a given color"] = function()
  expect.equality(color.darken("#ffffff", 0, "#123456"), "#123456")
end

T["lighten"] = MiniTest.new_set()

T["lighten"]["blends towards white by default"] = function() expect.equality(color.lighten("#000000", 0.5), "#808080") end

T["lighten"]["blends towards a given color"] = function()
  expect.equality(color.lighten("#000000", 0, "#123456"), "#123456")
end

return T
