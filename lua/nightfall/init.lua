--- A clean, eye-friendly Neovim colorscheme.
---
--- MIT License Copyright (c) 2024 Vo Quang Chien
---
--- Nightfall ships three dark flavors and one light flavor that share one palette vocabulary, so every
--- flavor covers the same highlight groups and the same plugin integrations.
---
--- Flavors ~
---
--- - `nightfall`: dark and vibrant, a violet-leaning take on Dracula.
--- - `deeper-night`: pastels on a blue-black night, for focus.
--- - `maron`: beige and dusty earth tones on a near-black background.
--- - `winter`: a cold, frosted light theme with navy text and blue accents.
---
--- Beyond Neovim ~
---
--- The `extras/` directory of this repository carries matching themes for
--- Alacritty, lazygit and yazi, one file per flavor, generated from the same
--- palettes.
---@tag nightfall.nvim
---@toc_entry Introduction

--- Table of contents
---@toc

local cache = require("nightfall.cache")
local config = require("nightfall.config")
local palette = require("nightfall.palette")

local M = {}

--- Names of every flavor, in the order they appear in the documentation.
---@type NightfallFlavor[]
M.flavors = palette.flavors

--- Apply user options.
---
--- Call this before `:colorscheme`. It is optional: without it every option
--- keeps the default shown in |NightfallOptions|.
---@param opts? NightfallOptions Options to apply.
function M.setup(opts) config.setup(opts) end

--- Apply a flavor to the current session.
---
--- This is what `colors/<flavor>.lua` calls, so `:colorscheme nightfall` and
--- `require("nightfall").load("nightfall")` do the same thing.
---@param flavor? NightfallFlavor Which flavor to apply. Defaults to `"nightfall"`.
function M.load(flavor)
  flavor = flavor or "nightfall"

  local opts = config.get()
  local theme = cache.get(flavor, opts)

  if vim.g.colors_name then vim.cmd("highlight clear") end
  vim.g.colors_name = flavor
  vim.o.background = flavor == "winter" and "light" or "dark"

  for group, spec in pairs(theme.highlights) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  for name, color in pairs(theme.terminal) do
    vim.g[name] = color
  end
end

return M
