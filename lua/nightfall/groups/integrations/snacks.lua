--- https://github.com/folke/snacks.nvim
---
--- Snacks bundles many pickers and widgets, so each one has its own switch
--- under `integrations.snacks`.

local M = {}

---@param ctx NightfallCtx
---@param opts table Integration options: `dashboard`, `indent`, `picker`.
---@return table<string,table>
function M.get(ctx, opts)
  local c = ctx.c
  local result = {}

  if opts.dashboard then
    result = vim.tbl_extend("error", result, {
      SnacksDashboardDesc = { fg = c.fg },
      SnacksDashboardHeader = {
        fg = ctx.vary({ ["deeper-night"] = c.blue, maron = c.peach }, c.lavender),
      },
      SnacksDashboardKey = {
        fg = ctx.vary({ ["deeper-night"] = c.pink, maron = c.cyan }, c.yellow),
      },
      SnacksDashboardSpecial = { fg = c.gold },
    })
  end

  if opts.indent then result = vim.tbl_extend("error", result, { SnacksIndent = { fg = c.charcoal } }) end

  if opts.picker then result = vim.tbl_extend("error", result, { SnacksPickerTree = { fg = c.charcoal } }) end

  return result
end

return M
