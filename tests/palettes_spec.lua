local nightfall = require("nightfall")
local expect = MiniTest.expect
local palettes = require("nightfall.palettes")

describe("palette management", function()
  before_each(function() nightfall.setup() end)

  describe("palette overrides", function()
    it("applies color overrides correctly", function()
      local overrides = {
        bg = "#000000",
        fg = "#ffffff",
      }

      local default_palette = require("nightfall.palettes.nightfall")
      local expected_palette = vim.tbl_deep_extend("force", {}, default_palette, overrides)
      local palette = palettes.get_palette("nightfall", overrides)

      expect.equality(palette, expected_palette)
      expect.equality(palette.bg, "#000000")
      expect.equality(palette.fg, "#ffffff")
    end)

    it("preserves non-overridden colors", function()
      local overrides = { bg = "#000000" }
      local default_palette = require("nightfall.palettes.nightfall")
      local palette = palettes.get_palette("nightfall", overrides)

      expect.equality(palette.fg, default_palette.fg)
      expect.equality(palette.bg, "#000000")
    end)

    it("returns unmodified default palette without overrides", function()
      local default_palette = require("nightfall.palettes.nightfall")
      local palette = palettes.get_palette("nightfall")
      expect.equality(palette, default_palette)
    end)
  end)

  describe("error handling", function()
    it("should return an error for an invalid flavor", function()
      local invalid_flavors = {
        "invalid",
        "handsome",
        "night",
      }

      for _, flavor in ipairs(invalid_flavors) do
        expect.error(function() nightfall.get_palette(flavor) end)
      end
    end)
  end)
end)
