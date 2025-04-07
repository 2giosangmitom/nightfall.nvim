local M = {}

---@param colors NightfallPalette
---@param opts table
function M.get(colors, opts)
  local res = {}

  if opts.icons or false then
    res = vim.tbl_deep_extend("error", res, require("nightfall.groups.integrations.mini.icons").get(colors))
  end

  if opts.trailspace or false then
    res = vim.tbl_deep_extend("error", res, require("nightfall.groups.integrations.mini.trailspace").get(colors))
  end

  return res
end

return M
