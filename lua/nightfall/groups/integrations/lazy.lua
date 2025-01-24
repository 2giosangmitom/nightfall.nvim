local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local utils = require("nightfall.utils.colors")
  return {
    LazyCommit = { fg = colors.white },
    LazyCommitType = { fg = colors.yellow },
    LazyDir = { fg = colors.peach },
    LazyH1 = {
      fg = colors.black,
      bg = utils.vary_color({ nightfall = colors.purple, maron = colors.yellow }, colors.lavender),
    },
    LazyH2 = { fg = colors.fg, bold = true },
    LazyInfo = { fg = colors.cyan, bg = utils.darken(colors.cyan, 1, colors.cyan) },
    LazyUrl = { fg = colors.sky, undercurl = true },
    LazyReasonCmd = { fg = colors.cream },
    LazyReasonEvent = { fg = colors.yellow },
    LazyReasonFt = { fg = colors.green },
    LazyReasonImport = { fg = utils.vary_color({ maron = colors.sky }, colors.blue) },
    LazyReasonStart = { fg = colors.pink },
    LazySpecial = { fg = colors.lavender },
    LazyLocal = { fg = utils.vary_color({ maron = colors.red }, colors.pink) },
    LazyReasonKeys = { fg = utils.vary_color({ maron = colors.sky }, colors.blue) },
  }
end

return M
