--- https://github.com/nvim-telescope/telescope.nvim

local M = {}

---@param ctx NightfallCtx
---@param opts table Integration options. `style` is `"bordered"` or `"borderless"`.
---@return table<string,table>
function M.get(ctx, opts)
  local c, accent = ctx.c, ctx.accent
  local sunken = ctx.solid(c.bg_dim)

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
      TelescopePromptNormal = { fg = c.fg, bg = ctx.solid(c.surface) },
      TelescopePromptBorder = { fg = c.surface, bg = ctx.solid(c.surface) },
      TelescopePromptTitle = { fg = c.black, bg = accent, bold = true },
      TelescopeResultsTitle = { fg = c.black, bg = c.teal, bold = true },
      TelescopePreviewTitle = { fg = c.black, bg = c.green, bold = true },
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
