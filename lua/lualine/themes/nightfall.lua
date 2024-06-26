local colors = require("nightfall.palettes").get("nightfall")

local nightfall = {}

nightfall.normal = {
  a = { bg = colors.violet, fg = colors.black },
  b = { bg = colors.deep_navy, fg = colors.violet },
  c = { bg = colors.statusline_bg, fg = colors.ghost_white },
}

nightfall.insert = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.deep_navy, fg = colors.green },
}

nightfall.terminal = {
  a = { bg = colors.peach, fg = colors.black },
  b = { bg = colors.deep_navy, fg = colors.peach },
}

nightfall.command = {
  a = { bg = colors.pale_yellow, fg = colors.black },
  b = { bg = colors.deep_navy, fg = colors.pale_yellow },
}

nightfall.visual = {
  a = { bg = colors.nord_blue, fg = colors.black },
  b = { bg = colors.deep_navy, fg = colors.nord_blue },
}

nightfall.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.deep_navy, fg = colors.red },
}

nightfall.inactive = {
  a = { bg = colors.statusline_bg, fg = colors.foreground },
  b = { bg = colors.statusline_bg, fg = colors.foreground },
  c = { bg = colors.statusline_bg, fg = colors.foreground },
}

return nightfall
