local M = {}

---@param colors NightfallPalette
---@param opts table
function M.get(colors, opts)
  local telescope_style = opts.style or "bordered"
  local utils = require("nightfall.utils.colors")

  local res = {
    TelescopeMatching = { fg = colors.purple },
    TelescopePromptPrefix = { fg = colors.sky },
  }

  local style = {
    bordered = {
      TelescopeNormal = { link = "NormalFloat" },
      TelescopePromptBorder = { fg = colors.yellow },
      TelescopePromptTitle = { fg = colors.peach },
      TelescopeBorder = { link = "FloatBorder" },
    },
    borderless = {
      TelescopeBorder = {
        fg = utils.darken(colors.bg, 0.9),
        bg = utils.darken(colors.bg, 0.9),
      },
      TelescopePromptNormal = { bg = utils.darken(colors.bg, 0.9) },
      TelescopeNormal = { fg = colors.fg, bg = utils.darken(colors.bg, 0.9) },
      TelescopePromptTitle = { fg = colors.black, bg = colors.pink },
      TelescopePreviewTitle = { fg = colors.black, bg = colors.pink },
      TelescopePromptBorder = { fg = utils.darken(colors.bg, 0.9), bg = utils.darken(colors.bg, 0.9) },
      TelescopeResultsTitle = { fg = colors.black, bg = colors.pink },
    },
  }

  res = vim.tbl_deep_extend("force", res, style[telescope_style])

  return res
end

return M
