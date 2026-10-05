--- https://github.com/folke/todo-comments.nvim
---
--- Each keyword gets three groups: a filled block for the sign and the label,
--- a plain foreground for the rest of the comment, and one for the sign column.

local palette = require("nightfall.palette")

local M = {}

--- Palette color per keyword.
---@private
local KEYWORDS = {
  FIX = "red",
  TODO = "sky",
  HACK = "orange",
  WARN = "yellow",
  PERF = "lavender",
  NOTE = "teal",
  TEST = "magenta",
}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local on_accent = palette.on_accent(c, flavor)
  local result = {}

  for keyword, name in pairs(KEYWORDS) do
    local fg = c[name]

    result["TodoBg" .. keyword] = { fg = on_accent, bg = fg, bold = true }
    result["TodoFg" .. keyword] = { fg = fg }
    result["TodoSign" .. keyword] = { fg = fg }
  end

  return result
end

return M
