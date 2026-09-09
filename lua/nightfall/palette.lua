--- Access to the raw color palettes behind each flavor.
---@tag nightfall-palette
---@toc_entry Palettes

local M = {}

---@tag NightfallPalette
---@class NightfallPalette
---@field bg string
---@field fg string
---@field black string
---@field red string
---@field green string
---@field yellow string
---@field blue string
---@field magenta string
---@field cyan string
---@field white string
---@field orange string
---@field pink string
---@field purple string
---@field teal string
---@field sky string
---@field lime string
---@field sand string
---@field cream string
---@field gray string
---@field charcoal string
---@field silver string
---@field gold string
---@field rose string
---@field coral string
---@field peach string
---@field lavender string
---@field latte string
---@field navy string

--- Names of every flavor this colorscheme ships.
---@type NightfallFlavor[]
M.flavors = { "nightfall", "deeper-night", "maron" }

--- Read the palette of a flavor, with optional per-color overrides applied.
---@param flavor NightfallFlavor Which flavor to read.
---@param overrides? table<string,string> Colors replacing the flavor's own.
---@return NightfallPalette
function M.get(flavor, overrides)
  if not vim.tbl_contains(M.flavors, flavor) then
    local known = table.concat(M.flavors, ", ")
    error(string.format("nightfall: unknown flavor %q, expected one of %s", flavor, known), 2)
  end

  local palette = require("nightfall.palettes." .. flavor)
  return vim.tbl_extend("force", palette, overrides or {})
end

return M
