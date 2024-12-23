local M = {}

---@param colors NightfallPalette
---@param options table<"transparent"|"dim_inactive", boolean>
---@return table
function M.get(colors, options)
  local utils = require("nightfall.utils.colors")
  local accent = utils.vary_color({
    nightfall = colors.lavender,
    ["deeper-night"] = colors.blue,
    maron = colors.sand,
    ["white-night"] = colors.sky,
  }, colors.lime)

  -- See `:h highlight-groups`
  return {
    ColorColumn = { bg = colors.black },
    Conceal = { fg = colors.gray },
    CurSearch = { fg = colors.black, bg = colors.lavender },
    Cursor = { fg = colors.bg, bg = colors.fg },
    lCursor = { fg = colors.bg, bg = colors.fg },
    CursorColumn = { bg = colors.navy },
    CursorLine = { bg = colors.navy },
    Directory = { fg = accent },
    DiffAdd = { bg = utils.darken(colors.green, 0.3) },
    DiffChange = { bg = utils.darken(colors.blue, 0.3) },
    DiffDelete = { bg = utils.darken(colors.red, 0.35) },
    DiffText = { bg = utils.darken(colors.blue, 0.3) },
    EndOfBuffer = { fg = colors.charcoal },
    TermCursor = { fg = colors.bg, bg = colors.fg },
    ErrorMsg = { fg = colors.red, bold = true, italic = true },
    WinSeparator = { fg = colors.charcoal },
    Folded = { fg = accent, bg = colors.navy },
  }
end

return M
