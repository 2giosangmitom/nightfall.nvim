--- Semantic token highlights. See `:h lsp-semantic-highlight`.
local M = {}

---@param c NightfallPalette
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, flavor)
  return {
    -- Leave plain variables to treesitter's more specific captures.
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
  }
end

return M
