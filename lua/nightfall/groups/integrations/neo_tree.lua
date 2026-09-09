--- https://github.com/nvim-neo-tree/neo-tree.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return {
    NeoTreeFloatTitle = { link = "FloatTitle" },
    NeoTreeFloatBorder = { link = "FloatBorder" },
    NeoTreeDimText = { link = "Comment" },
    NeoTreeIndentMarker = { fg = c.charcoal },
    NeoTreeTitleBar = {
      fg = c.black,
      bg = ctx.vary({ nightfall = c.purple, ["deeper-night"] = c.sky }, c.peach),
    },
  }
end

return M
