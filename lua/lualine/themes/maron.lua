local colors = require("nightfall.palettes").get("maron")

local maron = {}

maron.normal = {
  a = { bg = colors.pale_yellow, fg = colors.black },
  b = { bg = colors.deep_navy, fg = colors.pale_yellow },
  c = { bg = colors.statusline_bg, fg = colors.ghost_white },
}

maron.insert = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.deep_navy, fg = colors.green },
}

maron.terminal = {
  a = { bg = colors.peach, fg = colors.black },
  b = { bg = colors.deep_navy, fg = colors.peach },
}

maron.command = {
  a = { bg = colors.lavender, fg = colors.black },
  b = { bg = colors.deep_navy, fg = colors.lavender },
}

maron.visual = {
  a = { bg = colors.nord_blue, fg = colors.black },
  b = { bg = colors.deep_navy, fg = colors.nord_blue },
}

maron.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.deep_navy, fg = colors.red },
}

maron.inactive = {
  a = { bg = colors.statusline_bg, fg = colors.foreground },
  b = { bg = colors.statusline_bg, fg = colors.foreground },
  c = { bg = colors.statusline_bg, fg = colors.foreground },
}

return maron
