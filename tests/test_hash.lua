local hash_module = require("nightfall.hashing")
local not_eq, eq = MiniTest.expect.no_equality, MiniTest.expect.equality

describe("hashing module", function()
  it("hashes strings correctly", function()
    local str1 = "hello"
    local str2 = "world"
    not_eq(hash_module.hash(str1), hash_module.hash(str2))
    eq(hash_module.hash(str1), hash_module.hash("hello"))
  end)

  it("hashes numbers correctly", function()
    local num1 = 123
    local num2 = 456
    not_eq(hash_module.hash(num1), hash_module.hash(num2))
    eq(hash_module.hash(num1), hash_module.hash(123))
  end)

  it("hashes booleans correctly", function()
    local bool1 = true
    local bool2 = false
    not_eq(hash_module.hash(bool1), hash_module.hash(bool2))
    eq(hash_module.hash(bool1), hash_module.hash(true))
  end)

  it("hashes tables with different keys correctly", function()
    local t1 = { key1 = "value1" }
    local t2 = { key2 = "value2" }
    not_eq(hash_module.hash(t1), hash_module.hash(t2))
  end)

  it("hashes tables with same keys but different values correctly", function()
    local t1 = { key = "value1" }
    local t2 = { key = "value2" }
    not_eq(hash_module.hash(t1), hash_module.hash(t2))
  end)

  it("is consistent regardless of table order", function()
    local t1 = { key1 = "value1", key2 = "value2" }
    local t2 = { key2 = "value2", key1 = "value1" }
    eq(hash_module.hash(t1), hash_module.hash(t2))
  end)

  it("correctly hashes functions based on nightfall options", function()
    local mock_palette = { green = "#00ff00", deep_navy = "#000080", black = "#000000" }

    package.loaded["nightfall.palettes"] = {
      get = function(_) return mock_palette end,
    }

    local nightfall = {
      Options = {
        highlight_overrides = {},
      },
    }
    package.loaded["nightfall"] = nightfall

    local function setup_highlight_overrides(overrides)
      nightfall.Options.highlight_overrides = overrides
      return hash_module.hash(nightfall.Options)
    end

    local hash1 = setup_highlight_overrides({
      nightfall = function(colors)
        return {
          example_key = { fg = colors.green, bg = colors.deep_navy },
        }
      end,
    })

    local hash2 = setup_highlight_overrides({
      nightfall = function(colors)
        return {
          example_key = { fg = colors.black, bg = colors.deep_navy },
        }
      end,
    })

    not_eq(hash1, hash2)
  end)
end)
