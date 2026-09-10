--- Treesitter capture groups. See `:h treesitter-highlight-groups`.
---
--- Every capture Neovim documents is defined here. Captures that mean exactly
--- what a legacy syntax group means are linked rather than colored, so a
--- `highlight_overrides` entry on the legacy group carries over to them.

local M = {}

---@param ctx NightfallCtx
---@param opts table Integration options: `context` for nvim-treesitter-context.
---@return table<string,table>
function M.get(ctx, opts)
  local c, styles, role = ctx.c, ctx.styles, ctx.role

  --- Colors for the six markup heading levels.
  local headings = { role("heading"), c.pink, c.gold, c.lime, c.blue, c.cream }

  local result = {
    -- Variables
    ["@variable"] = { link = "Identifier" },
    ["@variable.builtin"] = { fg = role("variable_builtin"), style = styles.variables },
    ["@variable.parameter"] = { fg = role("parameter"), style = styles.parameters },
    ["@variable.parameter.builtin"] = { fg = c.pink, style = styles.parameters },
    ["@variable.member"] = { fg = role("member"), style = styles.properties },

    -- Constants
    ["@constant"] = { link = "Constant" },
    ["@boolean"] = { link = "Boolean" },
    ["@number"] = { link = "Number" },
    ["@number.float"] = { link = "Float" },
    ["@constant.builtin"] = { fg = role("constant_builtin"), style = styles.constants },
    ["@constant.macro"] = { link = "Macro" },

    -- Modules and namespaces
    ["@module"] = { fg = role("module") },
    ["@module.builtin"] = { fg = c.cyan },
    ["@label"] = { link = "Label" },

    -- Strings and characters
    ["@string"] = { link = "String" },
    ["@string.documentation"] = { fg = role("docstring"), style = styles.comments },
    ["@string.regexp"] = { fg = role("regexp") },
    ["@string.escape"] = { fg = role("escape") },
    ["@string.special"] = { fg = role("string_special") },
    ["@string.special.path"] = { fg = role("string_special"), underline = true },
    ["@string.special.symbol"] = { fg = role("constant") },
    ["@string.special.url"] = { fg = role("link"), underline = true },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "SpecialChar" },

    -- Types
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { fg = role("type_builtin"), style = styles.types },
    ["@type.definition"] = { link = "Typedef" },

    -- Attributes and annotations
    ["@attribute"] = { fg = role("attribute") },
    ["@attribute.builtin"] = { fg = role("attribute_builtin") },

    -- Properties
    ["@property"] = { fg = role("property"), style = styles.properties },

    -- Functions
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { fg = role("func_builtin"), style = styles.functions },
    ["@function.call"] = { link = "Function" },
    ["@function.macro"] = { link = "Macro" },
    ["@function.method"] = { link = "Function" },
    ["@function.method.call"] = { link = "Function" },
    ["@constructor"] = { fg = role("constructor") },

    -- Operators
    ["@operator"] = { link = "Operator" },

    -- Keywords
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.coroutine"] = { fg = role("coroutine"), style = styles.coroutines },
    ["@keyword.function"] = { link = "Keyword" },
    ["@keyword.operator"] = { fg = role("operator"), style = styles.keywords },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.type"] = { fg = role("storage") },
    ["@keyword.modifier"] = { fg = role("storage") },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.return"] = { fg = role("exception"), style = styles.keywords },
    ["@keyword.debug"] = { link = "Debug" },
    ["@keyword.exception"] = { link = "Exception" },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@keyword.conditional.ternary"] = { link = "Operator" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@keyword.directive.define"] = { link = "Define" },

    -- Punctuation
    ["@punctuation"] = { fg = role("punctuation") },
    ["@punctuation.delimiter"] = { fg = role("punctuation") },
    ["@punctuation.bracket"] = { fg = role("punctuation") },
    ["@punctuation.special"] = { link = "SpecialChar" },

    -- Comments
    ["@comment"] = { link = "Comment" },
    ["@comment.documentation"] = { link = "SpecialComment" },
    ["@comment.error"] = { fg = c.black, bg = c.red, bold = true },
    ["@comment.warning"] = { fg = c.black, bg = c.yellow, bold = true },
    ["@comment.todo"] = { fg = c.black, bg = c.cyan, bold = true },
    ["@comment.note"] = { fg = c.black, bg = c.cyan, bold = true },

    -- Markup
    ["@markup"] = { fg = c.fg },
    ["@markup.strong"] = { fg = c.latte, bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { fg = c.gray, strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { fg = headings[1], bold = true },
    ["@markup.heading.1"] = { fg = headings[1], bold = true },
    ["@markup.heading.2"] = { fg = headings[2], bold = true },
    ["@markup.heading.3"] = { fg = headings[3], bold = true },
    ["@markup.heading.4"] = { fg = headings[4], bold = true },
    ["@markup.heading.5"] = { fg = headings[5], bold = true },
    ["@markup.heading.6"] = { fg = headings[6], bold = true },
    ["@markup.quote"] = { fg = ctx.darken(c.blue, 0.8, c.border), italic = true },
    ["@markup.math"] = { fg = c.purple },
    ["@markup.link"] = { fg = role("link") },
    ["@markup.link.label"] = { fg = role("label") },
    ["@markup.link.url"] = { fg = role("link"), underline = true },
    ["@markup.raw"] = { fg = role("raw") },
    ["@markup.raw.block"] = { fg = role("raw") },
    ["@markup.list"] = { fg = role("special") },
    ["@markup.list.checked"] = { fg = c.green },
    ["@markup.list.unchecked"] = { fg = c.subtle },

    -- Diffs
    ["@diff.plus"] = { link = "Added" },
    ["@diff.minus"] = { link = "Removed" },
    ["@diff.delta"] = { link = "Changed" },

    -- Markup languages such as HTML and Vue
    ["@tag"] = { fg = role("tag") },
    ["@tag.builtin"] = { fg = c.purple },
    ["@tag.attribute"] = { fg = role("tag_attribute"), italic = true },
    ["@tag.delimiter"] = { fg = role("tag_attribute") },
  }

  if opts.context then
    result = vim.tbl_extend("error", result, {
      TreesitterContext = { bg = ctx.solid(c.bg_alt) },
      TreesitterContextBottom = { sp = c.border, underline = true },
      TreesitterContextLineNumber = { fg = c.subtle, bg = ctx.solid(c.bg_alt) },
      TreesitterContextLineNumberBottom = { sp = c.border, underline = true },
      TreesitterContextSeparator = { fg = c.border },
    })
  end

  return result
end

return M
