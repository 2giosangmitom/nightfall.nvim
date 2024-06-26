# 🌌 Nightfall.nvim: Embrace the Serenity of Coding in the Depths of Darkness

Ready to **unleash your coding potential**? Nightfall.nvim is a meticulously crafted Neovim colorscheme designed to **transform** your coding experience. Dive into a world of focus and productivity with a palette that enhances code readability, reduces eye strain, and seamlessly integrates with your favorite plugins.

![Stars](https://img.shields.io/github/stars/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=apachespark&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41)
![Last commit](https://img.shields.io/github/last-commit/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=github&color=7dc4e4&logoColor=D9E0EE&labelColor=302D41)
![Forks](https://img.shields.io/github/forks/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41)
![Issues](https://img.shields.io/github/issues/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=lightning&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41)
![Repo size](https://img.shields.io/github/repo-size/2giosangmitom/nightfall.nvim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41)
![Release](https://img.shields.io/github/v/release/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=gitbook&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41)
![LICENSE](https://img.shields.io/github/license/2giosangmitom/nightfall.nvim?style=for-the-badge&logo=alpinedotjs&color=ee999f&logoColor=D9E0EE&labelColor=302D41)

> [!NOTE]
> Nightfall.nvim is actively under development, continuously evolving with enhancements and refinements.

## 🌟 Key Features

- Improved code readability with a clean and minimalist design
- Match your coding style with multiple flavors
- Reduced eye strain for extended coding sessions
- Extensive customization options to personalize your experience
- Seamless integration with major plugins

## 🎨 Flavors

Nightfall.nvim offers multiple flavors to suit your coding style:

- **Nightfall**: A dark and vibrant variation inspired by the Dracula theme.
- **Deeper Night**: A more intense dark theme for those who prefer a starker contrast.
- **Maron**: A warm brown-tinged dark theme, offering a softer feel for extended coding sessions.

## 🚀 Installation

Install Nightfall.nvim effortlessly using your preferred Neovim plugin manager.

[💤 lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "2giosangmitom/nightfall.nvim",
  lazy = false,
  priority = 1000,
  version = "*",
  opts = {},
}
```

For comprehensive documentation on the plugin, refer to `:h nightfall.nvim` within Neovim.

## 🖋️ Usage

To enhance your Neovim environment with the Nightfall colorscheme, execute the following Lua command:

```lua
vim.cmd.colorscheme("nightfall") -- Choose from variants like `deeper-night` or `maron`
```

Select from the available variants, such as `deeper-night` or `maron`, to tailor your coding experience to your liking. For comprehensive details and advanced usage options, consult `:h nightfall.nvim_usage` within Neovim.

## ⚙️ Configuration

Before loading the colorscheme, ensure your configuration aligns with your preferences. Review the setup below to adjust settings as needed. Detailed information can be found in the `:h nightfall.nvim_setup` command.

```lua
require("nightfall").setup({
  -- Path to where Nightfall will compile its color files
  compile_path = vim.fn.stdpath("cache") .. "/nightfall",
  -- Set to true to enable transparency
  transparent = false,
  -- Set to true to enable terminal colors
  terminal_colors = true,
  -- Set to true to dim inactive windows
  dim_inactive = false,
  -- Customize syntax highlighting styles
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
  -- Enable/disable default plugin integrations
  default_integrations = true,
  -- Specify plugin integrations and their configurations
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

Configure Nightfall's settings to match your coding environment and preferences before activating the colorscheme. Explore the provided Lua setup for customization options, adjusting features such as transparency, syntax styles, and plugin integrations according to your needs.

## 🪓 Overriding Colors & Highlight Groups

Enhance the customization of Nightfall even further by overriding colors and highlight groups to suit your preferences. Nightfall.nvim offers extensive options for tailoring the colorscheme precisely to your liking. You can achieve this by utilizing `color_overrides` and `highlight_overrides` in the configuration:

### 🎨 Overriding Colors

```lua
require("nightfall").setup({
  color_overrides = {
    all = {
      foreground = "#ffffff",
    },
    nightfall = {
      background = "#ff0000",
    },
  },
})
```

### 🌈 Overriding Highlight Groups

```lua
require("nightfall").setup({
  highlight_overrides = {
    all = {
      Normal = { bg = "#120809" },
    },
    ---@param colors NightfallPalette
    nightfall = function(colors)
      return {
        Normal = { bg = colors.black },
      }
    end,
  },
})
```

Customize your Nightfall colorscheme further by directly modifying colors and highlight groups to create a unique coding environment that aligns perfectly with your preferences.

## 🛠️ Integrations

Nightfall.nvim provides theme support for other plugins in the Neovim ecosystem and extended Neovim functionality through integrations.

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

## 🪼 Supported Plugins

Nightfall.nvim seamlessly integrates with a wide range of popular plugins to enhance your Neovim experience:

- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

## 🤝 Contributing

Join the Nightfall.nvim community and contribute to this ever-evolving colorscheme! Refer to the [CONTRIBUTING](./CONTRIBUTING.md) file for details.
