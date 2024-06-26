describe("nightfall.nvim setup", function()
  it("should setup nightfall.nvim without error", function()
    assert.has_no.errors(function() require("nightfall").setup() end)
  end)

  it("should set vim.g.colors_name to the specified flavor", function()
    local flavors = require("nightfall").supported_flavors

    for _, flavor in ipairs(flavors) do
      vim.cmd.colorscheme(flavor)
      assert.are.equal(flavor, vim.g.colors_name)
    end
  end)
end)
