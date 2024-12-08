local nightfall = require("nightfall")
local expect = MiniTest.expect

before_each(function() nightfall.setup() end)

describe("overrides the palette correctly", function()
  it("should override the colors correctly", function()
    local overrides = {
      bg = "#000000",
      fg = "#ffffff",
    }

    local default_palette = require("nightfall.palettes.nightfall")
    local expected_palette = vim.tbl_deep_extend("force", {}, default_palette, overrides)

    local palette = require("nightfall.palettes").get_palette("nightfall", overrides)
    expect.equality(expected_palette, palette)
  end)

  it("should return the default palette with no overrides", function()
    local default_palette = require("nightfall.palettes.nightfall")
    local palette = require("nightfall.palettes").get_palette("nightfall")
    MiniTest.expect.equality(default_palette, palette)
  end)
end)

describe("get_palette error handling", function()
  it("should return an error for an invalid flavor", function()
    local invalid_flavor = "invalid_flavor"
    expect.error(function() nightfall.get_palette(invalid_flavor) end)
  end)
end)
