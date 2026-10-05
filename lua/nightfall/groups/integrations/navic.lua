--- https://github.com/SmiteshP/nvim-navic

local kinds = require("nightfall.groups.kinds")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  return vim.tbl_extend("error", {
    NavicText = { fg = c.fg },
    NavicSeparator = { fg = c.border },
  }, kinds.groups(c, flavor, "NavicIcons"))
end

return M
