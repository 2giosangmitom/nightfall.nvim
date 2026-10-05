--- https://github.com/MeanderingProgrammer/render-markdown.nvim

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local accent = palette.accent(c, flavor)
  local code_bg = U.background(c.bg_alt, o.transparent)
  local link = flavor == "winter" and c.blue or c.cyan

  --- Colors for the six heading levels, matching `@markup.heading.N`.
  local headings = { flavor == "winter" and c.teal or c.green, c.pink, c.gold, c.lime, c.blue, c.cream }

  local result = {
    RenderMarkdownCode = { bg = code_bg },
    RenderMarkdownCodeInline = { fg = flavor == "winter" and c.green or c.cream, bg = c.surface },
    RenderMarkdownCodeBorder = { fg = c.border, bg = code_bg },
    RenderMarkdownBullet = { fg = accent },
    RenderMarkdownDash = { fg = c.border },
    RenderMarkdownQuote = { fg = c.gray },
    RenderMarkdownIndent = { fg = c.border },
    RenderMarkdownSign = { fg = c.border },
    RenderMarkdownMath = {
      fg = flavor == "nightfall" and c.lavender or flavor == "winter" and c.orange or c.teal,
      italic = true,
    },
    RenderMarkdownLink = { fg = link, underline = true },
    RenderMarkdownWikiLink = { fg = link, underline = true },
    RenderMarkdownHtmlComment = { link = "Comment" },
    RenderMarkdownInlineHighlight = { fg = palette.on_accent(c, flavor), bg = c.gold },

    RenderMarkdownTableHead = { fg = accent, bold = true },
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
    result["RenderMarkdownH" .. level .. "Bg"] = { fg = fg, bg = U.blend(fg, c.bg, 0.14), bold = true }
  end

  return result
end

return M
