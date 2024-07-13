--- Enable `neo-tree.nvim` support by adding the following to your Nightfall
--- integrations config:
--- >lua
---   neo_tree = { enabled = true }
--- <
---@tag nightfall.nvim_neo_tree

local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  local Options = require("nightfall").Options
  local active_bg = Options.transparent and colors.none or colors.bg_float
  local inactive_bg = Options.transparent and colors.none or colors.background
  local utils = require("nightfall.utils")

  return {
    NeoTreeNormal = { fg = colors.foreground, bg = active_bg },
    NeoTreeNormalNC = { fg = colors.foreground, bg = active_bg },
    NeoTreeExpander = { fg = colors.dark_blue },
    NeoTreeIndentMarker = { fg = colors.dark_blue },
    NeoTreeRootName = {
      fg = utils.vary_color({ maron = colors.green, deepernight = colors.nord_blue }, colors.pink),
      style = { bold = true },
    },
    NeoTreeSymbolicLinkTarget = { fg = colors.pink },
    NeoTreeGitAdded = { fg = colors.added },
    NeoTreeGitConflict = { fg = colors.red },
    NeoTreeGitDeleted = { fg = colors.red },
    NeoTreeGitModified = { fg = colors.pale_yellow },
    NeoTreeGitUnstaged = { fg = colors.red },
    NeoTreeGitUntracked = { fg = colors.violet },
    NeoTreeGitStaged = { fg = colors.light_cyan },
    NeoTreeFloatBorder = { link = "FloatBorder" },
    NeoTreeFloatTitle = { link = "FloatTitle" },
    NeoTreeTitleBar = { fg = colors.black, bg = utils.vary_color({ deepernight = colors.nord_blue }, colors.pink) },
    NeoTreeFileNameOpened = { fg = colors.pink },
    NeoTreeDimText = { link = "Comment" },
    NeoTreeFilterTerm = { fg = colors.light_cyan, style = { bold = true } },
    NeoTreeTabActive = { bg = active_bg, fg = colors.lavender, style = { bold = true } },
    NeoTreeTabInactive = { bg = inactive_bg, fg = colors.deep_navy },
    NeoTreeTabSeparatorActive = { fg = active_bg, bg = active_bg },
    NeoTreeTabSeparatorInactive = { fg = inactive_bg, bg = inactive_bg },
    NeoTreeVertSplit = { fg = colors.background, bg = inactive_bg },
    NeoTreeWinSeparator = {
      fg = Options.transparent and colors.dark_navy or colors.dark_blue,
      bg = Options.transparent_background and colors.none or colors.background,
    },
    NeoTreeStatusLineNC = { fg = colors.black, bg = colors.black },
  }
end

return M
