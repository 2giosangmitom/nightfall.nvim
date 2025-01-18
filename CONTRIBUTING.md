```lua
local augroup = vim.api.nvim_create_augroup("nightfall_dev", { clear = true })

vim.api.nvim_create_user_command("NightfallDev", function()
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*/lua/nightfall/**.lua",
    group = augroup,
    callback = function()
      for pack, _ in pairs(package.loaded) do
        if pack:match("^nightfall") then package.loaded[pack] = nil end
      end

      local nightfall = require("nightfall")
      nightfall.setup({
        transparent = false,
      })
      nightfall.compile()
      vim.schedule_wrap(function() vim.cmd("colorscheme " .. vim.g.colors_name) end)
      vim.notify("Nightfall reloaded", vim.log.levels.INFO, { title = "Nightfall" })
    end,
  })
end, {})

return {}
```
