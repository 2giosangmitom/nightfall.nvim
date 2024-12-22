local M = {}

---@param colors NightfallPalette
---@param options table<"transparent"|"dim_inactive", boolean>
function M.get(colors, options)
  -- See `:h highlight-groups`
  return {
    ColorColumn = { bg = options.transparent and "NONE" or colors.black },
  }
end

return M
