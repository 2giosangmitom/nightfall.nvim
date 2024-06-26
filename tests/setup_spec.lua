describe("setup", function()
  it("should setup nightfall.nvim without error", function()
    assert.no_error(function() require("nightfall").setup() end)
  end)

  it("should set vim.g.colors_name to the specified flavor", function()
    local flavors = { "nightfall" }

    for _, v in ipairs(flavors) do
      vim.cmd.colorscheme(v)
      assert.equal(v, vim.g.colors_name)
    end
  end)
end)
