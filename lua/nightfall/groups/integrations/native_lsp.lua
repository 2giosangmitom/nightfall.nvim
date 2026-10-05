--- Neovim's built-in diagnostics and LSP support.
---
--- Covers `:h diagnostic-highlights`, including the virtual line groups added
--- in Neovim 0.11, the reference, inlay hint and code lens groups, and
--- `:h lsp-semantic-highlight`.

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

--- The five diagnostic severities, in the order Neovim lists them.
---@private
local SEVERITIES = { "Error", "Warn", "Info", "Hint", "Ok" }

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local opts = o.integrations.native_lsp
  local accent = palette.accent(c, flavor)

  --- The color of each severity.
  local severity = {
    Error = c.red,
    Warn = c.yellow,
    Info = flavor == "maron" and c.purple or c.sky,
    Hint = c.cyan,
    Ok = c.green,
  }

  local result = {
    -- Reference highlighting under the cursor
    LspReferenceText = { bg = c.overlay },
    LspReferenceRead = { bg = c.overlay },
    LspReferenceWrite = { bg = c.overlay },
    LspReferenceTarget = { bg = c.overlay },

    -- Inline annotations the server contributes
    LspInlayHint = { fg = c.subtle, bg = U.blend(c.subtle, c.bg, 0.12), italic = true },
    LspCodeLens = { fg = c.gray, italic = true },
    LspCodeLensSeparator = { fg = c.border },
    LspSignatureActiveParameter = { fg = accent, bg = U.blend(accent, c.bg, 0.16), bold = true },
    LspInfoBorder = { link = "FloatBorder" },

    -- Severity-independent diagnostic decorations
    DiagnosticDeprecated = { sp = c.gray, strikethrough = true },
    DiagnosticUnnecessary = { fg = c.subtle, italic = true },
  }

  for _, name in ipairs(SEVERITIES) do
    local fg = severity[name]
    local wash = U.blend(fg, c.bg, 0.14)

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

      ["@lsp.type.decorator"] = { fg = c.magenta },
      ["@lsp.type.enumMember"] = {
        fg = flavor == "deeper-night" and c.cream or flavor == "maron" and c.coral or c.purple,
      },
      ["@lsp.type.modifier"] = { fg = flavor == "winter" and c.purple or c.cyan },
      ["@lsp.type.typeParameter"] = { fg = (flavor == "deeper-night" or flavor == "maron") and c.cyan or c.sky },
      ["@lsp.typemod.function.defaultLibrary"] = {
        fg = (flavor == "deeper-night" or flavor == "maron") and c.cream or c.cyan,
      },
      ["@lsp.typemod.variable.defaultLibrary"] = {
        fg = flavor == "nightfall" and c.pink or flavor == "winter" and c.rose or c.peach,
      },
      ["@lsp.mod.deprecated"] = { sp = c.gray, strikethrough = true },
    })
  end

  return result
end

return M
