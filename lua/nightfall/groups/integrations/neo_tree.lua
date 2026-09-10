--- https://github.com/nvim-neo-tree/neo-tree.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, accent = ctx.c, ctx.accent

  return {
    NeoTreeNormal = { fg = c.fg, bg = ctx.solid(c.bg_dim) },
    NeoTreeNormalNC = { fg = c.fg, bg = ctx.solid(c.bg_dim) },
    NeoTreeWinSeparator = { fg = c.border, bg = ctx.solid(c.bg_dim) },
    NeoTreeEndOfBuffer = { fg = c.bg_dim },
    NeoTreeFloatTitle = { link = "FloatTitle" },
    NeoTreeFloatBorder = { link = "FloatBorder" },
    NeoTreeTitleBar = { fg = c.black, bg = ctx.vary({ maron = c.peach }, accent), bold = true },

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
    NeoTreeTabActive = { fg = accent, bg = ctx.solid(c.bg_dim), bold = true },
    NeoTreeTabInactive = { fg = c.gray, bg = ctx.solid(c.bg) },
    NeoTreeTabSeparatorActive = { fg = accent, bg = ctx.solid(c.bg_dim) },
    NeoTreeTabSeparatorInactive = { fg = c.bg, bg = ctx.solid(c.bg) },
  }
end

return M
