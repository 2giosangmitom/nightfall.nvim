--- https://github.com/nvim-treesitter/nvim-treesitter-context
local U = require("nightfall.color")
local M = {}

---@param c NightfallPalette
---@param transparent boolean
---@return table<string,table>
function M.get(c, transparent)
  return {
    TreesitterContext = { bg = U.background(c.bg_alt, transparent) },
    TreesitterContextBottom = { sp = c.border, underline = true },
    TreesitterContextLineNumber = { fg = c.subtle, bg = U.background(c.bg_alt, transparent) },
    TreesitterContextLineNumberBottom = { sp = c.border, underline = true },
    TreesitterContextSeparator = { fg = c.border },
  }
end

return M
