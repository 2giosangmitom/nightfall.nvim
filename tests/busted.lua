---@diagnostic disable: missing-fields
vim.env.LAZY_STDPATH = "deps"
load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"))()

-- Setup lazy
require("lazy.minit").setup({
  spec = {
    { dir = vim.uv.cwd() },
  },
})
