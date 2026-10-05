--- Picker highlights.
local U = require("nightfall.color")
local palette = require("nightfall.palette")
local M = {}

---@param c NightfallPalette
---@param o NightfallIntegrationOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)
  local on_accent = palette.on_accent(c, flavor)
  local float_bg = U.background(c.bg_dim, o.transparent)
  return {
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
    SnacksPickerToggle = { fg = on_accent, bg = c.teal },
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
  }
end

return M
