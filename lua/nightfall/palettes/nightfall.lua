local M = {}

---@return NightfallPalette
function M.get()
  ---@type NightfallPalette
  return {
    azure = "#edf7f6",
    bg = "#141523",
    black = "#011502",
    blue = "#05c3ff",
    brown = "#613a3a",
    charcoal = "#454955",
    coral = "#e76b74",
    cream = "#edf7d2",
    cyan = "#8be9fd",
    fg = "#e9e9f4",
    gold = "#fcc737",
    gray = "#888da7",
    green = "#50fa7b",
    indigo = "#4d243d",
    lavender = "#beb8eb",
    lime = "#a1e44d",
    magenta = "#e2adf2",
    navy = "#313244",
    orange = "#ea9010",
    peach = "#f7dba7",
    pink = "#f84aa7",
    purple = "#9a86fd",
    red = "#ff5555",
    rose = "#dd9ac2",
    sand = "#c9c19f",
    silver = "#c9c9c9",
    sky = "#2cccff",
    teal = "#72bda3",
    violet = "#7e1891",
    white = "#ffffff",
    yellow = "#f2fa95",
  }
end

return M
