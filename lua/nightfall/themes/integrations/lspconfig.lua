local M = {}

---@param colors NightfallPalette
function M.get(colors)
  local utils = require("nightfall.utils")

  return {
    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
    ["@lsp.type.interface"] = { link = "Typedef" },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { link = "@error" },
    ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },
    ["@event"] = { fg = colors.light_cyan },
    ["@modifier"] = { fg = colors.lavender },
    ["@regexp"] = { fg = colors.pale_yellow },

    DiagnosticHint = {
      fg = colors.violet,
      bg = utils.darken(colors.dark_navy, 0.95, colors.violet),
      style = { italic = true },
    },
    DiagnosticError = {
      fg = colors.red,
      bg = utils.darken(colors.dark_navy, 0.95, colors.red),
      style = { italic = true },
    },
    DiagnosticWarn = {
      fg = colors.pale_yellow,
      bg = utils.darken(colors.dark_navy, 0.95, colors.pale_yellow),
      style = { italic = true },
    },
    DiagnosticInfo = {
      fg = colors.light_cyan,
      bg = utils.darken(colors.dark_navy, 0.95, colors.light_cyan),
      style = { italic = true },
    },

    DiagnosticFloatingError = { fg = colors.red }, -- Used to color "Error" diagnostic messages in diagnostics float
    DiagnosticFloatingWarn = { fg = colors.pale_yellow }, -- Used to color "Warn" diagnostic messages in diagnostics float
    DiagnosticFloatingInfo = { fg = colors.light_cyan }, -- Used to color "Info" diagnostic messages in diagnostics float
    DiagnosticFloatingHint = { fg = colors.violet }, -- Used to color "Hint" diagnostic messages in diagnostics float

    DiagnosticSignError = { fg = colors.red }, -- Used for "Error" signs in sign column
    DiagnosticSignWarn = { fg = colors.pale_yellow }, -- Used for "Warn" signs in sign column
    DiagnosticSignInfo = { fg = colors.light_cyan }, -- Used for "Info" signs in sign column
    DiagnosticSignHint = { fg = colors.violet }, -- Used for "Hint" signs in sign column

    LspReferenceText = { fg = colors.dark_navy, bg = colors.ghost_white },
    LspReferenceRead = { fg = colors.dark_navy, bg = colors.ghost_white },
    LspReferenceWrite = { fg = colors.dark_navy, bg = colors.ghost_white },
  }
end

return M
