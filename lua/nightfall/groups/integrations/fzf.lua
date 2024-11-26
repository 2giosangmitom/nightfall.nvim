--- To enable `fzf-lua` support, add the following to your Nightfall
--- integrations config, choosing between two styles: 'borderless' and
--- 'bordered'.
--- >lua
---   fzf = { enabled = true, style = "borderless" }
--- <
---@tag nightfall.nvim_fzf
local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  local utils = require("nightfall.utils")
  local bg = utils.darken(colors.background, 0.8)
  local Options = require("nightfall").Options
  local fzf = Options.integrations.fzf or {}
  local fzf_style = fzf.style or "borderless"

  local result = {
    FzfLuaNormal = { bg = bg },
    FzfLuaHeaderBind = { fg = colors.pale_yellow },
    FzfLuaHeaderText = { fg = colors.sand },
    FzfLuaPathColNr = { fg = utils.vary_color({ deepernight = colors.light_cyan, maron = colors.sand }, colors.pink) },
    FzfLuaPathLineNr = { fg = utils.vary_color({ deepernight = colors.pink, maron = colors.peach }, colors.nord_blue) },
    FzfLuaBufName = { fg = colors.foreground },
    FzfLuaBufNr = { fg = colors.pale_yellow },
    FzfLuaBufFlagCur = { fg = colors.peach },
    FzfLuaBufFlagAlt = { fg = colors.lavender },
    FzfLuaTabTitle = { fg = colors.sky },
    FzfLuaTabMarker = { fg = colors.lavender },
    FzfLuaLiveSym = { fg = colors.peach },
    FzfLuaSearch = { fg = colors.peach },
  }

  local style = {
    borderless = {
      FzfLuaBorder = { fg = bg, bg = bg },
      FzfLuaTitle = { fg = colors.black, bg = colors.pink },
    },
    bordered = {
      FzfLuaBorder = {
        fg = utils.vary_color({ nightfall = colors.lavender, deepernight = colors.light_cyan }, colors.sand),
      },
      FzfLuaTitle = { fg = colors.foreground },
    },
  }

  result = vim.tbl_deep_extend("force", result, style[fzf_style])

  return result
end

return M
