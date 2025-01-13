local M = {}

---@param colors NightfallPalette
function M.get(colors)
  return {
    ["@lsp.type.class"] = { fg = colors.magenta },
    ["@lsp.type.macro"] = { link = "Preproc" },
  }
end

return M
