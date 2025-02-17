local M = {}

---@param colors NightfallPalette
---@param opts table
function M.get(colors, opts)
  local res = {}

  if opts.dashboard or false then
    res = vim.tbl_deep_extend("error", res, require("nightfall.groups.integrations.snacks.dashboard").get(colors))
  end

  if opts.indent or false then
    res = vim.tbl_deep_extend("error", res, require("nightfall.groups.integrations.snacks.indent").get(colors))
  end

  if opts.picker or false then
    res = vim.tbl_deep_extend("error", res, require("nightfall.groups.integrations.snacks.picker").get(colors))
  end

  return res
end

return M
