# Nightfall.nvim

An eye-friendly Neovim colorscheme with broad highlight coverage and integrations for common plugins.

## ✨ Features

- 🎨 Four flavors: `nightfall`, `deeper-night`, `maron`, and `winter`.
- 🖼️ Neovim highlight groups through 0.12, including completion, message, and popup border groups.
- 🌲 Treesitter, LSP diagnostics, semantic tokens, inlay hints, code lenses, and virtual lines.
- 🧩 34 plugin integrations, each switchable from config.
- 🖌️ Palette and highlight overrides per flavor.
- 🪟 Optional transparent background, terminal colors, and inactive-window dimming.
- ⚡ Cached theme builds for fast startup.
- 🖥️ Matching extras for Alacritty, lazygit, yazi, and more.

## 🎨 Preview

<details open>
<summary>Show screenshots</summary>

### Nightfall

![Nightfall](https://i.imgur.com/X9QgIgQ.png)

### Deeper Night

![Deeper Night](https://i.imgur.com/Vk1LLmb.png)

### Maron

![Maron](https://i.imgur.com/BcEg3gJ.png)

### Winter

![Winter](https://i.imgur.com/wGqgYG0.png)

</details>

## 🚀 Installation

Install the plugin, run `setup()` if you want to change defaults, then choose a flavor with `:colorscheme`.

`setup()` must run before `:colorscheme` for its options to apply.

### lazy.nvim

```lua
{
  "2giosangmitom/nightfall.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require("nightfall").setup(opts)
    vim.cmd.colorscheme("nightfall") -- nightfall, deeper-night, maron, winter
  end,
}
```

### mini.deps

```lua
local add, now = MiniDeps.add, MiniDeps.now

add({ source = "2giosangmitom/nightfall.nvim" })

now(function()
  require("nightfall").setup({})
  vim.cmd.colorscheme("nightfall") -- nightfall, deeper-night, maron, winter
end)
```

### vim.pack (Neovim 0.12+)

```lua
vim.pack.add({
  "https://github.com/2giosangmitom/nightfall.nvim",
})

require("nightfall").setup({})
vim.cmd.colorscheme("nightfall") -- nightfall, deeper-night, maron, winter
```

## ⚙️ Configuration

Calling `setup()` is optional. These are the defaults:

```lua
require("nightfall").setup({
  transparent = false,         -- remove background colors
  terminal_colors = true,      -- set terminal_color_* globals
  dim_inactive = false,        -- dim inactive windows
  default_integrations = true, -- enable every integration by default
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

See `:h nightfall-config` for every option and default integration.

### Pick integrations

Every integration is enabled by default. Disable one by setting `enabled = false`:

```lua
require("nightfall").setup({
  integrations = {
    flash = { enabled = false },
    telescope = { enabled = true, style = "borderless" },
  },
})
```

Start from no integrations and opt in one by one:

```lua
require("nightfall").setup({
  default_integrations = false,
  integrations = {
    treesitter = { enabled = true, context = true },
    native_lsp = { enabled = true, semantic_tokens = true },
  },
})
```

### Override colors and highlights

`color_overrides` changes palette colors before highlights are generated. `highlight_overrides` changes highlight groups after generation.

Both support `all` for every flavor and flavor-specific keys. Flavor-specific values win over `all`.

```lua
require("nightfall").setup({
  color_overrides = {
    all = { fg = "#ffffff" },
    nightfall = { bg = "#0b0b14" },
  },
  highlight_overrides = {
    all = { Normal = { bg = "#120809" } },
    nightfall = function(colors)
      return { Comment = { fg = colors.teal, italic = false } }
    end,
  },
})
```

## 🎛️ lualine

Nightfall includes a matching lualine theme for each flavor:

```lua
require("lualine").setup({
  options = { theme = "nightfall" },
})
```

## 🖥️ Extras

Matching themes live in `extras/`:

| Tool                                                | File                                      |
| --------------------------------------------------- | ----------------------------------------- |
| [Alacritty](https://alacritty.org)                  | `extras/alacritty/<flavor>.toml`          |
| [lazygit](https://github.com/jesseduffield/lazygit) | `extras/lazygit/<flavor>.yaml`            |
| [yazi](https://yazi-rs.github.io)                   | `extras/yazi/<flavor>.toml`               |

## 🛠️ Development

This repo uses [just](https://github.com/casey/just):

```sh
just deps      # clone development dependencies
just test      # run tests
just fmt       # format Lua
just generate  # regenerate docs and extras
just ci        # run CI checks
```

`doc/nightfall.txt` and `extras/` are generated. Change the source files and run `just generate` instead of editing generated files by hand.

## 📜 License

[MIT](LICENSE)
