--- https://github.com/stevearc/aerial.nvim

local kinds = require("nightfall.groups.kinds")

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)

  return vim.tbl_extend("error", {
    AerialNormal = { fg = c.fg, bg = U.background(c.bg_dim, o.transparent) },
    AerialLine = { bg = c.overlay, bold = true },
    AerialLineNC = { bg = c.bg_alt },
    AerialGuide = { fg = c.border },
    AerialGuide1 = { fg = c.border },
    AerialGuide2 = { fg = c.subtle },
    AerialGuide3 = { fg = accent },
  }, kinds.groups(c, flavor, "Aerial"))
end

return M
