local M = {}

---@alias NightfallTSOpts "context"

---@param colors NightfallPalette
---@param ts_opts table<NightfallTSOpts,boolean>
function M.get(colors, ts_opts)
  local options = require("nightfall.config").get_options()
  local styles = options.styles or {}
  local utils = require("nightfall.utils.colors")

  local result = {
    -- Variables
    ["@variable"] = { link = "Identifier" },
    ["@variable.builtin"] = { fg = colors.peach, style = options.styles.variables },
    ["@variable.parameter"] = {
      fg = utils.vary_color({ nightfall = colors.latte, nord = colors.white }, colors.latte),
      style = options.styles.parameters,
    },
    ["@variable.parameter.builtin"] = { fg = colors.pink, style = options.styles.parameters },
    ["@variable.member"] = {
      fg = utils.vary_color({ maron = colors.sand }, colors.lavender),
      style = options.styles.properties,
    },

    -- Constants
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { fg = colors.pink, style = options.styles.constants },

    -- Modules or namespaces
    ["@module"] = { fg = colors.cream },
    ["@module.builtin"] = { fg = colors.cyan },
    ["@label"] = { fg = colors.coral },

    -- Strings and characters
    ["@string.documentation"] = { fg = colors.orange },
    ["@string.regexp"] = { fg = colors.blue },
    ["@string.escape"] = { fg = colors.blue },
    ["@string.special"] = { fg = colors.cream },
    ["@string.special.url"] = { fg = colors.cyan },
    ["@character.special"] = { fg = colors.coral },

    -- Attributes or annotations
    ["@attribute"] = { fg = colors.magenta },
    ["@attribute.builtin"] = { fg = colors.blue },

    -- Properties
    ["@property"] = {
      fg = utils.vary_color({ maron = colors.peach, nord = colors.cyan }, colors.lavender),
    },

    -- Functions
    ["@function.builtin"] = { fg = colors.cream },
    ["@function.macro"] = { link = "PreProc" },
    ["@constructor"] = { fg = colors.cyan },

    -- Operators
    ["@operator"] = { fg = colors.yellow },

    -- Keywords
    ["@keyword.coroutine"] = { fg = colors.cream, style = styles.coroutines },
    ["@keyword.operator"] = {
      fg = colors.yellow,
      style = styles.keywords,
    },
    ["@keyword.import"] = { fg = colors.cyan },
    ["@keyword.debug"] = { fg = colors.purple },
    ["@keyword.exception"] = { fg = colors.blue, style = styles.exceptions },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@keyword.conditional.ternary"] = { link = "Operator" },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.type"] = { link = "Type" },

    -- Comments
    ["@comment.error"] = { fg = colors.black, bg = colors.red },
    ["@comment.warning"] = { fg = colors.black, bg = colors.yellow },
    ["@comment.todo"] = { fg = colors.black, bg = colors.cyan },
    ["@comment.note"] = { fg = colors.black, bg = colors.cyan },

    -- Markup
    ["@markup.heading"] = { fg = colors.green, bold = true },
    ["@markup.heading.1"] = { fg = colors.green, bold = true },
    ["@markup.heading.2"] = { fg = colors.pink, bold = true },
    ["@markup.heading.3"] = { fg = colors.gold, bold = true },
    ["@markup.heading.4"] = { fg = colors.lime, bold = true },
    ["@markup.heading.5"] = { fg = colors.blue, bold = true },
    ["@markup.heading.6"] = { fg = colors.cream, bold = true },
    ["@markup.quote"] = { fg = utils.darken(colors.blue, 0.8, colors.charcoal) },
    ["@markup.math"] = { fg = colors.purple },
    ["@markup.link"] = { fg = colors.cyan },
    ["@markup.raw"] = { fg = colors.cream },

    -- HTML, Vue,...
    ["@tag"] = { fg = colors.magenta },
    ["@tag.attribute"] = { fg = colors.cyan, italic = true },
    ["@tag.builtin"] = { fg = colors.purple },
    ["@tag.delimiter"] = { fg = colors.cyan },
  }

  if ts_opts.context or false then
    result =
      vim.tbl_deep_extend("error", result, require("nightfall.groups.integrations.treesitter.context").get(colors))
  end

  return result
end

return M
