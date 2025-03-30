local M = {}

---@param colors NightfallPalette
---@param opts table
function M.get(colors, opts)
  local utils = require("nightfall.utils.colors")

  local highlights = {
    -- Diagnostic colors
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = utils.vary_color({ ["deeper-night"] = colors.sky }, colors.purple) },
    DiagnosticHint = { fg = colors.cyan },
    DiagnosticOk = { fg = colors.green },

    -- Diagnostic virtual text colors
    DiagnosticVirtualTextError = {
      fg = colors.red,
      bg = utils.darken(colors.navy, 0.9, colors.red),
      style = { italic = true },
    },
    DiagnosticVirtualTextWarn = {
      fg = colors.yellow,
      bg = utils.darken(colors.navy, 0.9, colors.yellow),
      style = { italic = true },
    },
    DiagnosticVirtualTextInfo = {
      fg = utils.vary_color({ ["deeper-night"] = colors.sky }, colors.purple),
      bg = utils.vary_color(
        { ["deeper-night"] = utils.darken(colors.navy, 0.9, colors.sky) },
        utils.darken(colors.navy, 0.9, colors.purple)
      ),
      style = { italic = true },
    },
    DiagnosticVirtualTextHint = {
      fg = colors.cyan,
      bg = utils.darken(colors.navy, 0.9, colors.cyan),
      style = { italic = true },
    },
    DiagnosticVirtualTextOk = {
      fg = colors.green,
      bg = utils.darken(colors.navy, 0.9, colors.green),
      style = { italic = true },
    },

    -- Diagnostic Underline Colors
    DiagnosticUnderlineError = { sp = colors.red, style = { undercurl = true } },
    DiagnosticUnderlineWarn = { sp = colors.yellow, style = { undercurl = true } },
    DiagnosticUnderlineInfo = {
      sp = utils.vary_color({ ["deeper-night"] = colors.sky }, colors.purple),
      style = { undercurl = true },
    },
    DiagnosticUnderlineHint = { sp = colors.cyan, style = { undercurl = true } },
    DiagnosticUnderlineOk = { sp = colors.green, style = { undercurl = true } },
  }

  if opts.semantic_tokens or false then
    highlights = vim.tbl_deep_extend(
      "error",
      highlights,
      require("nightfall.groups.integrations.native_lsp.semantic_tokens").get(colors)
    )
  end

  return highlights
end

return M
