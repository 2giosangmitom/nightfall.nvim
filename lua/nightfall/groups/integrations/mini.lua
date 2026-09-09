--- https://github.com/nvim-mini/mini.nvim
---
--- Each mini.nvim module has its own switch under `integrations.mini`, so a
--- user running only part of the family gets only the highlights they need.

local M = {}

---@param ctx NightfallCtx
---@param opts table Integration options: `icons`, `trailspace`, `indentscope`.
---@return table<string,table>
function M.get(ctx, opts)
  local c = ctx.c
  local result = {}

  if opts.icons then
    result = vim.tbl_extend("error", result, {
      MiniIconsAzure = { fg = c.sky },
      MiniIconsBlue = { fg = c.blue },
      MiniIconsCyan = { fg = c.cyan },
      MiniIconsGreen = { fg = c.green },
      MiniIconsGrey = { fg = c.gray },
      MiniIconsOrange = { fg = c.orange },
      MiniIconsPurple = { fg = c.purple },
      MiniIconsRed = { fg = c.coral },
      MiniIconsYellow = { fg = c.yellow },
    })
  end

  if opts.trailspace then result = vim.tbl_extend("error", result, { MiniTrailspace = { bg = c.purple } }) end

  if opts.indentscope then result = vim.tbl_extend("error", result, { MiniIndentscopeSymbol = { fg = c.pink } }) end

  return result
end

return M
