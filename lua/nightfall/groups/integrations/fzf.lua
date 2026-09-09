--- https://github.com/ibhagwan/fzf-lua

local M = {}

---@param ctx NightfallCtx
---@param opts table Integration options. `style` is `"bordered"` or `"borderless"`.
---@return table<string,table>
function M.get(ctx, opts)
  local c = ctx.c
  local sunken = ctx.darken(c.bg, 0.9)

  local styles = {
    bordered = {
      FzfLuaNormal = { link = "NormalFloat" },
      FzfLuaBorder = { link = "FloatBorder" },
      FzfLuaTitle = { fg = c.peach },
    },
    borderless = {
      FzfLuaNormal = { bg = sunken },
      FzfLuaBorder = { fg = sunken, bg = sunken },
      FzfLuaTitle = { fg = c.black, bg = c.pink },
    },
  }

  local style = styles[opts.style or "bordered"]
  if not style then
    error(string.format("nightfall: unknown fzf style %q, expected 'bordered' or 'borderless'", opts.style), 0)
  end

  return vim.tbl_extend("error", {
    FzfLuaFzfMatch = { fg = c.purple },
    FzfLuaFzfHeader = { fg = c.sky },
    FzfLuaHeaderText = { fg = c.cyan },
    FzfLuaHeaderBind = { fg = c.rose },
    FzfLuaLiveSym = { fg = c.blue },
  }, style)
end

return M
