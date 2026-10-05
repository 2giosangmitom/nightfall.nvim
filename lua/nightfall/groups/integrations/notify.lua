--- https://github.com/rcarriga/nvim-notify

local U = require("nightfall.color")

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

---@param c NightfallPalette
---@param o NightfallIntegrationOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local result = {}

  for level, name in pairs(LEVELS) do
    local fg = c[name]

    result["Notify" .. level .. "Border"] = { fg = U.blend(fg, c.bg, 0.6) }
    result["Notify" .. level .. "Icon"] = { fg = fg }
    result["Notify" .. level .. "Title"] = { fg = fg, bold = true }
    result["Notify" .. level .. "Body"] = { fg = c.fg, bg = U.background(c.bg_dim, o.transparent) }
  end

  return result
end

return M
