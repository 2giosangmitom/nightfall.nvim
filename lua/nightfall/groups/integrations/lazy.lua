--- https://github.com/folke/lazy.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return {
    LazyCommit = { fg = c.white },
    LazyCommitType = { fg = c.yellow },
    LazyDir = { fg = c.peach },
    LazyH1 = {
      fg = c.black,
      bg = ctx.vary({ nightfall = c.purple, maron = c.yellow }, c.sky),
    },
    LazyH2 = { fg = c.fg, bold = true },
    LazyInfo = { fg = c.cyan, bg = ctx.darken(c.cyan, 1, c.cyan) },
    LazyUrl = { fg = c.sky, undercurl = true },
    LazyReasonCmd = { fg = c.cream },
    LazyReasonEvent = { fg = c.yellow },
    LazyReasonFt = { fg = c.green },
    LazyReasonImport = { fg = ctx.vary({ maron = c.sky }, c.blue) },
    LazyReasonStart = { fg = c.pink },
    LazySpecial = { fg = c.lavender },
    LazyLocal = { fg = ctx.vary({ maron = c.red }, c.pink) },
    LazyReasonKeys = { fg = ctx.vary({ maron = c.sky }, c.blue) },
  }
end

return M
