--- https://github.com/nvim-telescope/telescope.nvim

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local opts = o.integrations.telescope
  local accent = palette.accent(c, flavor)
  local on_accent = palette.on_accent(c, flavor)
  local sunken = U.background(c.bg_dim, o.transparent)
  local prompt_bg = U.background(c.surface, o.transparent)

  local styles = {
    bordered = {
      TelescopeNormal = { link = "NormalFloat" },
      TelescopeBorder = { link = "FloatBorder" },
      TelescopePromptNormal = { link = "NormalFloat" },
      TelescopePromptBorder = { fg = accent, bg = sunken },
      TelescopePromptTitle = { fg = accent, bold = true },
      TelescopeResultsTitle = { fg = c.teal, bold = true },
      TelescopePreviewTitle = { fg = c.green, bold = true },
    },
    borderless = {
      TelescopeNormal = { fg = c.fg, bg = sunken },
      TelescopeBorder = { fg = sunken, bg = sunken },
      TelescopePromptNormal = { fg = c.fg, bg = prompt_bg },
      TelescopePromptBorder = { fg = c.surface, bg = prompt_bg },
      TelescopePromptTitle = { fg = on_accent, bg = accent, bold = true },
      TelescopeResultsTitle = { fg = on_accent, bg = c.teal, bold = true },
      TelescopePreviewTitle = { fg = on_accent, bg = c.green, bold = true },
    },
  }

  local style = styles[opts.style or "bordered"]
  if not style then
    error(string.format("nightfall: unknown telescope style %q, expected 'bordered' or 'borderless'", opts.style), 0)
  end

  return vim.tbl_extend("error", {
    TelescopeMatching = { fg = accent, bold = true },
    TelescopeSelection = { fg = c.latte, bg = c.overlay, bold = true },
    TelescopeSelectionCaret = { fg = accent, bg = c.overlay },
    TelescopeMultiSelection = { fg = c.teal, bg = c.overlay },
    TelescopeMultiIcon = { fg = c.teal },
    TelescopePromptPrefix = { fg = accent },
    TelescopePromptCounter = { fg = c.gray },
    TelescopeResultsComment = { link = "Comment" },
    TelescopeResultsDiffAdd = { fg = c.green },
    TelescopeResultsDiffChange = { fg = c.yellow },
    TelescopeResultsDiffDelete = { fg = c.red },
    TelescopeResultsDiffUntracked = { fg = c.gray },
    TelescopeTitle = { fg = accent, bold = true },
  }, style)
end

return M
