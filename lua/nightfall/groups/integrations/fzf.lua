local M = {}

---@param colors NightfallPalette
---@param opts table
function M.get(colors, opts)
  local fzf_style = opts.style or "bordered"
  local utils = require("nightfall.utils.colors")

  local res = {
    FzfLuaFzfMatch = { fg = colors.purple },
    FzfLuaFzfHeader = { fg = colors.sky },
    FzfLuaHeaderText = { fg = colors.cyan },
    FzfLuaHeaderBind = { fg = colors.rose },
    FzfLuaLiveSym = { fg = colors.blue },
  }

  local style = {
    bordered = {
      FzfLuaNormal = { link = "NormalFloat" },
      FzfLuaBorder = { link = "FloatBorder" },
      FzfLuaTitle = { fg = colors.peach },
    },
    borderless = {
      FzfLuaBorder = {
        fg = utils.darken(colors.bg, 0.9),
        bg = utils.darken(colors.bg, 0.9),
      },
      FzfLuaNormal = { bg = utils.darken(colors.bg, 0.9) },
      FzfLuaTitle = { fg = colors.black, bg = colors.pink },
    },
  }

  res = vim.tbl_deep_extend("force", res, style[fzf_style])

  return res
end

return M
