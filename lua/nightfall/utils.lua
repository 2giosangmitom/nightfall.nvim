local M = {}

M.bg = "#000000"
M.fg = "#ffffff"

--- Converts a hexadecimal color code to an RGB array.
---@param hex string: The hexadecimal color code (#RRGGBB).
---@return table<string>: An array containing the RGB components.
local function hexToRgb(hex)
  hex = string.lower(hex)
  if not hex:match("^#[0-9a-f]+$") or #hex ~= 7 then error("Invalid hex color format: " .. hex) end

  local r = tonumber(hex:sub(2, 3), 16)
  local g = tonumber(hex:sub(4, 5), 16)
  local b = tonumber(hex:sub(6, 7), 16)

  return { r, g, b }
end

--- Blends foreground and background colors based on the given alpha value.
---@param foreground string: The hexadecimal color code of the foreground color.
---@param background string: The hexadecimal color code of the background color.
---@param alpha number|string: The alpha value (between 0 and 1 or hexadecimal string).
---@return string: The blended color in hexadecimal format.
function M.blend(foreground, background, alpha)
  if type(alpha) == "string" then alpha = tonumber(alpha, 16) / 0xff end

  local success_bg, bg_rgb = pcall(hexToRgb, background)
  if not success_bg then error("Invalid background color: " .. background) end

  local success_fg, fg_rgb = pcall(hexToRgb, foreground)
  if not success_fg then error("Invalid foreground color: " .. foreground) end

  local function blendChannel(i)
    local inv_alpha = 1 - alpha
    local ret = (alpha * fg_rgb[i] + inv_alpha * bg_rgb[i])
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

--- Darkens a hexadecimal color code by blending it with the background color.
---@param hex string: The hexadecimal color code to darken.
---@param amount number|string: The amount by which to darken (between 0 and 1 or hexadecimal string).
---@param bg string|nil: The background color (optional, defaults to M.bg if nil).
---@return string: The darkened color in hexadecimal format.
function M.darken(hex, amount, bg) return M.blend(hex, bg or M.bg, amount) end

--- Lightens a hexadecimal color code by blending it with the foreground color.
---@param hex string: The hexadecimal color code to lighten.
---@param amount number|string: The amount by which to lighten (between 0 and 1 or hexadecimal string).
---@param fg string|nil: The foreground color (optional, defaults to M.fg if nil).
---@return string: The lightened color in hexadecimal format.
function M.lighten(hex, amount, fg) return M.blend(hex, fg or M.fg, amount) end

--- Selects a color palette based on the flavor option.
---@param palettes table: A table containing color palettes indexed by flavor options.
---@param default string: The default color palette to use if the flavor option is not found.
---@return string: The selected color palette.
function M.vary_color(palettes, default)
  local flavor = require("nightfall").flavor
  return palettes[flavor] or default
end

return M
