--- https://github.com/folke/snacks.nvim
local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local opts = o.integrations.snacks
  local result = vim.tbl_extend(
    "error",
    require("nightfall.groups.integrations.snacks.windows").get(c, o, flavor),
    require("nightfall.groups.integrations.snacks.notifier").get(c, o)
  )

  if opts.dashboard then
    result =
      vim.tbl_extend("error", result, require("nightfall.groups.integrations.snacks.dashboard").get(c, o, flavor))
  end
  if opts.indent then
    result = vim.tbl_extend("error", result, require("nightfall.groups.integrations.snacks.indent").get(c, flavor))
  end
  if opts.picker then
    result = vim.tbl_extend("error", result, require("nightfall.groups.integrations.snacks.picker").get(c, o, flavor))
  end
  return result
end

return M
