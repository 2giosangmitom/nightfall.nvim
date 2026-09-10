--- https://github.com/NeogitOrg/neogit

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, accent = ctx.c, ctx.accent

  return {
    NeogitBranch = { fg = c.magenta, bold = true },
    NeogitRemote = { fg = c.green, bold = true },
    NeogitObjectId = { fg = c.gray },
    NeogitStash = { fg = c.gold },
    NeogitFold = { fg = c.border },
    NeogitFilePath = { fg = c.sky, italic = true },
    NeogitSectionHeader = { fg = accent, bold = true },
    NeogitCommitViewHeader = { fg = c.black, bg = c.teal, bold = true },
    NeogitCursorLine = { bg = c.bg_alt },

    NeogitHunkHeader = { fg = c.silver, bg = c.surface },
    NeogitHunkHeaderHighlight = { fg = accent, bg = c.overlay, bold = true },
    NeogitDiffContext = { bg = ctx.solid(c.bg) },
    NeogitDiffContextHighlight = { bg = c.bg_alt },
    NeogitDiffAdd = { fg = c.green, bg = ctx.blend(c.green, c.bg, 0.1) },
    NeogitDiffAddHighlight = { fg = c.green, bg = ctx.blend(c.green, c.bg, 0.2) },
    NeogitDiffDelete = { fg = c.red, bg = ctx.blend(c.red, c.bg, 0.1) },
    NeogitDiffDeleteHighlight = { fg = c.red, bg = ctx.blend(c.red, c.bg, 0.2) },

    NeogitChangeAdded = { fg = c.green, bold = true },
    NeogitChangeModified = { fg = c.yellow, bold = true },
    NeogitChangeDeleted = { fg = c.red, bold = true },
    NeogitChangeRenamed = { fg = c.sky, bold = true },
    NeogitChangeUpdated = { fg = c.orange, bold = true },
    NeogitChangeCopied = { fg = c.lavender, bold = true },
    NeogitChangeBothModified = { fg = c.coral, bold = true },
    NeogitChangeNewFile = { fg = c.teal, bold = true },

    NeogitNotificationInfo = { fg = c.sky },
    NeogitNotificationWarning = { fg = c.yellow },
    NeogitNotificationError = { fg = c.red },

    NeogitPopupSectionTitle = { fg = accent, bold = true },
    NeogitPopupBranchName = { fg = c.magenta },
    NeogitPopupBold = { bold = true },
    NeogitPopupSwitchKey = { fg = c.gold },
    NeogitPopupSwitchEnabled = { fg = c.green },
    NeogitPopupSwitchDisabled = { fg = c.subtle },
    NeogitPopupOptionKey = { fg = c.gold },
    NeogitPopupOptionEnabled = { fg = c.green },
    NeogitPopupOptionDisabled = { fg = c.subtle },
    NeogitPopupConfigKey = { fg = c.gold },
    NeogitPopupConfigEnabled = { fg = c.green },
    NeogitPopupConfigDisabled = { fg = c.subtle },
    NeogitPopupActionKey = { fg = c.gold },
    NeogitPopupActionDisabled = { fg = c.subtle },
  }
end

return M
