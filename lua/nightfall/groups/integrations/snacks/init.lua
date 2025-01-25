local M = {}

---@param colors NightfallPalette
---@param opts table
function M.get(colors, opts)
  local res = {}

  if opts.dashboard or false then
    res = vim.tbl_deep_extend("error", res, require("nightfall.groups.integrations.snacks.dashboard").get(colors))
  end

  return res
end

return M
