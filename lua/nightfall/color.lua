--- Pure helpers for manipulating `#RRGGBB` color strings.
---
--- Every function here is free of side effects and of any knowledge about the
--- active flavor, which makes them safe to call from anywhere and easy to test.
---@tag nightfall-color
---@toc_entry Colors

local M = {}

-- Color that `darken` blends towards by default.
local BLACK = "#000000"

-- Color that `lighten` blends towards by default.
local WHITE = "#ffffff"

--- Split a hexadecimal color into its red, green and blue channels.
---@param hex string A `#RRGGBB` color string, case insensitive.
---@return integer, integer, integer
---@private
local function to_rgb(hex)
  local lowered = hex:lower()
  if #lowered ~= 7 or not lowered:match("^#%x%x%x%x%x%x$") then
    error(string.format("nightfall: invalid hex color %q, expected the form '#RRGGBB'", hex), 2)
  end

  return tonumber(lowered:sub(2, 3), 16), tonumber(lowered:sub(4, 5), 16), tonumber(lowered:sub(6, 7), 16)
end

--- Mix two colors together.
---
--- An `alpha` of 1 returns `foreground` untouched and an alpha of 0 returns
--- `background` untouched.
---@param foreground string A `#RRGGBB` color string.
---@param background string A `#RRGGBB` color string.
---@param alpha number How much of `foreground` to keep, between 0 and 1.
---@return string The mixed color as `#RRGGBB`.
function M.blend(foreground, background, alpha)
  local fr, fg, fb = to_rgb(foreground)
  local br, bg, bb = to_rgb(background)

  local function channel(f, b)
    local mixed = alpha * f + (1 - alpha) * b
    return math.floor(math.min(math.max(mixed, 0), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", channel(fr, br), channel(fg, bg), channel(fb, bb))
end

--- Blend a color towards black, or towards `bg` when one is given.
---@param hex string A `#RRGGBB` color string.
---@param amount number How much of `hex` to keep, between 0 and 1.
---@param bg? string The color to blend towards. Defaults to black.
---@return string The darkened color as `#RRGGBB`.
function M.darken(hex, amount, bg) return M.blend(hex, bg or BLACK, amount) end

--- Blend a color towards white, or towards `fg` when one is given.
---@param hex string A `#RRGGBB` color string.
---@param amount number How much of `hex` to keep, between 0 and 1.
---@param fg? string The color to blend towards. Defaults to white.
---@return string The lightened color as `#RRGGBB`.
function M.lighten(hex, amount, fg) return M.blend(hex, fg or WHITE, amount) end

return M
