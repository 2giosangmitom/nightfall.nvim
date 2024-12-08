local M = {}

---@param flavor NightfallFlavor
---@param overrides? table
---@return NightfallPalette
function M.get_palette(flavor, overrides)
  local ok, palette = pcall(require, "nightfall.palettes." .. flavor)
  if not ok then error(flavor .. "is not a Nightfall's flavor", vim.log.levels.ERROR) end
  palette = vim.tbl_deep_extend("force", palette, overrides or {})
  return palette
end

return M
