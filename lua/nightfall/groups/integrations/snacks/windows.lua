--- Shared Snacks windows, input and utility widgets.

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

  return {
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
    SnacksProfilerBadge = { fg = on_accent, bg = accent },
    SnacksProfilerIcon = { fg = accent },
    SnacksProfilerPath = { fg = c.gray },
    SnacksProfilerTotal = { fg = c.gold, bold = true },

    -- Status column
    SnacksStatusColumnMark = { fg = c.gold },
  }
end

return M
