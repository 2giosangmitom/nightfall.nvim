local nightfall = require("nightfall")
local hash = require("nightfall.hashing").hash

describe("hashing functionality", function()
  describe("detecting differences", function()
    it("in keys", function()
      local t1 = { custom_highlight = {} }
      local t2 = { ustom_highlight = {} }
      assert.not_equal(hash(t1), hash(t2))
    end)

    it("in boolean values", function()
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
      assert.not_equal(hash(t1), hash(t2))
    end)

    it("in highlight_overrides function", function()
      nightfall.setup({
        highlight_overrides = {
          nightfall = function(colors)
            return {
              St_pos_sep = { fg = colors.green, bg = colors.deep_navy },
              St_pos_icon = { fg = colors.black, bg = colors.green },
            }
          end,
        },
      })
      local hash1 = hash(nightfall.Options)

      nightfall.setup({
        highlight_overrides = {
          nightfall = function(colors)
            return {
              St_pos_sep = { fg = colors.green, bg = colors.deep_navy },
              St_pos_icon = { fg = colors.black, bg = colors.green },
              St_lspSv = { fg = colors.peach, bg = colors.statusline_bg },
            }
          end,
        },
      })
      local hash2 = hash(nightfall.Options)
      assert.not_equal(hash1, hash2)
    end)
  end)

  describe("consistency", function()
    it("regardless of table order", function()
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
      assert.equal(hash(t1), hash(t2))
    end)
  end)
end)
