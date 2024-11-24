--- Enable `indent-blankline.nvim` support by adding the following to your Nightfall
--- integrations config:
--- >lua
---   indent_blankline = { enabled = true }
--- <
--- If you want to enable rainbow indent colors, please follow this instruction
--- Firstly, update your `indent-blankline.nvim` config
--- >lua
---   require("ibl").setup({
---     indent = {
---       highlight = {
---         "RainbowRed",
---         "RainbowYellow",
---         "RainbowBlue",
---         "RainbowOrange",
---         "RainbowGreen",
---         "RainbowViolet",
---         "RainbowCyan",
---       }
---     }
---   })
--- <
--- Then add `rainbow = true` to `indent_blankline` Nightfall integrations config:
--- >lua
---   indent_blankline = { enabled = true, rainbow = true }
--- <
---@tag nightfall.nvim_indent_blankline
local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  local utils = require("nightfall.utils")
  local Options = require("nightfall").Options
  local result = {
    IblIndent = { fg = colors.dark_slate_blue, nocombine = true },
    IblScope = { fg = utils.darken(colors.lavender, 0.6), nocombine = true },
  }

  local indent_blankline = Options.integrations.indent_blankline or {}
  local rainbow = indent_blankline.rainbow or false

  if rainbow then
    result["RainbowRed"] = { fg = utils.darken(colors.red, 0.7) }
    result["RainbowYellow"] = { fg = utils.darken(colors.sand, 0.7) }
    result["RainbowBlue"] = { fg = utils.darken(colors.nord_blue, 0.7) }
    result["RainbowOrange"] = { fg = utils.darken(colors.peach, 0.7) }
    result["RainbowGreen"] = { fg = utils.darken(colors.green, 0.7) }
    result["RainbowViolet"] = { fg = utils.darken(colors.violet, 0.7) }
    result["RainbowCyan"] = { fg = utils.darken(colors.light_cyan, 0.7) }
  end

  return result
end

return M
