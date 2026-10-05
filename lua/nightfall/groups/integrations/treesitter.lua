--- Treesitter capture groups. See `:h treesitter-highlight-groups`.
---
--- Every capture Neovim documents is defined here. Captures that mean exactly
--- what a legacy syntax group means are linked rather than colored, so a
--- `highlight_overrides` entry on the legacy group carries over to them.

local U = require("nightfall.color")
local palette = require("nightfall.palette")

local M = {}

---@param c NightfallPalette
---@param o NightfallOptions
---@param flavor NightfallFlavor
---@return table<string,table>
function M.get(c, o, flavor)
  local opts, styles = o.integrations.treesitter, o.styles or {}
  local winter = flavor == "winter"
  local deeper = flavor == "deeper-night"
  local maron = flavor == "maron"
  local on_accent = palette.on_accent(c, flavor)
  local punctuation = (deeper or maron) and c.lavender or c.gray
  local link = winter and c.blue or c.cyan
  local raw = winter and c.green or c.cream
  local special_string = winter and c.teal or c.cream

  --- Colors for the six markup heading levels.
  local headings = { winter and c.teal or c.green, c.pink, c.gold, c.lime, c.blue, c.cream }

  local result = {
    -- Variables
    ["@variable"] = { link = "Identifier" },
    ["@variable.builtin"] = {
      fg = flavor == "nightfall" and c.pink or winter and c.rose or c.peach,
      style = styles.variables,
    },
    ["@variable.parameter"] = { fg = winter and c.silver or c.latte, style = styles.parameters },
    ["@variable.parameter.builtin"] = { fg = c.pink, style = styles.parameters },
    ["@variable.member"] = { fg = maron and c.sand or winter and c.sky or c.lavender, style = styles.properties },

    -- Constants
    ["@constant"] = { link = "Constant" },
    ["@boolean"] = { link = "Boolean" },
    ["@number"] = { link = "Number" },
    ["@number.float"] = { link = "Float" },
    ["@constant.builtin"] = {
      fg = flavor == "nightfall" and c.lavender or winter and c.blue or c.pink,
      style = styles.constants,
    },
    ["@constant.macro"] = { link = "Macro" },

    -- Modules and namespaces
    ["@module"] = { fg = winter and c.teal or c.cream },
    ["@module.builtin"] = { fg = c.cyan },
    ["@label"] = { link = "Label" },

    -- Strings and characters
    ["@string"] = { link = "String" },
    ["@string.documentation"] = { fg = winter and c.teal or c.orange, style = styles.comments },
    ["@string.regexp"] = { fg = winter and c.cyan or c.blue },
    ["@string.escape"] = { fg = winter and c.cyan or c.blue },
    ["@string.special"] = { fg = special_string },
    ["@string.special.path"] = { fg = special_string, underline = true },
    ["@string.special.symbol"] = { fg = deeper and c.cream or maron and c.coral or c.purple },
    ["@string.special.url"] = { fg = link, underline = true },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "SpecialChar" },

    -- Types
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { fg = (deeper or maron) and c.cyan or c.sky, style = styles.types },
    ["@type.definition"] = { link = "Typedef" },

    -- Attributes and annotations
    ["@attribute"] = { fg = c.magenta },
    ["@attribute.builtin"] = { fg = c.blue },

    -- Properties
    ["@property"] = { fg = maron and c.peach or winter and c.blue or c.lavender, style = styles.properties },

    -- Functions
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { fg = (deeper or maron) and c.cream or c.cyan, style = styles.functions },
    ["@function.call"] = { link = "Function" },
    ["@function.macro"] = { link = "Macro" },
    ["@function.method"] = { link = "Function" },
    ["@function.method.call"] = { link = "Function" },
    ["@constructor"] = { fg = winter and c.blue or c.cyan },

    -- Operators
    ["@operator"] = { link = "Operator" },

    -- Keywords
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.coroutine"] = { fg = winter and c.gold or c.cream, style = styles.coroutines },
    ["@keyword.function"] = { link = "Keyword" },
    ["@keyword.operator"] = { fg = (deeper or maron) and c.yellow or c.silver, style = styles.keywords },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.type"] = { fg = winter and c.purple or c.cyan },
    ["@keyword.modifier"] = { fg = winter and c.purple or c.cyan },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.return"] = {
      fg = flavor == "nightfall" and c.coral or winter and c.red or c.blue,
      style = styles.keywords,
    },
    ["@keyword.debug"] = { link = "Debug" },
    ["@keyword.exception"] = { link = "Exception" },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@keyword.conditional.ternary"] = { link = "Operator" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@keyword.directive.define"] = { link = "Define" },

    -- Punctuation
    ["@punctuation"] = { fg = punctuation },
    ["@punctuation.delimiter"] = { fg = punctuation },
    ["@punctuation.bracket"] = { fg = punctuation },
    ["@punctuation.special"] = { link = "SpecialChar" },

    -- Comments
    ["@comment"] = { link = "Comment" },
    ["@comment.documentation"] = { link = "SpecialComment" },
    ["@comment.error"] = { fg = on_accent, bg = c.red, bold = true },
    ["@comment.warning"] = { fg = on_accent, bg = c.yellow, bold = true },
    ["@comment.todo"] = { fg = on_accent, bg = c.cyan, bold = true },
    ["@comment.note"] = { fg = on_accent, bg = c.cyan, bold = true },

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
    ["@markup.quote"] = { fg = U.darken(c.blue, 0.8, c.border), italic = true },
    ["@markup.math"] = { fg = c.purple },
    ["@markup.link"] = { fg = link },
    ["@markup.link.label"] = { fg = c.coral },
    ["@markup.link.url"] = { fg = link, underline = true },
    ["@markup.raw"] = { fg = raw },
    ["@markup.raw.block"] = { fg = raw },
    ["@markup.list"] = { fg = deeper and c.sky or maron and c.lavender or c.cyan },
    ["@markup.list.checked"] = { fg = c.green },
    ["@markup.list.unchecked"] = { fg = c.subtle },

    -- Diffs
    ["@diff.plus"] = { link = "Added" },
    ["@diff.minus"] = { link = "Removed" },
    ["@diff.delta"] = { link = "Changed" },

    -- Markup languages such as HTML and Vue
    ["@tag"] = { fg = winter and c.rose or c.magenta },
    ["@tag.builtin"] = { fg = c.purple },
    ["@tag.attribute"] = { fg = winter and c.blue or c.cyan, italic = true },
    ["@tag.delimiter"] = { fg = winter and c.blue or c.cyan },
  }

  if opts.context then
    result = vim.tbl_extend("error", result, {
      TreesitterContext = { bg = U.background(c.bg_alt, o.transparent) },
      TreesitterContextBottom = { sp = c.border, underline = true },
      TreesitterContextLineNumber = { fg = c.subtle, bg = U.background(c.bg_alt, o.transparent) },
      TreesitterContextLineNumberBottom = { sp = c.border, underline = true },
      TreesitterContextSeparator = { fg = c.border },
    })
  end

  return result
end

return M
