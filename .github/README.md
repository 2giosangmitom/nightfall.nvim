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

- **Improved code readability** with a clean and minimalist design
- **Multiple themes** to match your coding style
- **Reduced eye strain** for extended coding sessions
- **Extensive customization options** to personalize your experience
- **Seamless integration** with major plugins

## 🦊 Prerequisites

Before installing Nightfall.nvim, ensure you have the following:

- **Neovim 0.9 or later**: Required for semantic tokens support.
- **A Neovim plugin manager**: Such as [lazy.nvim](https://github.com/folke/lazy.nvim).

## 🎨 Flavors

Nightfall.nvim offers multiple themes to suit your coding style:

- **Nightfall**: Dark and vibrant, inspired by Dracula.
- **Deeper Night**: Intense dark theme for high contrast.
- **Maron**: Warm brown-tinged dark theme for a softer feel.

## 🚀 Installation

Install Nightfall.nvim using your preferred Neovim plugin manager.

### With [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "2giosangmitom/nightfall.nvim",
  lazy = false,
  priority = 1000,
  version = "*",
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

### 🪼 Supported Plugins

- **[lazy.nvim](https://github.com/folke/lazy.nvim)**: 💤 A modern plugin manager for Neovim.

  ```lua
  lazy = { enabled = true }
  ```

- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Experience powerful syntax highlighting and editing capabilities.

  ```lua
  treesitter = { enabled = true }
  ```

- **[nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)**: Display code context seamlessly.

  ```lua
  treesitter = { enabled = true, context = true }
  ```

- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: Integrate seamlessly with Language Server Protocol (LSP) for intelligent code completion and more.

  ```lua
  lspconfig = { enabled = true }
  ```

- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: Effortlessly find and navigate your code with Telescope.

  ```lua
  telescope = { enabled = true, style = "borderless" } -- or style = "bordered"
  ```

- **[vim-illuminate](https://github.com/RRethy/vim-illuminate)**: Automatically highlight other uses of the word under the cursor using LSP, Tree-sitter, or regex matching.

  ```lua
  illuminate = { enabled = true }
  ```

- **[flash.nvim](https://github.com/folke/flash.nvim)**: Navigate your code with search labels, enhanced character motions, and Treesitter integration.

  ```lua
  flash = { enabled = true }
  ```

- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: Configure a blazing-fast statusline plugin in pure Lua.
  ```lua
  require('lualine').setup {
    options = {
      theme = "nightfall"
      -- ... additional configurations
    }
  }
  ```

## 🤝 Contributing

Join the Nightfall.nvim community! Refer to the [CONTRIBUTING](./CONTRIBUTING.md) file for details.
