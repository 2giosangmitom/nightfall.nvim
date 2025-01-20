local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local utils = require("nightfall.utils.colors")
  local options = require("nightfall.config").get_options()

  return {
    TreesitterContext = {
      bg = options.transparent and "NONE"
        or utils.vary_color({ ["white-night"] = utils.darken(colors.latte, 0.9) }, utils.lighten(colors.navy, 0.9)),
    },
    TreesitterContextBottom = { sp = utils.darken(colors.silver, 0.5), underline = options.transparent },
    TreesitterContextLineNumber = { fg = utils.vary_color({ ["white-night"] = colors.magenta }, colors.cream) },
  }
end

return M
