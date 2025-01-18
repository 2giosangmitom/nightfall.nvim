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

  local normal = {
    nightfall = colors.purple,
    ["deeper-night"] = colors.sky,
  }

  local insert = {
    nightfall = colors.green,
    ["deeper-night"] = colors.magenta,
  }
  local command = flavor == "nightfall" and colors.blue or colors.coral
  local terminal = flavor == "nightfall" and colors.cyan or colors.cream
  local navy = utils.lighten(colors.navy, 0.9)
  local visual = {
    nightfall = colors.sky,
    ["deeper-night"] = colors.yellow,
  }

  local lualine = {}

  lualine.normal = {
    a = { fg = colors.black, bg = normal[flavor] },
    b = { fg = normal[flavor], bg = navy },
    c = { fg = colors.fg, bg = options.transparent and "NONE" or colors.black },
  }

  lualine.insert = {
    a = { fg = colors.black, bg = insert[flavor] },
    b = { fg = insert[flavor], bg = navy },
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
    a = { bg = visual[flavor], fg = colors.black },
    b = { bg = navy, fg = visual[flavor] },
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
