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
    ["@variable.parameter"] = { fg = colors.white, style = options.styles.parameters },
    ["@variable.parameter.builtin"] = { fg = colors.pink, style = options.styles.parameters },
    ["@variable.member"] = { fg = colors.lavender, style = options.styles.properties },

    -- Constants
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { fg = colors.pink, style = options.styles.constants },

    -- Modules or namespaces
    ["@module"] = { fg = colors.lavender },
    ["@module.builtin"] = { fg = colors.cyan },
    ["@label"] = { fg = colors.coral },

    -- Strings and characters
    ["@string.documentation"] = { fg = colors.orange },
    ["@string.regexp"] = { fg = colors.blue },
    ["@string.escape"] = { fg = colors.blue },
    ["@string.special"] = { fg = colors.cream },
    ["@string.special.url"] = { fg = colors.lime, undercurl = true },
    ["@character.special"] = { fg = colors.coral },

    -- Attributes or annotations
    ["@attribute"] = { fg = colors.pink },
    ["@attribute.builtin"] = { fg = colors.blue },

    -- Properties
    ["@property"] = { fg = colors.lavender },

    -- Functions
    ["@function.builtin"] = { fg = colors.cream },
    ["@function.macro"] = { fg = colors.rose },
    ["@constructor"] = { fg = colors.cyan },

    -- Operators
    ["@operator"] = { fg = colors.yellow },

    -- Keywords
    ["@keyword.coroutine"] = { fg = colors.cream, style = styles.coroutines },
    ["@keyword.operator"] = { fg = colors.yellow, style = styles.keywords },
    ["@keyword.import"] = { fg = colors.cyan },
    ["@keyword.debug"] = { fg = colors.purple },
    ["@keyword.exception"] = { fg = colors.blue, style = styles.exceptions },
    ["@keyword.conditional.ternary"] = { fg = colors.blue, style = styles.operators },

    -- Comments
    ["@comment.error"] = { fg = colors.red },
    ["@comment.warning"] = { fg = colors.yellow },
    ["@comment.todo"] = { fg = colors.bg, bg = colors.cyan },
    ["@comment.note"] = { fg = colors.bg, bg = colors.cyan },

    -- Markup
    ["@markup.heading"] = { fg = colors.green },
    ["@markup.heading.1"] = { fg = colors.green },
    ["@markup.heading.2"] = { fg = colors.pink },
    ["@markup.heading.3"] = { fg = colors.gold },
    ["@markup.heading.4"] = { fg = colors.lime },
    ["@markup.heading.5"] = { fg = colors.blue },
    ["@markup.heading.6"] = { fg = colors.cream },
    ["@markup.quote"] = { fg = utils.lighten(colors.gray, 1, colors.navy) },
    ["@markup.math"] = { fg = colors.purple },
    ["@markup.link"] = { fg = colors.azure, undercurl = true },
    ["@markup.raw"] = { fg = colors.cream },
  }

  if ts_opts.context then
    result =
      vim.tbl_deep_extend("error", result, require("nightfall.groups.integrations.treesitter.context").get(colors))
  end

  return result
end

return M
