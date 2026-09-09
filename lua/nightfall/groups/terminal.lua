--- The sixteen ANSI colors Neovim's built-in terminal uses.
---
--- The same mapping drives the generated terminal emulator themes under
--- `extras/`, so a terminal and `:terminal` agree on their colors.

local M = {}

--- Palette color backing each ANSI slot, in the usual black-to-white order.
---@param colors NightfallPalette
---@return string[] Sixteen `#RRGGBB` strings, normal slots then bright ones.
function M.ansi(colors)
  local normal = {
    colors.latte,
    colors.red,
    colors.green,
    colors.yellow,
    colors.sky,
    colors.pink,
    colors.cyan,
    colors.white,
  }

  local ansi = {}
  for slot = 1, 8 do
    ansi[slot], ansi[slot + 8] = normal[slot], normal[slot]
  end

  return ansi
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
