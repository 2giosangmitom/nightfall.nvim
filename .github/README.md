# 🌆 Nightfall.nvim

Nightfall.nvim is a meticulously crafted Neovim colorscheme designed to enhance your coding experience. It offers a clean and minimalist design with multiple flavors to match your coding style. Nightfall.nvim also focuses on reducing eye strain and integrates seamlessly with major plugins.

![Stars](https://img.shields.io/github/stars/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=apachespark&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41)
![Last commit](https://img.shields.io/github/last-commit/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=github&color=7dc4e4&logoColor=D9E0EE&labelColor=302D41)
![Forks](https://img.shields.io/github/forks/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41)
![Issues](https://img.shields.io/github/issues/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=lightning&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41)
![Repo size](https://img.shields.io/github/repo-size/2giosangmitom/nightfall.nvim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41)
![LICENSE](https://img.shields.io/github/license/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=alpinedotjs&color=ee999f&logoColor=D9E0EE&labelColor=302D41)

> [!NOTE]
> Nightfall.nvim is currently in active development, with ongoing enhancements and refinements being made to continuously improve the experience.

## 🌟 Key Features

- 📩 Automatic caching ensures faster load times.
- 🌲 Full [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) support.
- 🎟️ Seamlessly integrates with LSP semantic tokens (requires Neovim 0.9 or later).
- 🧩 Extensive support for many [popular plugins](#-supported-plugins), enhancing your Neovim experience.
- 🖌️ Extensive customization options to personalize your experience.
- 🏵 Reduced eye strain for extended coding sessions.
- 🪁 Match your coding style with multiple flavors.
- 🍗 Improved code readability with a clean and minimalist design.

## 🎨 Flavors

Nightfall.nvim offers multiple themes to suit your coding style:

- **Nightfall**: A dark and vibrant variation inspired by the Dracula theme.
- **Deeper Night**: A more intense dark theme for those who prefer a starker contrast.
- **Maron**: A warm, brown-tinged dark theme, offering a softer feel for extended coding sessions.

## 🚀 Installation

Install Nightfall.nvim using your preferred Neovim plugin manager.

### With [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "2giosangmitom/nightfall.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}
```

For detailed documentation, use `:h nightfall.nvim` in Neovim.

## 🖋️ Usage

Activate Nightfall.nvim with the following command:

```lua
vim.cmd.colorscheme("nightfall") -- Variants: `deeper-night`, `maron`
```

Refer to `:h nightfall.nvim_usage` in Neovim for advanced usage.

## ⚙️ Configuration

Configure Nightfall.nvim to match your preferences before loading the colorscheme. Nightfall can pre-compute the results of your configuration and store them in a compiled Lua file for faster startup times. For default configuration details, see `:h nightfall.nvim_defaults`.

```lua
require("nightfall").setup({
  compile_path = vim.fn.stdpath("cache") .. "/nightfall",
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    numbers = {},
    conditionals = {},
    constants = {},
    operators = {},
    strings = {},
    types = {},
    booleans = {},
    loops = {},
  },
  default_integrations = true,
  integrations = {
    lazy = { enabled = true },
    telescope = { enabled = true, style = "borderless" },
    illuminate = { enabled = true },
    treesitter = { enabled = true, context = true },
    lspconfig = { enabled = true },
    flash = { enabled = false },
  },
})
```

## 🎨 Customizing Colors & Highlight Groups

Customize colors and highlight groups to match your preferences using `color_overrides` and `highlight_overrides`. See `:h nightfall.nvim_overriding` for more details.

### Customizing Colors

```lua
require("nightfall").setup({
  color_overrides = {
    all = { foreground = "#ffffff" },
    nightfall = { background = "#ff0000" },
  },
})
```

### Customizing Highlight Groups

```lua
require("nightfall").setup({
  highlight_overrides = {
    all = { Normal = { bg = "#120809" } },
    nightfall = function(colors) return { Normal = { bg = colors.black } } end,
  },
})
```

## 🛠️ Integrations

Nightfall.nvim seamlessly integrates with other Neovim plugins. Here's how you can configure it:

```lua
require("nightfall").setup({
  integrations = {
    lazy = { enabled = true },
    telescope = { enabled = true, style = "borderless" },
    illuminate = { enabled = true },
    treesitter = { enabled = true, context = true },
    lspconfig = { enabled = true },
    flash = { enabled = false },
  }
})
```

Certain integrations are enabled by default, but you can customize this behavior with the `default_integrations` option:

```lua
require("nightfall").setup({
  default_integrations = false,
})
```

For more detailed information, refer to `:h nightfall.nvim_integrations`.

### 🪼 Supported Plugins

- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [headlines.nvim](https://github.com/lukas-reineke/headlines.nvim)
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)

## 🤝 Contributing

Join the Nightfall.nvim community! Refer to the [CONTRIBUTING](./CONTRIBUTING.md) file for details.

## 🎖️ Credits

Nightfall.nvim owes gratitude to the following projects for their inspiration and contributions:

- [Onedark Pro](https://github.com/olimorris/onedarkpro.nvim)
- [Catppuccin](https://github.com/catppuccin/nvim)
- [Nightfox](https://github.com/EdenEast/nightfox.nvim)
- [Tokyonight](https://github.com/folke/tokyonight.nvim)

Their dedication to enhancing the Neovim ecosystem has played a significant role in shaping Nightfall.nvim's development.
