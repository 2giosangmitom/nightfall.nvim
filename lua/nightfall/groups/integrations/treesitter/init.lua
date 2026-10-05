--- Treesitter captures and optional context window highlights.
local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local opts = o.integrations.treesitter
  local result = require("nightfall.groups.integrations.treesitter.captures").get(c, o.styles or {}, flavor)
  if opts.context then
    result =
      vim.tbl_extend("error", result, require("nightfall.groups.integrations.treesitter.context").get(c, o.transparent))
  end
  return result
end

return M
