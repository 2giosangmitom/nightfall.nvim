describe("hash", function()
  local hash = require("nightfall.hashing").hash

  it("detects differences in keys", function()
    local t1 = { custom_highlight = {} }
    local t2 = { ustom_highlight = {} }
    assert.are_not.equals(hash(t1), hash(t2))
  end)

  it("is consistent regardless of table order", function()
    local t1 = {
      custom_highlight = {
        Search = { fg = "#F5C2E7", bg = "#45475A", style = { bold = true } },
        IncSearch = { fg = "#45475A", bg = "#F5C2E7" },
      },
    }
    local t2 = {
      custom_highlight = {
        Search = { style = { bold = true }, bg = "#45475A", fg = "#F5C2E7" },
        IncSearch = { bg = "#F5C2E7", fg = "#45475A" },
      },
    }
    assert.equals(hash(t1), hash(t2))
  end)

  it("detects differences in boolean values", function()
    local t1 = {
      integrations = {
        flash = { enabled = false },
        treesitter = { enabled = true, context = false },
      },
    }
    local t2 = {
      integrations = {
        flash = { enabled = true },
        treesitter = { enabled = true, context = false },
      },
    }
    assert.are_not.equals(hash(t1), hash(t2))
  end)
end)
