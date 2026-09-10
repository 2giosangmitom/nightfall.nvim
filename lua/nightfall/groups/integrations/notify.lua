--- https://github.com/rcarriga/nvim-notify

local M = {}

--- Palette color per notification level.
---@private
local LEVELS = {
  ERROR = "red",
  WARN = "yellow",
  INFO = "sky",
  DEBUG = "gray",
  TRACE = "lavender",
}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c
  local result = {}

  for level, name in pairs(LEVELS) do
    local fg = c[name]

    result["Notify" .. level .. "Border"] = { fg = ctx.blend(fg, c.bg, 0.6) }
    result["Notify" .. level .. "Icon"] = { fg = fg }
    result["Notify" .. level .. "Title"] = { fg = fg, bold = true }
    result["Notify" .. level .. "Body"] = { fg = c.fg, bg = ctx.solid(c.bg_dim) }
  end

  return result
end

return M
