local M = {}

---@param flavor NightfallFlavor
---@param overrides? table
---@return NightfallPalette
function M.get_palette(flavor, overrides)
  local palette = require("nightfall.palettes." .. flavor)
  local result = vim.tbl_deep_extend("keep", overrides or {}, palette.get())
  return result
end

return M
