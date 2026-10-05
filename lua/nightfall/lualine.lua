--- A lualine theme matching each flavor.
---
--- Set it by name with
--- `require("lualine").setup({ options = { theme = "nightfall" } })`,
--- or read it directly through |nightfall.lualine.get()|.
---@tag nightfall-lualine
---@toc_entry Lualine

local config = require("nightfall.config")
local color = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

--- Build the lualine theme for a flavor.
---@param flavor NightfallFlavor
---@return table A table of lualine mode sections.
function M.get(flavor)
  local o = config.get()
  local c = palette.resolve(flavor, o)
  local fg = palette.on_accent(c, flavor)
  local bg = color.background(c.bg_dim, o.transparent)
  local inactive_fg = o.dim_inactive and c.subtle or c.gray
  local modes = {
    normal = palette.accent(c, flavor),
    insert = (flavor == "deeper-night" or flavor == "winter") and c.teal or c.green,
    visual = flavor == "nightfall" and c.pink or flavor == "winter" and c.lavender or c.magenta,
    command = flavor == "winter" and c.purple or c.gold,
    terminal = c.cyan,
    replace = c.coral,
  }
  local theme = {
    inactive = {
      a = { fg = inactive_fg, bg = bg },
      b = { fg = inactive_fg, bg = bg },
      c = { fg = inactive_fg, bg = bg },
    },
  }

  for mode, accent in pairs(modes) do
    theme[mode] = {
      a = { fg = fg, bg = accent },
      b = { fg = accent, bg = c.surface },
    }
  end

  -- Only normal mode defines section `c`; lualine reuses it for every mode.
  theme.normal.c = { fg = c.silver, bg = bg }

  return theme
end

return M
