--- Treesitter capture groups. See `:h treesitter-highlight-groups`.
---
--- Captures that map cleanly onto a legacy syntax group are linked rather than
--- colored, so a `highlight_overrides` entry on the legacy group carries over.

local M = {}

---@param ctx NightfallCtx
---@param opts table Integration options: `context` for nvim-treesitter-context.
---@return table<string,table>
function M.get(ctx, opts)
  local c, styles = ctx.c, ctx.styles

  local result = {
    -- Variables
    ["@variable"] = { link = "Identifier" },
    ["@variable.builtin"] = { fg = c.peach, style = styles.variables },
    ["@variable.parameter"] = { fg = c.latte, style = styles.parameters },
    ["@variable.parameter.builtin"] = { fg = c.pink, style = styles.parameters },
    ["@variable.member"] = {
      fg = ctx.vary({ maron = c.sand }, c.lavender),
      style = styles.properties,
    },

    -- Constants
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { fg = c.pink, style = styles.constants },

    -- Modules and namespaces
    ["@module"] = { fg = c.cream },
    ["@module.builtin"] = { fg = c.cyan },
    ["@label"] = { fg = c.coral },

    -- Strings and characters
    ["@string.documentation"] = { fg = c.orange },
    ["@string.regexp"] = { fg = c.blue },
    ["@string.escape"] = { fg = c.blue },
    ["@string.special"] = { fg = c.cream },
    ["@string.special.url"] = { fg = c.cyan },
    ["@character.special"] = { fg = c.coral },

    -- Attributes and annotations
    ["@attribute"] = { fg = c.magenta },
    ["@attribute.builtin"] = { fg = c.blue },

    -- Properties
    ["@property"] = { fg = ctx.vary({ maron = c.peach }, c.lavender) },

    -- Functions
    ["@function.builtin"] = { fg = c.cream },
    ["@function.macro"] = { link = "PreProc" },
    ["@constructor"] = { fg = c.cyan },

    -- Operators
    ["@operator"] = { fg = c.yellow },

    -- Keywords
    ["@keyword.coroutine"] = { fg = c.cream, style = styles.coroutines },
    ["@keyword.operator"] = { fg = c.yellow, style = styles.keywords },
    ["@keyword.import"] = { fg = c.cyan },
    ["@keyword.debug"] = { fg = c.purple },
    ["@keyword.exception"] = { fg = c.blue, style = styles.exceptions },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@keyword.conditional.ternary"] = { link = "Operator" },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.type"] = { link = "Type" },

    -- Comments
    ["@comment.error"] = { fg = c.black, bg = c.red },
    ["@comment.warning"] = { fg = c.black, bg = c.yellow },
    ["@comment.todo"] = { fg = c.black, bg = c.cyan },
    ["@comment.note"] = { fg = c.black, bg = c.cyan },

    -- Markup
    ["@markup.heading"] = { fg = c.green, bold = true },
    ["@markup.heading.1"] = { fg = c.green, bold = true },
    ["@markup.heading.2"] = { fg = c.pink, bold = true },
    ["@markup.heading.3"] = { fg = c.gold, bold = true },
    ["@markup.heading.4"] = { fg = c.lime, bold = true },
    ["@markup.heading.5"] = { fg = c.blue, bold = true },
    ["@markup.heading.6"] = { fg = c.cream, bold = true },
    ["@markup.quote"] = { fg = ctx.darken(c.blue, 0.8, c.charcoal) },
    ["@markup.math"] = { fg = c.purple },
    ["@markup.link"] = { fg = c.cyan },
    ["@markup.raw"] = { fg = c.cream },

    -- Markup languages such as HTML and Vue
    ["@tag"] = { fg = c.magenta },
    ["@tag.attribute"] = { fg = c.cyan, italic = true },
    ["@tag.builtin"] = { fg = c.purple },
    ["@tag.delimiter"] = { fg = c.cyan },
  }

  if opts.context then
    result = vim.tbl_extend("error", result, {
      TreesitterContext = { bg = ctx.o.transparent and "NONE" or ctx.lighten(c.navy, 0.9) },
      TreesitterContextBottom = {
        sp = ctx.darken(c.silver, 0.5),
        underline = ctx.o.transparent,
      },
      TreesitterContextLineNumber = { fg = c.cream },
    })
  end

  return result
end

return M
