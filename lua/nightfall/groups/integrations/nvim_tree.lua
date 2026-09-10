--- https://github.com/nvim-tree/nvim-tree.lua

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, accent = ctx.c, ctx.accent
  local panel_bg = ctx.solid(c.bg_dim)

  return {
    NvimTreeNormal = { fg = c.fg, bg = panel_bg },
    NvimTreeNormalNC = { fg = c.fg, bg = panel_bg },
    NvimTreeNormalFloat = { link = "NormalFloat" },
    NvimTreeWinSeparator = { fg = c.border, bg = panel_bg },
    NvimTreeEndOfBuffer = { fg = c.bg_dim },
    NvimTreeCursorLine = { bg = c.overlay },
    NvimTreeStatusLine = { link = "StatusLine" },
    NvimTreeStatusLineNC = { link = "StatusLineNC" },

    NvimTreeRootFolder = { fg = accent, bold = true },
    NvimTreeFolderName = { fg = c.fg },
    NvimTreeOpenedFolderName = { fg = accent, bold = true },
    NvimTreeEmptyFolderName = { fg = c.gray },
    NvimTreeFolderIcon = { fg = accent },
    NvimTreeFileIcon = { fg = c.silver },
    NvimTreeSymlink = { fg = c.cyan, italic = true },
    NvimTreeSymlinkFolderName = { fg = c.cyan, italic = true },
    NvimTreeSpecialFile = { fg = c.gold, underline = true },
    NvimTreeExecFile = { fg = c.green, bold = true },
    NvimTreeImageFile = { fg = c.magenta },
    NvimTreeOpenedFile = { fg = accent, bold = true },
    NvimTreeModifiedFile = { fg = c.gold },
    NvimTreeIndentMarker = { fg = c.border },
    NvimTreeBookmark = { fg = c.gold },
    NvimTreeWindowPicker = { fg = c.black, bg = accent, bold = true },
    NvimTreeLiveFilterPrefix = { fg = accent, bold = true },
    NvimTreeLiveFilterValue = { fg = c.fg, bold = true },

    NvimTreeGitNew = { fg = c.green },
    NvimTreeGitDirty = { fg = c.yellow },
    NvimTreeGitStaged = { fg = c.teal },
    NvimTreeGitMerge = { fg = c.orange, bold = true },
    NvimTreeGitRenamed = { fg = c.sky },
    NvimTreeGitDeleted = { fg = c.red },
    NvimTreeGitIgnored = { fg = c.subtle },

    NvimTreeDiagnosticErrorIcon = { link = "DiagnosticError" },
    NvimTreeDiagnosticWarnIcon = { link = "DiagnosticWarn" },
    NvimTreeDiagnosticInfoIcon = { link = "DiagnosticInfo" },
    NvimTreeDiagnosticHintIcon = { link = "DiagnosticHint" },
  }
end

return M
