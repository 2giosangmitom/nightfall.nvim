--- The sixteen ANSI colors Neovim's built-in terminal uses.
---
--- The same mapping drives the generated terminal emulator themes under
--- `extras/`, so a terminal and `:terminal` agree on their colors.

local M = {}

--- Palette color backing each ANSI slot, in the usual black-to-white order.
---
--- The eight bright slots are their own colors rather than copies of the normal
--- ones, so a program that reaches for bright red or bright black gets
--- something the flavor actually chose.
---@param colors NightfallPalette
---@return string[] Sixteen `#RRGGBB` strings, normal slots then bright ones.
function M.ansi(colors)
  return {
    -- Normal
    colors.black,
    colors.red,
    colors.green,
    colors.yellow,
    colors.sky,
    colors.purple,
    colors.cyan,
    colors.silver,

    -- Bright
    colors.subtle,
    colors.coral,
    colors.lime,
    colors.gold,
    colors.blue,
    colors.magenta,
    colors.teal,
    colors.white,
  }
end

---@param ctx NightfallCtx
---@return table<string,string> `terminal_color_*` globals and their values.
function M.get(ctx)
  local result = {}
  for index, hex in ipairs(M.ansi(ctx.c)) do
    result["terminal_color_" .. (index - 1)] = hex
  end
  return result
end

return M
