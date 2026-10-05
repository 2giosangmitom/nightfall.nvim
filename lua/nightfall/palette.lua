--- Access to the raw color palettes behind each flavor.
---
--- A palette has two halves. The first is a ramp of neutrals running from
--- `black` up to `white`, which every flavor orders by brightness, so a group
--- can pick a surface or a foreground by role rather than by hue. The second is
--- the set of hues, named the same way in every flavor, so a highlight written
--- once reads correctly in all of them.
---@tag nightfall-palette
---@toc_entry Palettes

local M = {}

---@alias NightfallFlavor "nightfall"|"deeper-night"|"maron"|"winter"

---@tag NightfallPalette
---@class NightfallPalette
--- Surfaces, deepest first.
---@field bg_dim string Recessed background, for sidebars and floats.
---@field bg string The editor background.
---@field bg_alt string One step above `bg`, for the cursor line and folds.
---@field surface string Raised panels, such as the popup menu and the tabline.
---@field overlay string Selections and the current popup menu item.
---@field border string Window separators, indent guides and float borders.
--- Foregrounds, quietest first.
---@field black string Near black, for text drawn on top of a hue.
---@field subtle string Line numbers, listchars and other background UI.
---@field gray string Comments and disabled text.
---@field silver string Muted but readable text.
---@field fg string The default foreground.
---@field latte string Emphasised text, brighter than `fg`.
---@field white string The brightest foreground.
--- Hues, warm to cool.
---@field red string
---@field coral string
---@field rose string
---@field pink string
---@field magenta string
---@field purple string
---@field lavender string
---@field blue string
---@field sky string
---@field cyan string
---@field teal string
---@field green string
---@field lime string
---@field yellow string
---@field cream string
---@field gold string
---@field orange string
---@field peach string
---@field sand string

--- Names of every flavor this colorscheme ships.
---@type NightfallFlavor[]
M.flavors = { "nightfall", "deeper-night", "maron", "winter" }

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

--- Read a palette with global and flavor-specific user overrides applied.
---@param flavor NightfallFlavor
---@param opts NightfallOptions
---@return NightfallPalette
function M.resolve(flavor, opts)
  local overrides = opts.color_overrides or {}
  return M.get(flavor, vim.tbl_extend("force", overrides.all or {}, overrides[flavor] or {}))
end

--- The flavor's accent, read from the supplied palette.
---@param colors NightfallPalette
---@param flavor NightfallFlavor
---@return string
function M.accent(colors, flavor)
  if flavor == "nightfall" then return colors.purple end
  if flavor == "maron" then return colors.lavender end
  if flavor == "winter" then return colors.blue end
  return colors.sky
end

--- Foreground readable on this flavor's accent-colored backgrounds.
---@param colors NightfallPalette
---@param flavor NightfallFlavor
---@return string
function M.on_accent(colors, flavor) return flavor == "winter" and colors.bg or colors.black end

return M
