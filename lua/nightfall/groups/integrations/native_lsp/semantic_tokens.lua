local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    ["@lsp.type.class"] = { fg = colors.magenta },
    ["@lsp.type.macro"] = { link = "Preproc" },
    ["@lsp.mod.abstract"] = { fg = colors.blue },
    ["@lsp.mod.static"] = { fg = colors.lime },
  }
end

return M
