--- Highlights for the language-agnostic syntax groups. See `:h group-name`.
---
--- Which color a flavor gives to each of these is decided in |nightfall-roles|,
--- so this module says what a group means and the role map says how a flavor
--- paints it.

local M = {}

---@param ctx NightfallCtx
---@return table<string,table>
function M.get(ctx)
  local c, styles, role = ctx.c, ctx.styles, ctx.role

  return {
    Comment = { fg = c.gray, style = styles.comments },
    SpecialComment = { fg = ctx.lighten(c.gray, 0.7, c.silver), style = styles.comments },

    Constant = { fg = role("constant"), style = styles.constants },
    String = { fg = role("string"), style = styles.strings },
    Character = { fg = role("character"), style = styles.characters },
    Number = { fg = role("number"), style = styles.numbers },
    Float = { link = "Number" },
    Boolean = { fg = role("boolean"), style = styles.booleans },

    Identifier = { fg = role("identifier"), style = styles.variables },
    Function = { fg = role("func"), style = styles.functions },

    Statement = { fg = role("statement") },
    Conditional = { fg = role("conditional"), style = styles.conditionals },
    Repeat = { fg = role("loop"), style = styles.loops },
    Label = { fg = role("label") },
    Operator = { fg = role("operator"), style = styles.operators },
    Keyword = { fg = role("keyword"), style = styles.keywords },
    Exception = { fg = role("exception"), style = styles.exceptions },

    PreProc = { fg = role("preproc") },
    Include = { fg = role("include") },
    Define = { link = "PreProc" },
    Macro = { link = "PreProc" },
    PreCondit = { link = "PreProc" },

    Type = { fg = role("type"), style = styles.types },
    StorageClass = { fg = role("storage") },
    Structure = { fg = role("type") },
    Typedef = { link = "Type" },

    Special = { fg = role("special") },
    SpecialChar = { fg = role("special_char") },
    Tag = { fg = role("tag") },
    Delimiter = { fg = role("delimiter") },
    Debug = { fg = ctx.role("debug") },

    Underlined = { fg = ctx.accent, underline = true },
    Ignore = { fg = c.subtle },
    Error = { fg = c.red },
    Todo = { fg = c.black, bg = c.sky, bold = true },

    -- Diff summary groups, used by `:h diff` and by plugins showing hunks.
    Added = { fg = c.green },
    Changed = { fg = c.yellow },
    Removed = { fg = c.red },
  }
end

return M
