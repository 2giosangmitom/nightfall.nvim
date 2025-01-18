local M = {}

---@return NightfallPalette
function M.get()
  ---@type NightfallPalette
  return {
    azure = "#edf7f6",
    bg = "#1e222a",
    black = "#011502",
    blue = "#62b6cb",
    charcoal = "#454955",
    coral = "#f67e7d",
    cream = "#edf7d2",
    cyan = "#8be9fd",
    fg = "#e9e9f4",
    gold = "#fcc737",
    gray = "#888da7",
    green = "#d6ffb7",
    lavender = "#cae9ff",
    lime = "#a1e44d",
    magenta = "#e2adf2",
    navy = "#373760",
    orange = "#f1ab86",
    peach = "#ffb997",
    pink = "#f84aa7",
    purple = "#9a86fd",
    red = "#ff5555",
    rose = "#dd9ac2",
    sand = "#c9c19f",
    silver = "#c9c9c9",
    sky = "#b5f8fe",
    teal = "#7ae7c7",
    white = "#ffffff",
    yellow = "#fff689",
  }
end

return M
