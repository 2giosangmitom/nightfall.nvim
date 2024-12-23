local M = {}

---@return NightfallPalette
function M.get()
  ---@type NightfallPalette
  return {
    azure = "#edf7f6",
    bg = "#1E222A",
    black = "#011502",
    blue = "#62B6CB",
    brown = "#613a3a",
    charcoal = "#454955",
    coral = "#F67E7D",
    cream = "#edf7d2",
    cyan = "#8be9fd",
    fg = "#e9e9f4",
    gold = "#fcc737",
    gray = "#888da7",
    green = "#D6FFB7",
    indigo = "#4d243d",
    lavender = "#CAE9FF",
    lime = "#a1e44d",
    magenta = "#e2adf2",
    navy = "#373760",
    orange = "#F1AB86",
    peach = "#FFB997",
    pink = "#f84aa7",
    purple = "#9a86fd",
    red = "#ff5555",
    rose = "#dd9ac2",
    sand = "#c9c19f",
    silver = "#c9c9c9",
    sky = "#B5F8FE",
    teal = "#7AE7C7",
    violet = "#58355E",
    white = "#ffffff",
    yellow = "#FFF689",
  }
end

return M
