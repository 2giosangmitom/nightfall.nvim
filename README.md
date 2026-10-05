# Nightfall.nvim

A Dracula-inspired colorscheme for Neovim.

## Preview

<details open>
<summary>Screenshots</summary>

### Nightfall

![Nightfall](https://i.imgur.com/X9QgIgQ.png)

### Deeper Night

![Deeper Night](https://i.imgur.com/Vk1LLmb.png)

### Maron

![Maron](https://i.imgur.com/BcEg3gJ.png)

### Winter

![Winter](https://i.imgur.com/wGqgYG0.png)

</details>

## Installation

`setup()` is optional unless you want to change the defaults. If used, call it before `:colorscheme`.

<details open>
<summary>lazy.nvim</summary>

```lua
{
  "2giosangmitom/nightfall.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require("nightfall").setup(opts)
    vim.cmd.colorscheme("nightfall")
  end,
}
```

</details>

<details>
<summary>mini.deps</summary>

```lua
local add, now = MiniDeps.add, MiniDeps.now

add({ source = "2giosangmitom/nightfall.nvim" })

now(function()
  require("nightfall").setup({})
  vim.cmd.colorscheme("nightfall")
end)
```

</details>

<details>
<summary>vim.pack (Neovim 0.12+)</summary>

```lua
vim.pack.add({
  "https://github.com/2giosangmitom/nightfall.nvim",
})

require("nightfall").setup({})
vim.cmd.colorscheme("nightfall")
```

</details>

## Configuration

Default options:

```lua
require("nightfall").setup({
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  default_integrations = true,

  styles = {
    comments = { italic = true },
    keywords = { italic = true },
  },

  integrations = {
    telescope = { enabled = true, style = "bordered" },
    treesitter = { enabled = true, context = true },
    flash = { enabled = true },
  },

  color_overrides = {},
  highlight_overrides = {},
})
```

See `:h nightfall-config` for the full list of options and integrations.

## Integrations

Integrations are enabled by default and can be configured individually.

```lua
require("nightfall").setup({
  integrations = {
    flash = { enabled = false },
    telescope = {
      enabled = true,
      style = "borderless",
    },
  },
})
```

To start with no integrations and enable only the ones you use:

```lua
require("nightfall").setup({
  default_integrations = false,

  integrations = {
    treesitter = {
      enabled = true,
      context = true,
    },
    native_lsp = {
      enabled = true,
      semantic_tokens = true,
    },
  },
})
```

## Overrides

```lua
require("nightfall").setup({
  -- Replace palette colors first.
  color_overrides = {
    all = { fg = "#ffffff" }, -- every flavor
    nightfall = { bg = "#0b0b14" }, -- one flavor only
  },
  highlight_overrides = {
    all = { Normal = { bg = "#120809" } }, -- static table
    -- Function receives palette; wins over `all`.
    nightfall = function(colors)
      return { Comment = { fg = colors.teal, italic = false } }
    end,
  },
})
```

See `:h nightfall-config` for details.

## lualine

Nightfall ships matching lualine themes.

```lua
require("lualine").setup({
  options = {
    theme = "nightfall",
  },
})
```

## Extras

Matching themes for other tools are available under `extras/`.

| Tool                                                | File                             |
| --------------------------------------------------- | -------------------------------- |
| [Alacritty](https://alacritty.org)                  | `extras/alacritty/<flavor>.toml` |
| [lazygit](https://github.com/jesseduffield/lazygit) | `extras/lazygit/<flavor>.yaml`   |
| [yazi](https://yazi-rs.github.io)                   | `extras/yazi/<flavor>.toml`      |

## Contributing

Issues and pull requests are welcome.

Thanks to all the amazing [contributors](https://github.com/2giosangmitom/nightfall.nvim/graphs/contributors) 💛

[![Contributors](https://contrib.rocks/image?repo=2giosangmitom/nightfall.nvim)](https://github.com/2giosangmitom/nightfall.nvim/graphs/contributors)
