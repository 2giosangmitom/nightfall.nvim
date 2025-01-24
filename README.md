# 🌆 Nightfall.nvim

**Nightfall.nvim** is a thoughtfully designed Neovim colorscheme tailored to enhance your coding experience. It combines a clean, minimalist aesthetic with multiple flavors to match your unique style. Built with an emphasis on reducing eye strain, Nightfall.nvim integrates seamlessly with major plugins and is perfect for extended coding sessions.

![Stars](https://img.shields.io/github/stars/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=apachespark&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41)
![Last commit](https://img.shields.io/github/last-commit/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=github&color=7dc4e4&logoColor=D9E0EE&labelColor=302D41)
![Forks](https://img.shields.io/github/forks/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41)
![Issues](https://img.shields.io/github/issues/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=lightning&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41)
![Repo size](https://img.shields.io/github/repo-size/2giosangmitom/nightfall.nvim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41)
![LICENSE](https://img.shields.io/github/license/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=alpinedotjs&color=ee999f&logoColor=D9E0EE&labelColor=302D41)

## ✨ Features

- ⚡️ **Automatic Caching:** Faster load times for a seamless experience.
- 🌲 **Treesitter Support:** Full compatibility with the `nvim-treesitter` plugin for enhanced syntax highlighting.
- 🎟️ **LSP Integration:** Effortlessly supports LSP semantic tokens for better code navigation.
- 🧩 **Plugin Compatibility:** Works beautifully with a variety of [popular plugins](#-supported-plugins).
- 🖌️ **Customizable:** Tailor the colorscheme to suit your preferences.
- 🏵 **Eye-Friendly:** Designed to reduce eye strain during long coding sessions.
- 🪁 **Multiple Flavors:** Match your coding style with different aesthetic options.
- 🍗 **Improved Readability:** A minimalist design to keep your focus on what matters.

## 🎨 Preview

## 🚀 Installation

Install Nightfall.nvim using your preferred Neovim plugin manager.

- With [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "2giosangmitom/nightfall.nvim",
  lazy = false,
  priority = 1000,
  opts = {}, -- Add custom configuration here
  config = function(_, opts)
    require("nightfall").setup(opts)
    vim.cmd("colorscheme nightfall") -- Or deeper-night, maron, nord
  end,
}
```

Now open your Neovim and `:h nightfall.nvim`. Enjoy!

## 🤝 Contributing

We’d love for you to contribute to Nightfall.nvim! Whether it’s fixing bugs, adding features, or improving documentation, your help is always welcome. Follow these steps to get started:

1. Clone the repository.
2. Load the plugin locally. If you're using [lazy.nvim](https://github.com/folke/lazy.nvim), you can copy the snippet below to the `.lazy.lua` file of the root directory of the project.
3. Create a new branch and start adding your code.

```lua
local augroup = vim.api.nvim_create_augroup("nightfall_dev", { clear = true })

-- Auto reload colorscheme when saving changes
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/lua/nightfall/**.lua",
  group = augroup,
  callback = function()
    for pack, _ in pairs(package.loaded) do
      if pack:match("^nightfall") then package.loaded[pack] = nil end
    end

    local nightfall = require("nightfall")
    nightfall.setup({
      transparent = false, -- Add custom configuration
    })
    nightfall.compile()
    vim.cmd.colorscheme(vim.g.colors_name)
    vim.notify("Nightfall reloaded", vim.log.levels.INFO, { title = "Nightfall" })
  end,
})

return {}
```

## ❤️ Support

If Nightfall.nvim enhances your coding experience, consider giving it a star 🌟 on GitHub and sharing it with others. Your support inspires us to make it even better!

## 📜 License

This project is licensed under the [MIT License](LICENSE).

## 🎖️ Acknowledgments

Nightfall.nvim wouldn't be where it is without inspiration from these amazing projects. A big thanks to:

- [Onedark Pro](https://github.com/olimorris/onedarkpro.nvim)
- [Catppuccin](https://github.com/catppuccin/nvim)
- [Nightfox](https://github.com/EdenEast/nightfox.nvim)
- [Tokyonight](https://github.com/folke/tokyonight.nvim)
