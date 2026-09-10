--- The build context handed to every highlight group module.
---
--- A context bundles the flavor being built, its palette and the resolved user
--- options, so group modules stay pure functions of their argument instead of
--- reaching for module-level state.
---@tag nightfall-context

local color = require("nightfall.color")
local palette = require("nightfall.palette")
local roles = require("nightfall.roles")

local M = {}

---@class NightfallCtx
---@field flavor NightfallFlavor Flavor being built.
---@field c NightfallPalette Palette of that flavor, after `color_overrides`.
---@field o NightfallOptions Resolved user options.
---@field styles NightfallStyles Shorthand for `o.styles`.
---@field accent string The flavor's accent color.
---@field vary fun(per_flavor: table<string,string>, fallback: string): string
---@field role fun(name: string): string This flavor's color for a syntax role.
---@field solid fun(hex: string): string A background, or `NONE` when transparent.
---@field blend fun(fg: string, bg: string, alpha: number): string
---@field darken fun(hex: string, amount: number, bg?: string): string
---@field lighten fun(hex: string, amount: number, fg?: string): string

--- Which accent each flavor uses. Flavors absent here fall back to `sky`.
---@private
local function accent_of(colors, flavor)
  local accents = {
    nightfall = colors.purple,
    maron = colors.lavender,
  }
  return accents[flavor] or colors.sky
end

--- Colors overriding this flavor's palette, `all` first then the flavor's own.
---@param opts NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,string>
---@private
local function color_overrides(opts, flavor)
  local overrides = vim.deepcopy(opts.color_overrides.all or {})
  return vim.tbl_extend("force", overrides, opts.color_overrides[flavor] or {})
end

--- Build the context for one flavor.
---@param flavor NightfallFlavor Flavor to build.
---@param opts NightfallOptions Resolved user options.
---@return NightfallCtx
function M.new(flavor, opts)
  local colors = palette.get(flavor, color_overrides(opts, flavor))

  return {
    flavor = flavor,
    c = colors,
    o = opts,
    styles = opts.styles,
    accent = accent_of(colors, flavor),
    vary = function(per_flavor, fallback) return per_flavor[flavor] or fallback end,
    role = function(name) return roles.get(colors, flavor, name) end,
    solid = function(hex) return opts.transparent and "NONE" or hex end,
    blend = color.blend,
    darken = color.darken,
    lighten = color.lighten,
  }
end

return M
