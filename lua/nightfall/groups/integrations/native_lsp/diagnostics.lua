--- Neovim diagnostics, including virtual lines added in 0.11.

local U = require("nightfall.color")

local M = {}

--- The five diagnostic severities, in the order Neovim lists them.
---@private
local SEVERITIES = { "Error", "Warn", "Info", "Hint", "Ok" }

---@param c NightfallPalette
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, flavor)
  --- The color of each severity.
  local severity = {
    Error = c.red,
    Warn = c.yellow,
    Info = flavor == "maron" and c.purple or c.sky,
    Hint = c.cyan,
    Ok = c.green,
  }

  local result = {
    -- Severity-independent diagnostic decorations
    DiagnosticDeprecated = { sp = c.gray, strikethrough = true },
    DiagnosticUnnecessary = { fg = c.subtle, italic = true },
  }

  for _, name in ipairs(SEVERITIES) do
    local fg = severity[name]
    local wash = U.blend(fg, c.bg, 0.14)

    result["Diagnostic" .. name] = { fg = fg }
    result["DiagnosticSign" .. name] = { fg = fg }
    result["DiagnosticFloating" .. name] = { fg = fg }
    result["DiagnosticVirtualText" .. name] = { fg = fg, bg = wash, style = { italic = true } }
    result["DiagnosticVirtualLines" .. name] = { fg = fg, bg = wash }
    result["DiagnosticUnderline" .. name] = { sp = fg, style = { undercurl = true } }
  end

  return result
end

return M
