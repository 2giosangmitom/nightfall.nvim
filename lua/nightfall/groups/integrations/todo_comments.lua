--- https://github.com/folke/todo-comments.nvim
---
--- Each keyword gets three groups: a filled block for the sign and the label,
--- a plain foreground for the rest of the comment, and one for the sign column.

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

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c
  local result = {}

  for keyword, name in pairs(KEYWORDS) do
    local fg = c[name]

    result["TodoBg" .. keyword] = { fg = c.black, bg = fg, bold = true }
    result["TodoFg" .. keyword] = { fg = fg }
    result["TodoSign" .. keyword] = { fg = fg }
  end

  return result
end

return M
