--- Notification severity decorations.
local U = require("nightfall.color")
local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@return table<string,table>
function M.get(c, o)
  local float_bg = U.background(c.bg_dim, o.transparent)
  local result = {}
  for level, fg in pairs({ Error = c.red, Warn = c.yellow, Info = c.sky, Debug = c.gray, Trace = c.lavender }) do
    result["SnacksNotifier" .. level] = { fg = c.fg, bg = float_bg }
    result["SnacksNotifierBorder" .. level] = { fg = fg, bg = float_bg }
    result["SnacksNotifierIcon" .. level] = { fg = fg }
    result["SnacksNotifierTitle" .. level] = { fg = fg, bold = true }
    result["SnacksNotifierFooter" .. level] = { fg = c.gray }
  end
  return result
end

return M
