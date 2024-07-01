local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    terminal_color_0 = colors.deep_navy,
    terminal_color_8 = colors.light_grey,

    terminal_color_1 = colors.red,
    terminal_color_9 = colors.red,

    terminal_color_2 = colors.green,
    terminal_color_10 = colors.green,

    terminal_color_3 = colors.pale_yellow,
    terminal_color_11 = colors.pale_yellow,

    terminal_color_4 = colors.sky,
    terminal_color_12 = colors.sky,

    terminal_color_5 = colors.pink,
    terminal_color_13 = colors.pink,

    terminal_color_6 = colors.light_cyan,
    terminal_color_14 = colors.light_cyan,

    terminal_color_7 = colors.ghost_white,
    terminal_color_15 = colors.ghost_white,
  }
end

return M
