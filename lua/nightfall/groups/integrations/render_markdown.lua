--- https://github.com/MeanderingProgrammer/render-markdown.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c = ctx.c

  return {
    RenderMarkdownH1Bg = { bg = ctx.darken(c.green, 0.3) },
    RenderMarkdownH2Bg = { bg = ctx.darken(c.pink, 0.3) },
    RenderMarkdownH3Bg = { bg = ctx.darken(c.gold, 0.3) },
    RenderMarkdownH4Bg = { bg = ctx.darken(c.lime, 0.3) },
    RenderMarkdownH5Bg = { bg = ctx.darken(c.blue, 0.3) },
    RenderMarkdownH6Bg = { bg = ctx.darken(c.cream, 0.3) },
    RenderMarkdownCode = { bg = ctx.darken(c.silver, 0.05, c.navy) },
  }
end

return M
