--- https://github.com/ibhagwan/fzf-lua

local M = {}

---@param ctx NightfallCtx
---@param opts table Integration options. `style` is `"bordered"` or `"borderless"`.
---@return table<string,table>
function M.get(ctx, opts)
  local c, accent = ctx.c, ctx.accent
  local sunken = ctx.solid(c.bg_dim)

  local styles = {
    bordered = {
      FzfLuaNormal = { link = "NormalFloat" },
      FzfLuaBorder = { link = "FloatBorder" },
      FzfLuaTitle = { fg = accent, bold = true },
      FzfLuaPreviewNormal = { link = "NormalFloat" },
      FzfLuaPreviewBorder = { link = "FloatBorder" },
      FzfLuaPreviewTitle = { fg = c.green, bold = true },
    },
    borderless = {
      FzfLuaNormal = { fg = c.fg, bg = sunken },
      FzfLuaBorder = { fg = sunken, bg = sunken },
      FzfLuaTitle = { fg = c.black, bg = accent, bold = true },
      FzfLuaPreviewNormal = { fg = c.fg, bg = sunken },
      FzfLuaPreviewBorder = { fg = sunken, bg = sunken },
      FzfLuaPreviewTitle = { fg = c.black, bg = c.green, bold = true },
    },
  }

  local style = styles[opts.style or "bordered"]
  if not style then
    error(string.format("nightfall: unknown fzf style %q, expected 'bordered' or 'borderless'", opts.style), 0)
  end

  return vim.tbl_extend("error", {
    -- The picker window
    FzfLuaCursor = { fg = c.bg, bg = c.fg },
    FzfLuaCursorLine = { bg = c.overlay },
    FzfLuaCursorLineNr = { fg = accent, bg = c.overlay, bold = true },
    FzfLuaSearch = { fg = c.black, bg = c.gold, bold = true },
    FzfLuaScrollBorderEmpty = { fg = c.border },
    FzfLuaScrollBorderFull = { fg = accent },
    FzfLuaScrollFloatEmpty = { bg = c.bg_alt },
    FzfLuaScrollFloatFull = { bg = c.border },

    -- Entries
    FzfLuaHeaderBind = { fg = c.rose },
    FzfLuaHeaderText = { fg = c.cyan },
    FzfLuaPathColNr = { fg = c.gray },
    FzfLuaPathLineNr = { fg = c.gray },
    FzfLuaDirPart = { fg = c.gray },
    FzfLuaFilePart = { fg = c.fg },
    FzfLuaBufName = { fg = c.fg },
    FzfLuaBufNr = { fg = c.gray },
    FzfLuaBufFlagCur = { fg = accent, bold = true },
    FzfLuaBufFlagAlt = { fg = c.teal },
    FzfLuaTabTitle = { fg = accent, bold = true },
    FzfLuaTabMarker = { fg = c.gold, bold = true },
    FzfLuaLiveSym = { fg = c.blue },

    -- The fzf process itself
    FzfLuaFzfNormal = { fg = c.fg },
    FzfLuaFzfMatch = { fg = accent, bold = true },
    FzfLuaFzfPointer = { fg = accent },
    FzfLuaFzfMarker = { fg = c.gold },
    FzfLuaFzfPrompt = { fg = accent },
    FzfLuaFzfInfo = { fg = c.gray },
    FzfLuaFzfCursorLine = { bg = c.overlay },
    FzfLuaFzfHeader = { fg = c.sky },
    FzfLuaFzfGutter = { bg = ctx.solid(c.bg_dim) },
    FzfLuaFzfSeparator = { fg = c.border },
    FzfLuaFzfScrollbar = { fg = c.border },
  }, style)
end

return M
