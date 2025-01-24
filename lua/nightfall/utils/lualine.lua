local M = {}

---@param flavor NightfallFlavor
function M.get(flavor)
  local config = require("nightfall.config")
  local options = config.get_options()
  local utils = require("nightfall.utils.colors")

  -- Merge user's custom colors
  local color_overrides = options.color_overrides.all or {}
  color_overrides = vim.tbl_deep_extend("force", color_overrides, options.color_overrides[flavor] or {})
  local colors = require("nightfall.palettes").get_palette(flavor, color_overrides)

  -- Define color mappings for different modes
  local normal_colors = {
    nightfall = colors.purple,
    ["deeper-night"] = colors.sky,
    maron = colors.peach,
    nord = colors.blue,
  }

  local insert_colors = {
    nightfall = colors.green,
    ["deeper-night"] = colors.magenta,
    maron = colors.blue,
    nord = colors.lime,
  }

  local command_color = flavor == "nightfall" and colors.blue or colors.coral
  local terminal_color = flavor == "nightfall" and colors.cyan or colors.cream
  local navy_color = utils.lighten(colors.navy, 0.9)

  local visual_colors = {
    nightfall = colors.sky,
    ["deeper-night"] = colors.yellow,
    maron = colors.lime,
    nord = colors.cyan,
  }

  -- Define lualine configuration
  local lualine = {}

  lualine.normal = {
    a = { fg = colors.black, bg = normal_colors[flavor] },
    b = { fg = normal_colors[flavor], bg = navy_color },
    c = {
      fg = colors.fg,
      bg = options.transparent and "NONE" or colors.black,
    },
  }

  lualine.insert = {
    a = { fg = colors.black, bg = insert_colors[flavor] },
    b = { fg = insert_colors[flavor], bg = navy_color },
  }

  lualine.terminal = {
    a = { bg = terminal_color, fg = colors.black },
    b = { bg = navy_color, fg = terminal_color },
  }

  lualine.command = {
    a = { fg = colors.black, bg = command_color },
    b = { fg = command_color, bg = navy_color },
  }

  lualine.visual = {
    a = { bg = visual_colors[flavor], fg = colors.black },
    b = { bg = navy_color, fg = visual_colors[flavor] },
  }

  lualine.replace = {
    a = { fg = colors.black, bg = colors.red },
    b = { fg = colors.red, bg = navy_color },
  }

  lualine.inactive = {
    a = { bg = colors.black, fg = options.dim_inactive and utils.darken(colors.latte, 0.9) or colors.latte },
    b = { bg = colors.black, fg = options.dim_inactive and utils.darken(colors.latte, 0.9) or colors.latte },
    c = { bg = colors.black, fg = options.dim_inactive and utils.darken(colors.latte, 0.9) or colors.latte },
  }

  return lualine
end

return M
