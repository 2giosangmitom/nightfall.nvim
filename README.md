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

### lazy.nvim

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

### mini.deps

```lua
local add, now = MiniDeps.add, MiniDeps.now

add({ source = "2giosangmitom/nightfall.nvim" })

now(function()
  require("nightfall").setup({})
  vim.cmd.colorscheme("nightfall")
end)
```

### vim.pack

Neovim 0.12+:

```lua
vim.pack.add({
  "https://github.com/2giosangmitom/nightfall.nvim",
})

require("nightfall").setup({})
vim.cmd.colorscheme("nightfall")
```

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

`color_overrides` modifies the palette before highlight groups are generated.

`highlight_overrides` modifies highlight groups after generation.

Both support an `all` entry and flavor-specific entries. Flavor-specific values take precedence.

```lua
require("nightfall").setup({
  color_overrides = {
    all = {
      fg = "#ffffff",
    },
    nightfall = {
      bg = "#0b0b14",
    },
  },

  highlight_overrides = {
    all = {
      Normal = {
        bg = "#120809",
      },
    },

    nightfall = function(colors)
      return {
        Comment = {
          fg = colors.teal,
          italic = false,
        },
      }
    end,
  },
})
```

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

## License

[MIT](LICENSE)
