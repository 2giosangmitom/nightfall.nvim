--- Enable `nvim-treesitter` with context support by adding this
--- to your Nightfall integrations config:
--- >lua
---   treesitter = { enabled = true, context = true }
--- <
---@tag nightfall.nvim_treesitter

local M = {}

---@param colors NightfallPalette
---@private
function M.get(colors)
  local Options = require("nightfall").Options
  local utils = require("nightfall.utils")

  -- Initialize the syntax highlighting settings
  local result = {
    -- Variables
    ["@variable"] = { link = "Identifier" },
    ["@variable.builtin"] = { fg = colors.peach, style = Options.styles.properties or {} },
    ["@variable.parameter"] = { fg = colors.foreground, style = Options.styles.variables or {} },
    ["@variable.member"] = { fg = colors.lavender, style = Options.styles.variables or {} },

    -- Constants
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { fg = colors.foreground, style = Options.styles.constants },
    ["@constant.macro"] = { fg = colors.lavender, style = Options.styles.constants },

    -- Strings
    ["@string"] = { link = "String" },
    ["@string.regex"] = { fg = colors.peach },
    ["@string.special.path"] = { link = "Special" },
    ["@string.special"] = { link = "Special" },
    ["@string.special.symbol"] = { fg = colors.light_cyan },
    ["@string.special.url"] = { fg = colors.lavender, style = { italic = true, underline = true } },
    ["@string.escape"] = { fg = colors.light_cyan },

    -- Functions
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { link = "Function" },
    ["@function.macro"] = { fg = colors.turquoise },
    ["@function.call"] = { fg = colors.turquoise },
    ["@function.method"] = { link = "Function" },
    ["@function.method.call"] = { fg = colors.turquoise },

    -- Constructors
    ["@constructor"] = { fg = colors.light_cyan },

    -- Punctuation
    ["@punctuation.bracket"] = { fg = colors.lavender },
    ["@punctuation.delimiter"] = { fg = colors.lavender },

    -- Modules
    ["@module"] = { fg = colors.lavender },

    -- Labels
    ["@label"] = { link = "Label" },

    -- Booleans
    ["@boolean"] = { link = "Boolean" },

    -- Numbers
    ["@number"] = { link = "Number" },
    ["@number.float"] = { link = "Float" },

    -- Operators
    ["@operator"] = { link = "Operator" },

    -- Types
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { fg = colors.light_cyan, style = Options.styles.properties or {} },
    ["@type.definition"] = { link = "Typedef" },

    -- Attributes
    ["@attribute"] = { link = "Constant" },

    -- Properties
    ["@property"] = { fg = colors.lavender, style = Options.styles.properties or {} },

    -- Keywords
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.modifier"] = { link = "Keyword" },
    ["@keyword.type"] = { link = "Keyword" },
    ["@keyword.coroutine"] = { link = "Keyword" },
    ["@keyword.operator"] = { link = "Operator" },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.debug"] = { link = "Exception" },
    ["@keyword.exception"] = { link = "Exception" },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@keyword.conditional.ternary"] = { link = "Operator" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@keyword.directive.define"] = { link = "Define" },
    ["@keyword.export"] = { fg = colors.sky, style = Options.styles.keywords },

    -- Special Punctuation
    ["@punctuation.special"] = { link = "Special" },

    -- Comments
    ["@comment"] = { link = "Comment" },
    ["@comment.documentation"] = { link = "Comment" },
    ["@comment.error"] = { fg = colors.red, bg = utils.darken(colors.dark_navy, 0.95, colors.red) },
    ["@comment.warning"] = { fg = colors.pale_yellow, bg = utils.darken(colors.dark_navy, 0.95, colors.pale_yellow) },
    ["@comment.hint"] = { fg = colors.violet, bg = utils.darken(colors.dark_navy, 0.95, colors.violet) },
    ["@comment.todo"] = { fg = colors.black, bg = colors.turquoise },
    ["@comment.note"] = { fg = colors.black, bg = colors.violet },

    -- Diff
    ["@diff.plus"] = { link = "DiffAdd" },
    ["@diff.minus"] = { link = "DiffDelete" },
    ["@diff.delta"] = { link = "DiffChange" },

    -- Markup
    ["@markup"] = { fg = colors.foreground },
    ["@markup.strong"] = { fg = colors.light_cyan, style = { bold = true } },
    ["@markup.italic"] = { fg = colors.peach, style = { italic = true } },
    ["@markup.strikethrough"] = { fg = colors.foreground, style = { strikethrough = true } },
    ["@markup.underline"] = { link = "Underlined" },
    ["@markup.heading"] = { fg = colors.turquoise, style = { bold = true } },
    ["@markup.math"] = { fg = colors.light_cyan },
    ["@markup.quote"] = { fg = colors.pink, style = { bold = true } },
    ["@markup.environment"] = { fg = colors.violet },
    ["@markup.environment.name"] = { fg = colors.light_cyan },
    ["@markup.link"] = { link = "Tag" },
    ["@markup.link.label"] = { link = "Label" },
    ["@markup.link.url"] = { fg = colors.foreground, style = { italic = true, underline = true } },
    ["@markup.list"] = { link = "Special" },
    ["@markup.list.checked"] = { fg = colors.green },
    ["@markup.list.unchecked"] = { fg = colors.light_grey },

    -- Tags
    ["@tag"] = { fg = colors.light_cyan },
    ["@tag.attribute"] = { fg = colors.turquoise, style = { italic = true } },
    ["@tag.delimiter"] = { fg = colors.turquoise },

    -- Errors
    ["@error"] = { link = "Error" },
  }

  -- Add treesitter context if enabled
  if Options.integrations.treesitter.context then
    local treesitter_context_theme = {
      TreesitterContext = { bg = utils.darken(colors.dark_blue, 0.9, colors.background) },
      TreesitterContextBottom = {
        sp = colors.dark_navy,
      },
      TreesitterContextLineNumber = {
        fg = colors.light_grey,
        bg = colors.dark_blue,
      },
    }
    result = vim.tbl_deep_extend("force", result, treesitter_context_theme)
  end

  return result
end

return M
