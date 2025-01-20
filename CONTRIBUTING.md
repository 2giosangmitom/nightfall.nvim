# 🤝 Contribute to Nightfall.nvim

Thank you for your interest in contributing to Nightfall.nvim! Contributions are always welcome and greatly appreciated. Follow these steps to get started:

1. Clone the repository.
2. Load the plugin locally. If you're using [lazy.nvim](https://github.com/folke/lazy.nvim), you can copy the snippet below to the `.lazy.lua` file of the root directory of the project.
3. Create a new branch and start adding your code.

```lua
local augroup = vim.api.nvim_create_augroup("nightfall_dev", { clear = true })

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
    vim.cmd.colorscheme(vim.g.colors_name)
    vim.notify("Nightfall reloaded", vim.log.levels.INFO, { title = "Nightfall" })
  end,
})

return {}
```
