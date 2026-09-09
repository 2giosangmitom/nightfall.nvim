--- https://github.com/nvim-telescope/telescope.nvim

local M = {}

---@param ctx NightfallCtx
---@param opts table Integration options. `style` is `"bordered"` or `"borderless"`.
---@return table<string,table>
function M.get(ctx, opts)
  local c = ctx.c
  local sunken = ctx.darken(c.bg, 0.9)

  local styles = {
    bordered = {
      TelescopeNormal = { link = "NormalFloat" },
      TelescopeBorder = { link = "FloatBorder" },
      TelescopePromptBorder = { fg = c.yellow },
      TelescopePromptTitle = { fg = c.peach },
    },
    borderless = {
      TelescopeNormal = { fg = c.fg, bg = sunken },
      TelescopeBorder = { fg = sunken, bg = sunken },
      TelescopePromptNormal = { bg = sunken },
      TelescopePromptBorder = { fg = sunken, bg = sunken },
      TelescopePromptTitle = { fg = c.black, bg = c.pink },
      TelescopePreviewTitle = { fg = c.black, bg = c.pink },
      TelescopeResultsTitle = { fg = c.black, bg = c.pink },
    },
  }

  local style = styles[opts.style or "bordered"]
  if not style then
    error(string.format("nightfall: unknown telescope style %q, expected 'bordered' or 'borderless'", opts.style), 0)
  end

  return vim.tbl_extend("error", {
    TelescopeMatching = { fg = c.purple },
    TelescopePromptPrefix = { fg = c.sky },
  }, style)
end

return M
