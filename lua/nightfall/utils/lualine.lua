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

  local normal = flavor == "nightfall" and colors.purple or colors.blue
  local insert = flavor == "nightfall" and colors.green or colors.sky
  local command = flavor == "nightfall" and colors.blue or colors.coral
  local terminal = flavor == "nightfall" and colors.cyan or colors.cream
  local navy = utils.lighten(colors.navy, 0.9)

  local lualine = {}

  lualine.normal = {
    a = { fg = colors.black, bg = normal },
    b = { fg = normal, bg = navy },
    c = { fg = colors.fg, bg = colors.black },
  }

  lualine.insert = {
    a = { fg = colors.black, bg = insert },
    b = { fg = insert, bg = navy },
  }

  lualine.terminal = {
    a = { bg = terminal, fg = colors.black },
    b = { bg = navy, fg = terminal },
  }

  lualine.command = {
    a = { fg = colors.black, bg = command },
    b = { fg = command, bg = navy },
  }

  lualine.visual = {
    a = { bg = colors.sky, fg = colors.black },
    b = { bg = navy, fg = colors.sky },
  }

  lualine.replace = {
    a = { fg = colors.black, bg = colors.red },
    b = { fg = colors.red, bg = navy },
  }

  lualine.inactive = {
    a = { bg = colors.black, fg = options.dim_inactive and utils.darken(colors.azure, 0.9) or colors.azure },
    b = { bg = colors.black, fg = options.dim_inactive and utils.darken(colors.azure, 0.9) or colors.azure },
    c = { bg = colors.black, fg = options.dim_inactive and utils.darken(colors.azure, 0.9) or colors.azure },
  }

  return lualine
end

return M
