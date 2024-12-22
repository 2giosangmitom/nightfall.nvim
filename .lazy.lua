local nightfall = require("nightfall")
local augroup = vim.api.nvim_create_augroup("nightfall_dev", { clear = true })

vim.api.nvim_create_user_command("NightfallDev", function()
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*/lua/nightfall/**.lua",
    group = augroup,
    callback = function()
      for pack, _ in pairs(package.loaded) do
        if pack:match("^nightfall.") then package.loaded[pack] = nil end
      end
      nightfall.compile()
      nightfall.load(vim.g.colors_name)
      vim.notify("Reloaded", vim.log.levels.INFO, { title = "Nightfall" })
    end,
  })
end, {})

return {}
