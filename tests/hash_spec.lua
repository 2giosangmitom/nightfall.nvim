local hash_module = require("nightfall.hashing")
local bit = require("bit")

describe("hashing module", function()
  it("hashes strings correctly", function()
    local str1 = "hello"
    local str2 = "world"
    assert.is_not.equal(hash_module.hash(str1), hash_module.hash(str2))
    assert.are.equal(hash_module.hash(str1), hash_module.hash("hello"))
  end)

  it("hashes numbers correctly", function()
    local num1 = 123
    local num2 = 456
    assert.is_not.equal(hash_module.hash(num1), hash_module.hash(num2))
    assert.are.equal(hash_module.hash(num1), hash_module.hash(123))
  end)

  it("hashes booleans correctly", function()
    local bool1 = true
    local bool2 = false
    assert.is_not.equal(hash_module.hash(bool1), hash_module.hash(bool2))
    assert.are.equal(hash_module.hash(bool1), hash_module.hash(true))
  end)

  it("hashes tables with different keys correctly", function()
    local t1 = { key1 = "value1" }
    local t2 = { key2 = "value2" }
    assert.is_not.equal(hash_module.hash(t1), hash_module.hash(t2))
  end)

  it("hashes tables with same keys but different values correctly", function()
    local t1 = { key = "value1" }
    local t2 = { key = "value2" }
    assert.is_not.equal(hash_module.hash(t1), hash_module.hash(t2))
  end)

  it("is consistent regardless of table order", function()
    local t1 = { key1 = "value1", key2 = "value2" }
    local t2 = { key2 = "value2", key1 = "value1" }
    assert.are.equal(hash_module.hash(t1), hash_module.hash(t2))
  end)

  it("correctly hashes function based on nightfall options", function()
    local mock_palette = { green = "#00FF00", deep_navy = "#000080", black = "#000000" }
    package.loaded["nightfall.palettes"] = {
      get = function(flavor) return mock_palette end,
    }

    local nightfall = {
      Options = {
        highlight_overrides = {},
      },
    }
    package.loaded["nightfall"] = nightfall

    local t1 = {
      nightfall = function(colors)
        return {
          example_key = { fg = colors.green, bg = colors.deep_navy },
        }
      end,
    }
    require("nightfall").Options.highlight_overrides = t1
    local hash1 = hash_module.hash(require("nightfall").Options)

    local t2 = {
      nightfall = function(colors)
        return {
          example_key = { fg = colors.black, bg = colors.deep_navy },
        }
      end,
    }
    require("nightfall").Options.highlight_overrides = t2
    local hash2 = hash_module.hash(require("nightfall").Options)

    assert.is_not.equal(hash1, hash2)
  end)
end)
