--- Enable `trouble.nvim` support by adding the following to your Nightfall
--- integration config:
--- >lua
---   trouble = { enabled = true }
--- <
---@tag nightfall.nvim_trouble

local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  return {
    TroubleCount = { fg = colors.pink },
    TroubleDirectory = { fg = colors.violet },
    TroubleIconDirectory = { fg = colors.violet },
  }
end

return M
