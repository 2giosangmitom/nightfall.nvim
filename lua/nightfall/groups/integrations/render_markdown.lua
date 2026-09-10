--- https://github.com/MeanderingProgrammer/render-markdown.nvim

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, role = ctx.c, ctx.role

  --- Colors for the six heading levels, matching `@markup.heading.N`.
  local headings = { role("heading"), c.pink, c.gold, c.lime, c.blue, c.cream }

  local result = {
    RenderMarkdownCode = { bg = ctx.solid(c.bg_alt) },
    RenderMarkdownCodeInline = { fg = role("raw"), bg = c.surface },
    RenderMarkdownCodeBorder = { fg = c.border, bg = ctx.solid(c.bg_alt) },
    RenderMarkdownBullet = { fg = ctx.accent },
    RenderMarkdownDash = { fg = c.border },
    RenderMarkdownQuote = { fg = c.gray },
    RenderMarkdownIndent = { fg = c.border },
    RenderMarkdownSign = { fg = c.border },
    RenderMarkdownMath = { fg = role("number"), italic = true },
    RenderMarkdownLink = { fg = role("link"), underline = true },
    RenderMarkdownWikiLink = { fg = role("link"), underline = true },
    RenderMarkdownHtmlComment = { link = "Comment" },
    RenderMarkdownInlineHighlight = { fg = c.black, bg = c.gold },

    RenderMarkdownTableHead = { fg = ctx.accent, bold = true },
    RenderMarkdownTableRow = { fg = c.gray },
    RenderMarkdownTableFill = { fg = c.border },

    RenderMarkdownUnchecked = { fg = c.subtle },
    RenderMarkdownChecked = { fg = c.green },
    RenderMarkdownTodo = { fg = c.gold, bold = true },

    RenderMarkdownSuccess = { fg = c.green },
    RenderMarkdownInfo = { fg = c.sky },
    RenderMarkdownHint = { fg = c.cyan },
    RenderMarkdownWarn = { fg = c.yellow },
    RenderMarkdownError = { fg = c.red },
  }

  for level, fg in ipairs(headings) do
    result["RenderMarkdownH" .. level] = { fg = fg, bold = true }
    result["RenderMarkdownH" .. level .. "Bg"] = { fg = fg, bg = ctx.blend(fg, c.bg, 0.14), bold = true }
  end

  return result
end

return M
