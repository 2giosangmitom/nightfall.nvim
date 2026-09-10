--- https://github.com/folke/snacks.nvim
---
--- Snacks bundles many pickers and widgets. The three that draw over the buffer
--- keep their own switch under `integrations.snacks`; the windows and notifiers
--- are always contributed.

local M = {}

---@param ctx NightfallCtx
---@param opts table Integration options: `dashboard`, `indent`, `picker`.
---@return table<string,table>
function M.get(ctx, opts)
  local c, accent = ctx.c, ctx.accent
  local float_bg = ctx.solid(c.bg_dim)

  --- A notification level, drawn as a tinted border and title.
  ---@param level string
  ---@param fg string
  ---@return table<string,table>
  local function notifier(level, fg)
    return {
      ["SnacksNotifier" .. level] = { fg = c.fg, bg = float_bg },
      ["SnacksNotifierBorder" .. level] = { fg = fg, bg = float_bg },
      ["SnacksNotifierIcon" .. level] = { fg = fg },
      ["SnacksNotifierTitle" .. level] = { fg = fg, bold = true },
      ["SnacksNotifierFooter" .. level] = { fg = c.gray },
    }
  end

  local result = {
    -- Windows
    SnacksNormal = { link = "NormalFloat" },
    SnacksNormalNC = { link = "NormalFloat" },
    SnacksWinBar = { fg = accent, bg = float_bg, bold = true },
    SnacksWinBarNC = { fg = c.gray, bg = float_bg },
    SnacksBackdrop = { bg = c.black },

    -- Input
    SnacksInputNormal = { link = "NormalFloat" },
    SnacksInputBorder = { link = "FloatBorder" },
    SnacksInputTitle = { link = "FloatTitle" },
    SnacksInputIcon = { fg = accent },
    SnacksInputPrompt = { fg = accent, bold = true },

    -- Notifier history and the scratch, zen and profiler windows
    SnacksNotifierHistory = { fg = c.fg, bg = float_bg },
    SnacksNotifierHistoryDateTime = { fg = c.subtle },
    SnacksNotifierHistoryTitle = { fg = accent, bold = true },
    SnacksScratchTitle = { link = "FloatTitle" },
    SnacksScratchDesc = { fg = c.gray },
    SnacksScratchKey = { fg = c.gold, bold = true },
    SnacksZenIcon = { fg = accent },
    SnacksProfilerBadge = { fg = c.black, bg = accent },
    SnacksProfilerIcon = { fg = accent },
    SnacksProfilerPath = { fg = c.gray },
    SnacksProfilerTotal = { fg = c.gold, bold = true },

    -- Status column
    SnacksStatusColumnMark = { fg = c.gold },
  }

  result = vim.tbl_extend("error", result, notifier("Error", c.red))
  result = vim.tbl_extend("error", result, notifier("Warn", c.yellow))
  result = vim.tbl_extend("error", result, notifier("Info", c.sky))
  result = vim.tbl_extend("error", result, notifier("Debug", c.gray))
  result = vim.tbl_extend("error", result, notifier("Trace", c.lavender))

  if opts.dashboard then
    result = vim.tbl_extend("error", result, {
      SnacksDashboardNormal = { fg = c.fg, bg = ctx.solid(c.bg) },
      SnacksDashboardHeader = { fg = ctx.vary({ ["deeper-night"] = c.blue, maron = c.peach }, accent), bold = true },
      SnacksDashboardTitle = { fg = c.teal, bold = true },
      SnacksDashboardIcon = { fg = c.gold },
      SnacksDashboardKey = { fg = ctx.vary({ ["deeper-night"] = c.pink, maron = c.cyan }, c.yellow) },
      SnacksDashboardDesc = { fg = c.fg },
      SnacksDashboardFile = { fg = c.sky },
      SnacksDashboardDir = { fg = c.gray },
      SnacksDashboardFooter = { fg = c.gray, italic = true },
      SnacksDashboardSpecial = { fg = c.lavender },
      SnacksDashboardTerminal = { fg = c.fg },
    })
  end

  if opts.indent then
    result = vim.tbl_extend("error", result, {
      SnacksIndent = { fg = ctx.blend(c.border, c.bg, 0.6) },
      SnacksIndentBlank = { fg = ctx.blend(c.border, c.bg, 0.6) },
      SnacksIndentScope = { fg = accent },
      SnacksIndentChunk = { fg = accent },
    })
  end

  if opts.picker then
    result = vim.tbl_extend("error", result, {
      SnacksPicker = { link = "NormalFloat" },
      SnacksPickerBorder = { link = "FloatBorder" },
      SnacksPickerTitle = { link = "FloatTitle" },
      SnacksPickerInputBorder = { fg = accent, bg = float_bg },
      SnacksPickerInputTitle = { fg = accent, bold = true },
      SnacksPickerPrompt = { fg = accent },
      SnacksPickerCursorLine = { bg = c.overlay },
      SnacksPickerMatch = { fg = accent, bold = true },
      SnacksPickerSelected = { fg = c.teal },
      SnacksPickerIdx = { fg = c.subtle },
      SnacksPickerToggle = { fg = c.black, bg = c.teal },
      SnacksPickerDir = { fg = c.gray },
      SnacksPickerFile = { fg = c.fg },
      SnacksPickerPathHidden = { fg = c.subtle },
      SnacksPickerPathIgnored = { fg = c.subtle },
      SnacksPickerTree = { fg = c.border },
      SnacksPickerGitStatusAdded = { fg = c.green },
      SnacksPickerGitStatusModified = { fg = c.yellow },
      SnacksPickerGitStatusDeleted = { fg = c.red },
      SnacksPickerGitStatusRenamed = { fg = c.sky },
      SnacksPickerGitStatusUntracked = { fg = c.lavender },
      SnacksPickerGitStatusIgnored = { fg = c.subtle },
    })
  end

  return result
end

return M
