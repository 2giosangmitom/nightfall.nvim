---@diagnostic disable: undefined-global
local expect = MiniTest.expect
local palettes = require("nightfall.palettes")

describe("palette overrides", function()
  it("applies color overrides correctly", function()
    local overrides = {
      bg = "#000000",
      fg = "#ffffff",
    }

    local default_palette = require("nightfall.palettes.nightfall").get()
    local expected_palette = vim.tbl_deep_extend("force", {}, default_palette, overrides)
    local palette = palettes.get_palette("nightfall", overrides)

    expect.equality(palette, expected_palette)
  end)

  it("preserves non-overridden colors", function()
    local overrides = { bg = "#000000" }
    local default_palette = require("nightfall.palettes.nightfall").get()
    local palette = palettes.get_palette("nightfall", overrides)

    expect.equality(palette.fg, default_palette.fg)
    expect.equality(palette.bg, "#000000")
  end)

  it("returns unmodified default palette without overrides", function()
    local default_palette = require("nightfall.palettes.nightfall").get()
    local palette = palettes.get_palette("nightfall")

    expect.equality(palette, default_palette)
  end)
end)
