local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local utils = require("nightfall.utils.colors")
  return {
    SnacksDashboardDesc = { fg = colors.fg },
    SnacksDashboardHeader = {
      fg = utils.vary_color({ maron = colors.peach, ["deeper-night"] = colors.blue }, colors.lavender),
    },
    SnacksDashboardKey = {
      fg = utils.vary_color(
        { ["deeper-night"] = colors.pink, maron = colors.cyan, nord = colors.green },
        colors.yellow
      ),
    },
    SnacksDashboardSpecial = { fg = colors.gold },
  }
end

return M
