--- Neovim's built-in diagnostics and LSP semantic tokens.
---
--- See `:h diagnostic-highlights` and `:h lsp-semantic-highlight`.

local M = {}

---@param ctx NightfallCtx
---@param opts table Integration options: `semantic_tokens`.
---@return table<string,table>
function M.get(ctx, opts)
  local c = ctx.c

  -- Info is the only severity whose color varies between flavors.
  local info = ctx.vary({ ["deeper-night"] = c.sky }, c.purple)

  --- Diagnostic virtual text sits on a tinted version of the editor background.
  ---@param fg string
  ---@return table
  local function virtual_text(fg) return { fg = fg, bg = ctx.darken(c.navy, 0.9, fg), style = { italic = true } } end

  local result = {
    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.yellow },
    DiagnosticInfo = { fg = info },
    DiagnosticHint = { fg = c.cyan },
    DiagnosticOk = { fg = c.green },

    DiagnosticVirtualTextError = virtual_text(c.red),
    DiagnosticVirtualTextWarn = virtual_text(c.yellow),
    DiagnosticVirtualTextInfo = virtual_text(info),
    DiagnosticVirtualTextHint = virtual_text(c.cyan),
    DiagnosticVirtualTextOk = virtual_text(c.green),

    DiagnosticUnderlineError = { sp = c.red, style = { undercurl = true } },
    DiagnosticUnderlineWarn = { sp = c.yellow, style = { undercurl = true } },
    DiagnosticUnderlineInfo = { sp = info, style = { undercurl = true } },
    DiagnosticUnderlineHint = { sp = c.cyan, style = { undercurl = true } },
    DiagnosticUnderlineOk = { sp = c.green, style = { undercurl = true } },
  }

  if opts.semantic_tokens then
    result = vim.tbl_extend("error", result, {
      ["@lsp.type.class"] = { fg = c.magenta },
      ["@lsp.type.macro"] = { link = "PreProc" },
      -- Left empty on purpose so treesitter keeps styling plain variables.
      ["@lsp.type.variable"] = {},
    })
  end

  return result
end

return M
