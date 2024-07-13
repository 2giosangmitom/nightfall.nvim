--- To enable `mini.nvim` support, add the following to your Nightfall
--- integrations config:
--- >lua
---   mini = {
---     enabled = true,
---     icons = true, -- Enable `mini.icons`
---   },
--- <
---@tag nightfall.nvim_mini
local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  local result = {}
  local integrations = require("nightfall").Options.integrations
  local mini = integrations.mini or {}
  local mini_icons = mini.icons or false

  if mini_icons then
    result = vim.tbl_deep_extend("keep", result, {
      MiniIconsAzure = { fg = colors.light_cyan },
      MiniIconsBlue = { fg = colors.nord_blue },
      MiniIconsCyan = { fg = colors.light_cyan },
      MiniIconsGreen = { fg = colors.green },
      MiniIconsGrey = { fg = colors.light_grey },
      MiniIconsOrange = { fg = colors.peach },
      MiniIconsPurple = { fg = colors.violet },
      MiniIconsRed = { fg = colors.red },
      MiniIconsYellow = { fg = colors.pale_yellow },
    })
  end

  return result
end

return M
