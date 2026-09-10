--- Neovim's built-in diagnostics and LSP support.
---
--- Covers `:h diagnostic-highlights`, including the virtual line groups added
--- in Neovim 0.11, the reference, inlay hint and code lens groups, and
--- `:h lsp-semantic-highlight`.

local M = {}

--- The five diagnostic severities, in the order Neovim lists them.
---@private
local SEVERITIES = { "Error", "Warn", "Info", "Hint", "Ok" }

---@param ctx NightfallCtx
---@param opts table Integration options: `semantic_tokens`.
---@return table<string,table>
function M.get(ctx, opts)
  local c = ctx.c

  --- The color of each severity.
  local severity = {
    Error = c.red,
    Warn = c.yellow,
    Info = ctx.vary({ maron = c.purple }, c.sky),
    Hint = c.cyan,
    Ok = c.green,
  }

  local result = {
    -- Reference highlighting under the cursor
    LspReferenceText = { bg = c.overlay },
    LspReferenceRead = { bg = c.overlay },
    LspReferenceWrite = { bg = c.overlay, underline = true },
    LspReferenceTarget = { bg = c.overlay },

    -- Inline annotations the server contributes
    LspInlayHint = { fg = c.subtle, bg = ctx.blend(c.subtle, c.bg, 0.12), italic = true },
    LspCodeLens = { fg = c.gray, italic = true },
    LspCodeLensSeparator = { fg = c.border },
    LspSignatureActiveParameter = { fg = ctx.accent, bg = ctx.blend(ctx.accent, c.bg, 0.16), bold = true },
    LspInfoBorder = { link = "FloatBorder" },

    -- Severity-independent diagnostic decorations
    DiagnosticDeprecated = { sp = c.gray, strikethrough = true },
    DiagnosticUnnecessary = { fg = c.subtle, italic = true },
  }

  for _, name in ipairs(SEVERITIES) do
    local fg = severity[name]
    local wash = ctx.blend(fg, c.bg, 0.14)

    result["Diagnostic" .. name] = { fg = fg }
    result["DiagnosticSign" .. name] = { fg = fg }
    result["DiagnosticFloating" .. name] = { fg = fg }
    result["DiagnosticVirtualText" .. name] = { fg = fg, bg = wash, style = { italic = true } }
    result["DiagnosticVirtualLines" .. name] = { fg = fg, bg = wash }
    result["DiagnosticUnderline" .. name] = { sp = fg, style = { undercurl = true } }
  end

  if opts.semantic_tokens then
    result = vim.tbl_extend("error", result, {
      -- Left empty on purpose so treesitter keeps styling plain variables and
      -- their more specific captures, which the server does not distinguish.
      ["@lsp.type.variable"] = {},

      ["@lsp.type.decorator"] = { fg = ctx.role("attribute") },
      ["@lsp.type.enumMember"] = { fg = ctx.role("constant") },
      ["@lsp.type.modifier"] = { fg = ctx.role("storage") },
      ["@lsp.type.typeParameter"] = { fg = ctx.role("type_builtin") },
      ["@lsp.typemod.function.defaultLibrary"] = { fg = ctx.role("func_builtin") },
      ["@lsp.typemod.variable.defaultLibrary"] = { fg = ctx.role("variable_builtin") },
      ["@lsp.mod.deprecated"] = { sp = c.gray, strikethrough = true },
    })
  end

  return result
end

return M
