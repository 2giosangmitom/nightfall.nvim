--- Enable `which_key.nvim` support by adding the following to your Nightfall
--- integrations config:
--- >lua
---   which_key = { enabled = true }
--- <
---@tag nightfall.nvim_which_key
local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  local utils = require("nightfall.utils")
  return {
    WhichKey = { fg = utils.vary_color({ nightfall = colors.pink, maron = colors.pale_yellow }, colors.nord_blue) },
    WhichKeyGroup = { fg = colors.lavender },
    WhichKeyDesc = { fg = colors.foreground },
    WhichKeySeparator = { fg = colors.light_grey },
    WhichKeyNormal = { bg = colors.background },
    WhichKeyValue = { fg = colors.light_cyan },
  }
end

return M
