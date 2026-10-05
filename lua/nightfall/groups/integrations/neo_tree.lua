--- https://github.com/nvim-neo-tree/neo-tree.nvim

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)
  local panel_bg = U.background(c.bg_dim, o.transparent)
  local editor_bg = U.background(c.bg, o.transparent)

  return {
    NeoTreeNormal = { fg = c.fg, bg = panel_bg },
    NeoTreeNormalNC = { fg = c.fg, bg = panel_bg },
    NeoTreeWinSeparator = { fg = c.border, bg = panel_bg },
    NeoTreeEndOfBuffer = { fg = c.bg_dim },
    NeoTreeFloatTitle = { link = "FloatTitle" },
    NeoTreeFloatBorder = { link = "FloatBorder" },
    NeoTreeTitleBar = { fg = palette.on_accent(c, flavor), bg = flavor == "maron" and c.peach or accent, bold = true },

    NeoTreeRootName = { fg = accent, bold = true },
    NeoTreeDirectoryName = { fg = c.fg },
    NeoTreeDirectoryIcon = { fg = accent },
    NeoTreeFileName = { fg = c.fg },
    NeoTreeFileIcon = { fg = c.silver },
    NeoTreeFileNameOpened = { fg = accent, bold = true },
    NeoTreeSymbolicLinkTarget = { fg = c.cyan, italic = true },
    NeoTreeIndentMarker = { fg = c.border },
    NeoTreeExpander = { fg = c.subtle },
    NeoTreeDimText = { fg = c.subtle },
    NeoTreeDotfile = { fg = c.gray },
    NeoTreeHiddenByName = { fg = c.gray },
    NeoTreeMessage = { fg = c.gray, italic = true },
    NeoTreeCursorLine = { bg = c.bg_alt },
    NeoTreeBufferNumber = { fg = c.subtle },
    NeoTreeModified = { fg = c.gold },

    NeoTreeGitAdded = { fg = c.green },
    NeoTreeGitConflict = { fg = c.orange, bold = true },
    NeoTreeGitDeleted = { fg = c.red },
    NeoTreeGitIgnored = { fg = c.subtle },
    NeoTreeGitModified = { fg = c.yellow },
    NeoTreeGitRenamed = { fg = c.sky },
    NeoTreeGitStaged = { fg = c.teal },
    NeoTreeGitUnstaged = { fg = c.coral },
    NeoTreeGitUntracked = { fg = c.lavender },

    NeoTreeFilterTerm = { fg = accent, bold = true },
    NeoTreeTabActive = { fg = accent, bg = panel_bg, bold = true },
    NeoTreeTabInactive = { fg = c.gray, bg = editor_bg },
    NeoTreeTabSeparatorActive = { fg = accent, bg = panel_bg },
    NeoTreeTabSeparatorInactive = { fg = c.bg, bg = editor_bg },
  }
end

return M
