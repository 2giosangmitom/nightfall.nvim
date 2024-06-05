--- Enable `nvim-lspconfig` support by adding the following to your Nightfall
--- integration config:
--- >lua
---   lspconfig = { enabled = true }
--- <
---@tag nightfall.nvim_lspconfig

local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  local utils = require("nightfall.utils")

  return {
    -- LSP types
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
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@variable.member" },
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

    -- Events and Modifiers
    ["@event"] = { fg = colors.light_cyan },
    ["@modifier"] = { fg = colors.lavender },
    ["@regexp"] = { fg = colors.pale_yellow },

    -- Diagnostic Colors
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

    -- Floating Diagnostic Colors
    DiagnosticFloatingError = { fg = colors.red },
    DiagnosticFloatingWarn = { fg = colors.pale_yellow },
    DiagnosticFloatingInfo = { fg = colors.light_cyan },
    DiagnosticFloatingHint = { fg = colors.violet },

    -- Diagnostic Sign Colors
    DiagnosticSignError = { fg = colors.red },
    DiagnosticSignWarn = { fg = colors.pale_yellow },
    DiagnosticSignInfo = { fg = colors.light_cyan },
    DiagnosticSignHint = { fg = colors.violet },

    -- LSP Reference Colors
    LspReferenceText = { bg = colors.deep_navy },
    LspReferenceRead = { bg = colors.deep_navy },
    LspReferenceWrite = { bg = colors.deep_navy },
  }
end

return M
