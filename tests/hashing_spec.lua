---@diagnostic disable: undefined-global
local nightfall = require("nightfall")
local expect = MiniTest.expect

local function config_hash(opts)
  nightfall.setup(opts)
  return require("nightfall.config").get_options()
end

describe("hashing module", function()
  local hash = require("nightfall.hashing")

  describe("primitive types", function()
    it("hashes strings consistently", function()
      expect.no_equality(hash.hash("hello"), hash.hash("world"))
      expect.equality(hash.hash("hello"), hash.hash("hello"))
      expect.equality(hash.hash(""), hash.hash(""))
    end)

    it("hashes numbers consistently", function()
      expect.no_equality(hash.hash(123), hash.hash(456))
      expect.equality(hash.hash(123), hash.hash(123))
      expect.equality(hash.hash(0), hash.hash(0))
      expect.equality(hash.hash(-1), hash.hash(-1))
      expect.equality(hash.hash(1.5), hash.hash(1.5))
    end)

    it("hashes booleans consistently", function()
      expect.no_equality(hash.hash(true), hash.hash(false))
      expect.equality(hash.hash(true), hash.hash(true))
      expect.equality(hash.hash(false), hash.hash(false))
    end)
  end)

  describe("table hashing", function()
    it("handles empty tables", function() expect.equality(hash.hash({}), hash.hash({})) end)

    it(
      "differentiates tables with different keys",
      function() expect.no_equality(hash.hash({ key1 = "value1" }), hash.hash({ key2 = "value2" })) end
    )

    it(
      "differentiates tables with same keys but different values",
      function() expect.no_equality(hash.hash({ key = "value1" }), hash.hash({ key = "value2" })) end
    )

    it("is order-independent", function() expect.equality(hash.hash({ a = 1, b = 2 }), hash.hash({ b = 2, a = 1 })) end)

    it("handles nested tables", function()
      expect.equality(hash.hash({ a = { b = 1 } }), hash.hash({ a = { b = 1 } }))
      expect.no_equality(hash.hash({ a = { b = 1 } }), hash.hash({ a = { b = 2 } }))
    end)
  end)

  describe("function hashing", function()
    it("handles basic function overrides", function()
      local hash1 = config_hash({
        highlight_overrides = {
          nightfall = function(colors) return { Normal = { fg = colors.red } } end,
        },
      })

      local hash2 = config_hash({
        highlight_overrides = {
          nightfall = function(colors) return { Normal = { fg = colors.sky } } end,
        },
      })

      expect.no_equality(hash1, hash2)
    end)

    it("handles multiple function overrides", function()
      local hash1 = config_hash({
        highlight_overrides = {
          nightfall = function(colors)
            return {
              Normal = { fg = colors.red },
              Visual = { bg = colors.blue },
            }
          end,
        },
      })

      local hash2 = config_hash({
        highlight_overrides = {
          nightfall = function(colors)
            return {
              Normal = { fg = colors.red },
              Visual = { bg = colors.green },
            }
          end,
        },
      })

      expect.no_equality(hash1, hash2)
    end)
  end)
end)
