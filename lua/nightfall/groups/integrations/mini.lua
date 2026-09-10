--- https://github.com/nvim-mini/mini.nvim
---
--- Most of the family only needs plain colors, so those are always contributed.
--- The three modules that change how text itself looks, rather than how a
--- plugin window looks, keep their own switch under `integrations.mini`.

local M = {}

---@param ctx NightfallCtx
---@param opts table Integration options: `icons`, `trailspace`, `indentscope`.
---@return table<string,table>
function M.get(ctx, opts)
  local c, accent = ctx.c, ctx.accent
  local float_bg = ctx.solid(c.bg_dim)

  local result = {
    -- mini.animate
    MiniAnimateCursor = { reverse = true, nocombine = true },
    MiniAnimateNormalFloat = { link = "NormalFloat" },

    -- mini.clue
    MiniClueBorder = { link = "FloatBorder" },
    MiniClueDescGroup = { fg = c.cyan },
    MiniClueDescSingle = { fg = c.fg },
    MiniClueNextKey = { fg = accent, bold = true },
    MiniClueNextKeyWithPostkeys = { fg = c.gold, bold = true },
    MiniClueSeparator = { fg = c.border },
    MiniClueTitle = { link = "FloatTitle" },

    -- mini.completion
    MiniCompletionActiveParameter = { fg = accent, bold = true },
    MiniCompletionInfoBorderOutdated = { fg = c.gray },

    -- mini.cursorword
    MiniCursorword = { bg = c.overlay },
    MiniCursorwordCurrent = { bg = c.overlay },

    -- mini.deps
    MiniDepsChangeAdded = { fg = c.green },
    MiniDepsChangeRemoved = { fg = c.red },
    MiniDepsHint = { fg = c.cyan },
    MiniDepsInfo = { fg = c.sky },
    MiniDepsMsgBreaking = { fg = c.orange, bold = true },
    MiniDepsPlaceholder = { fg = c.subtle },
    MiniDepsTitle = { fg = accent, bold = true },
    MiniDepsTitleError = { fg = c.black, bg = c.red, bold = true },
    MiniDepsTitleSame = { fg = c.black, bg = c.teal, bold = true },
    MiniDepsTitleUpdate = { fg = c.black, bg = c.green, bold = true },

    -- mini.diff
    MiniDiffSignAdd = { fg = c.green },
    MiniDiffSignChange = { fg = c.yellow },
    MiniDiffSignDelete = { fg = c.red },
    MiniDiffOverAdd = { bg = ctx.blend(c.green, c.bg, 0.16) },
    MiniDiffOverChange = { bg = ctx.blend(c.yellow, c.bg, 0.16) },
    MiniDiffOverChangeBuf = { bg = ctx.blend(c.yellow, c.bg, 0.3) },
    MiniDiffOverContext = { bg = c.bg_alt },
    MiniDiffOverContextBuf = { bg = c.surface },
    MiniDiffOverDelete = { bg = ctx.blend(c.red, c.bg, 0.16) },

    -- mini.files
    MiniFilesBorder = { link = "FloatBorder" },
    MiniFilesBorderModified = { fg = c.gold, bg = float_bg },
    MiniFilesCursorLine = { bg = c.overlay },
    MiniFilesDirectory = { link = "Directory" },
    MiniFilesFile = { fg = c.fg },
    MiniFilesNormal = { link = "NormalFloat" },
    MiniFilesTitle = { link = "FloatTitle" },
    MiniFilesTitleFocused = { fg = accent, bg = float_bg, bold = true },

    -- mini.hipatterns
    MiniHipatternsFixme = { fg = c.black, bg = c.red, bold = true },
    MiniHipatternsHack = { fg = c.black, bg = c.yellow, bold = true },
    MiniHipatternsNote = { fg = c.black, bg = c.teal, bold = true },
    MiniHipatternsTodo = { fg = c.black, bg = c.sky, bold = true },

    -- mini.jump and mini.jump2d
    MiniJump = { fg = c.black, bg = c.gold, bold = true },
    MiniJump2dDim = { fg = c.subtle },
    MiniJump2dSpot = { fg = c.pink, bold = true, nocombine = true },
    MiniJump2dSpotAhead = { fg = c.cyan, bg = float_bg, nocombine = true },
    MiniJump2dSpotUnique = { fg = c.gold, bold = true, nocombine = true },

    -- mini.map
    MiniMapNormal = { link = "NormalFloat" },
    MiniMapSymbolCount = { fg = c.gray },
    MiniMapSymbolLine = { fg = accent },
    MiniMapSymbolView = { fg = c.border },

    -- mini.notify
    MiniNotifyBorder = { link = "FloatBorder" },
    MiniNotifyNormal = { link = "NormalFloat" },
    MiniNotifyTitle = { link = "FloatTitle" },

    -- mini.operators
    MiniOperatorsExchangeFrom = { link = "IncSearch" },

    -- mini.pick
    MiniPickBorder = { link = "FloatBorder" },
    MiniPickBorderBusy = { fg = c.gold, bg = float_bg },
    MiniPickBorderText = { fg = accent, bg = float_bg },
    MiniPickHeader = { fg = c.cyan },
    MiniPickIconDirectory = { link = "Directory" },
    MiniPickIconFile = { fg = c.silver },
    MiniPickMatchCurrent = { bg = c.overlay },
    MiniPickMatchMarked = { fg = c.teal, bg = c.bg_alt },
    MiniPickMatchRanges = { fg = accent, bold = true },
    MiniPickNormal = { link = "NormalFloat" },
    MiniPickPreviewLine = { bg = c.overlay },
    MiniPickPreviewRegion = { link = "IncSearch" },
    MiniPickPrompt = { fg = accent, bg = float_bg, bold = true },

    -- mini.starter
    MiniStarterCurrent = { bold = true, nocombine = true },
    MiniStarterFooter = { fg = c.gray, italic = true },
    MiniStarterHeader = { fg = accent, bold = true },
    MiniStarterInactive = { link = "Comment" },
    MiniStarterItem = { fg = c.fg },
    MiniStarterItemBullet = { fg = c.border },
    MiniStarterItemPrefix = { fg = c.gold },
    MiniStarterQuery = { fg = c.cyan, bold = true },
    MiniStarterSection = { fg = accent },

    -- mini.statusline
    MiniStatuslineDevinfo = { fg = c.silver, bg = c.surface },
    MiniStatuslineFileinfo = { fg = c.silver, bg = c.surface },
    MiniStatuslineFilename = { fg = c.gray, bg = c.bg_alt },
    MiniStatuslineInactive = { fg = c.subtle, bg = ctx.solid(c.bg_dim) },
    MiniStatuslineModeCommand = { fg = c.black, bg = c.gold, bold = true },
    MiniStatuslineModeInsert = { fg = c.black, bg = c.green, bold = true },
    MiniStatuslineModeNormal = { fg = c.black, bg = accent, bold = true },
    MiniStatuslineModeOther = { fg = c.black, bg = c.teal, bold = true },
    MiniStatuslineModeReplace = { fg = c.black, bg = c.coral, bold = true },
    MiniStatuslineModeVisual = { fg = c.black, bg = c.pink, bold = true },

    -- mini.surround
    MiniSurround = { link = "IncSearch" },

    -- mini.tabline
    MiniTablineCurrent = { fg = accent, bg = ctx.solid(c.bg), bold = true },
    MiniTablineFill = { bg = ctx.solid(c.bg_dim) },
    MiniTablineHidden = { fg = c.subtle, bg = ctx.solid(c.bg_dim) },
    MiniTablineModifiedCurrent = { fg = c.gold, bg = ctx.solid(c.bg), bold = true },
    MiniTablineModifiedHidden = { fg = ctx.darken(c.gold, 0.6, c.bg), bg = ctx.solid(c.bg_dim) },
    MiniTablineModifiedVisible = { fg = c.gold, bg = ctx.solid(c.bg_dim) },
    MiniTablineTabpagesection = { fg = c.black, bg = accent, bold = true },
    MiniTablineVisible = { fg = c.silver, bg = ctx.solid(c.bg_dim) },

    -- mini.test
    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = c.red, bold = true },
    MiniTestPass = { fg = c.green, bold = true },
  }

  if opts.icons then
    result = vim.tbl_extend("error", result, {
      MiniIconsAzure = { fg = c.sky },
      MiniIconsBlue = { fg = c.blue },
      MiniIconsCyan = { fg = c.cyan },
      MiniIconsGreen = { fg = c.green },
      MiniIconsGrey = { fg = c.silver },
      MiniIconsOrange = { fg = c.orange },
      MiniIconsPurple = { fg = c.purple },
      MiniIconsRed = { fg = c.coral },
      MiniIconsYellow = { fg = c.yellow },
    })
  end

  if opts.trailspace then
    result = vim.tbl_extend("error", result, { MiniTrailspace = { bg = ctx.blend(c.red, c.bg, 0.5) } })
  end

  if opts.indentscope then
    result = vim.tbl_extend("error", result, {
      MiniIndentscopePrefix = { nocombine = true },
      MiniIndentscopeSymbol = { fg = accent },
      MiniIndentscopeSymbolOff = { fg = c.border },
    })
  end

  return result
end

return M
