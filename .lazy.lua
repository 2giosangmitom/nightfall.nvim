local nightfall = require("nightfall")
local augroup = vim.api.nvim_create_augroup("nightfall_dev", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/lua/nightfall/**.lua",
  group = augroup,
  callback = function()
    nightfall.compile()
    nightfall.load(vim.g.colors_name)
    vim.notify("Reloaded", vim.log.levels.INFO, { title = "Nightfall" })
  end,
})

return {}
