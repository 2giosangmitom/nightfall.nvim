--- Neovim's built-in diagnostics and LSP support.
local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local opts = o.integrations.native_lsp
  local result = vim.tbl_extend(
    "error",
    require("nightfall.groups.integrations.native_lsp.diagnostics").get(c, flavor),
    require("nightfall.groups.integrations.native_lsp.references").get(c, flavor)
  )

  if opts.semantic_tokens then
    result = vim.tbl_extend(
      "error",
      result,
      require("nightfall.groups.integrations.native_lsp.semantic_tokens").get(c, flavor)
    )
  end
  return result
end

return M
