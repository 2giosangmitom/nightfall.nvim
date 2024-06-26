describe("nightfall.nvim setup", function()
  local setup_nightfall = require("nightfall").setup
  local set_colorscheme = require("nightfall").load

  it("should setup nightfall.nvim without error", function()
    assert.has_no.errors(function() setup_nightfall() end)
  end)

  it("should set vim.g.colors_name to the specified flavor", function()
    local flavors = { "nightfall" }

    for _, v in ipairs(flavors) do
      set_colorscheme(v)
      assert.equals(v, vim.g.colors_name)
    end
  end)
end)
