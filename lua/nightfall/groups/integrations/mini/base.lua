--- Always-enabled mini.nvim highlights, grouped by module below.

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)
  local on_accent = palette.on_accent(c, flavor)
  local float_bg = U.background(c.bg_dim, o.transparent)
  local editor_bg = U.background(c.bg, o.transparent)

  return {
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
    MiniDepsTitleError = { fg = on_accent, bg = c.red, bold = true },
    MiniDepsTitleSame = { fg = on_accent, bg = c.teal, bold = true },
    MiniDepsTitleUpdate = { fg = on_accent, bg = c.green, bold = true },

    -- mini.diff
    MiniDiffSignAdd = { fg = c.green },
    MiniDiffSignChange = { fg = c.yellow },
    MiniDiffSignDelete = { fg = c.red },
    MiniDiffOverAdd = { bg = U.blend(c.green, c.bg, 0.16) },
    MiniDiffOverChange = { bg = U.blend(c.yellow, c.bg, 0.16) },
    MiniDiffOverChangeBuf = { bg = U.blend(c.yellow, c.bg, 0.3) },
    MiniDiffOverContext = { bg = c.bg_alt },
    MiniDiffOverContextBuf = { bg = c.surface },
    MiniDiffOverDelete = { bg = U.blend(c.red, c.bg, 0.16) },

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
    MiniHipatternsFixme = { fg = on_accent, bg = c.red, bold = true },
    MiniHipatternsHack = { fg = on_accent, bg = c.yellow, bold = true },
    MiniHipatternsNote = { fg = on_accent, bg = c.teal, bold = true },
    MiniHipatternsTodo = { fg = on_accent, bg = c.sky, bold = true },

    -- mini.jump and mini.jump2d
    MiniJump = { fg = on_accent, bg = c.gold, bold = true },
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
    MiniStatuslineInactive = { fg = c.subtle, bg = float_bg },
    MiniStatuslineModeCommand = { fg = on_accent, bg = c.gold, bold = true },
    MiniStatuslineModeInsert = { fg = on_accent, bg = c.green, bold = true },
    MiniStatuslineModeNormal = { fg = on_accent, bg = accent, bold = true },
    MiniStatuslineModeOther = { fg = on_accent, bg = c.teal, bold = true },
    MiniStatuslineModeReplace = { fg = on_accent, bg = c.coral, bold = true },
    MiniStatuslineModeVisual = { fg = on_accent, bg = c.pink, bold = true },

    -- mini.surround
    MiniSurround = { link = "IncSearch" },

    -- mini.tabline
    MiniTablineCurrent = { fg = accent, bg = editor_bg, bold = true },
    MiniTablineFill = { bg = float_bg },
    MiniTablineHidden = { fg = c.subtle, bg = float_bg },
    MiniTablineModifiedCurrent = { fg = c.gold, bg = editor_bg, bold = true },
    MiniTablineModifiedHidden = { fg = U.darken(c.gold, 0.6, c.bg), bg = float_bg },
    MiniTablineModifiedVisible = { fg = c.gold, bg = float_bg },
    MiniTablineTabpagesection = { fg = on_accent, bg = accent, bold = true },
    MiniTablineVisible = { fg = c.silver, bg = float_bg },

    -- mini.test
    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = c.red, bold = true },
    MiniTestPass = { fg = c.green, bold = true },
  }
end

return M
