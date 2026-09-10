--- https://github.com/akinsho/bufferline.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, accent = ctx.c, ctx.accent

  local fill_bg = ctx.solid(c.bg_dim)
  local plain_bg = ctx.solid(c.bg_alt)
  local current_bg = ctx.solid(c.bg)

  --- The three states a buffer entry can be in.
  local states = {
    { suffix = "", fg = c.subtle, bg = plain_bg },
    { suffix = "Visible", fg = c.gray, bg = plain_bg },
    { suffix = "Selected", fg = c.latte, bg = current_bg },
  }

  local result = {
    BufferLineFill = { bg = fill_bg },
    BufferLineBackground = { fg = c.subtle, bg = plain_bg },
    BufferLineIndicatorSelected = { fg = accent, bg = current_bg },
    BufferLineIndicatorVisible = { fg = c.border, bg = plain_bg },
    BufferLineSeparator = { fg = c.bg_dim, bg = plain_bg },
    BufferLineSeparatorVisible = { fg = c.bg_dim, bg = plain_bg },
    BufferLineSeparatorSelected = { fg = c.bg_dim, bg = current_bg },
    BufferLineOffsetSeparator = { fg = c.border, bg = fill_bg },
    BufferLineTruncMarker = { fg = c.border, bg = fill_bg },
    BufferLineTab = { fg = c.subtle, bg = plain_bg },
    BufferLineTabSelected = { fg = c.black, bg = accent, bold = true },
    BufferLineTabSeparator = { fg = c.bg_dim, bg = plain_bg },
    BufferLineTabSeparatorSelected = { fg = c.bg_dim, bg = accent },
    BufferLineTabClose = { fg = c.red, bg = fill_bg },
  }

  for _, state in ipairs(states) do
    local suffix, fg, bg = state.suffix, state.fg, state.bg

    result["BufferLineBuffer" .. suffix] = { fg = fg, bg = bg }
    result["BufferLineNumbers" .. suffix] = { fg = fg, bg = bg }
    result["BufferLineDuplicate" .. suffix] = { fg = fg, bg = bg, italic = true }
    result["BufferLineCloseButton" .. suffix] = { fg = fg, bg = bg }
    result["BufferLineModified" .. suffix] = { fg = c.gold, bg = bg }
    result["BufferLinePick" .. suffix] = { fg = c.coral, bg = bg, bold = true }
    result["BufferLineError" .. suffix] = { fg = c.red, bg = bg }
    result["BufferLineErrorDiagnostic" .. suffix] = { fg = c.red, bg = bg }
    result["BufferLineWarning" .. suffix] = { fg = c.yellow, bg = bg }
    result["BufferLineWarningDiagnostic" .. suffix] = { fg = c.yellow, bg = bg }
    result["BufferLineInfo" .. suffix] = { fg = c.sky, bg = bg }
    result["BufferLineInfoDiagnostic" .. suffix] = { fg = c.sky, bg = bg }
    result["BufferLineHint" .. suffix] = { fg = c.cyan, bg = bg }
    result["BufferLineHintDiagnostic" .. suffix] = { fg = c.cyan, bg = bg }
    result["BufferLineDiagnostic" .. suffix] = { fg = fg, bg = bg }
  end

  return result
end

return M
