---@diagnostic disable: missing-fields
local augroup = vim.api.nvim_create_augroup("nightfall_dev", { clear = true })

local function reload()
  for k in pairs(package.loaded) do
    if k:find("^nightfall") then package.loaded[k] = nil end
  end
  require("nightfall").setup({})
  require("nightfall").compile()
  vim.schedule(function() vim.cmd.colorscheme(vim.g.colors_name) end)
end

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  group = augroup,
  callback = reload,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/lua/nightfall/**.lua",
  group = augroup,
  callback = reload,
})

return {}
