--- https://github.com/nvim-mini/mini.nvim
local M = {}

---@param c NightfallPalette
---@param o NightfallIntegrationOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local opts = o
  local result = require("nightfall.groups.integrations.mini.base").get(c, o, flavor)

  if opts.icons then
    result = vim.tbl_extend("error", result, require("nightfall.groups.integrations.mini.icons").get(c))
  end
  if opts.trailspace then
    result = vim.tbl_extend("error", result, require("nightfall.groups.integrations.mini.trailspace").get(c))
  end
  if opts.indentscope then
    result = vim.tbl_extend("error", result, require("nightfall.groups.integrations.mini.indentscope").get(c, flavor))
  end
  return result
end

return M
