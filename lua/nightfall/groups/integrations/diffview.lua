--- https://github.com/sindrets/diffview.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, accent = ctx.c, ctx.accent

  return {
    DiffviewNormal = { fg = c.fg, bg = ctx.solid(c.bg_dim) },
    DiffviewCursorLine = { bg = c.overlay },
    DiffviewWinSeparator = { fg = c.border, bg = ctx.solid(c.bg_dim) },
    DiffviewNonText = { fg = c.subtle },
    DiffviewDim1 = { fg = c.subtle },
    DiffviewReference = { fg = c.magenta, bold = true },
    DiffviewHash = { fg = c.gray },
    DiffviewPrimary = { fg = accent },
    DiffviewSecondary = { fg = c.teal },

    DiffviewFolderName = { fg = accent },
    DiffviewFolderSign = { fg = c.border },
    DiffviewFilePanelTitle = { fg = accent, bold = true },
    DiffviewFilePanelCounter = { fg = c.gold, bold = true },
    DiffviewFilePanelFileName = { fg = c.fg },
    DiffviewFilePanelPath = { fg = c.gray },
    DiffviewFilePanelRootPath = { fg = c.gray, bold = true },
    DiffviewFilePanelSelected = { fg = accent, bold = true },
    DiffviewFilePanelInsertions = { fg = c.green },
    DiffviewFilePanelDeletions = { fg = c.red },
    DiffviewFilePanelConflicts = { fg = c.orange },

    DiffviewStatusAdded = { fg = c.green },
    DiffviewStatusModified = { fg = c.yellow },
    DiffviewStatusRenamed = { fg = c.sky },
    DiffviewStatusCopied = { fg = c.lavender },
    DiffviewStatusDeleted = { fg = c.red },
    DiffviewStatusUntracked = { fg = c.teal },
    DiffviewStatusIgnored = { fg = c.subtle },
    DiffviewStatusUnmerged = { fg = c.orange },
    DiffviewStatusUnknown = { fg = c.subtle },
    DiffviewStatusBroken = { fg = c.red, bold = true },
    DiffviewStatusTypeChanged = { fg = c.magenta },
  }
end

return M
