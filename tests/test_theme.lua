local expect = MiniTest.expect
local config = require("nightfall.config")
local context = require("nightfall.context")
local theme = require("nightfall.theme")

--- Build the theme for a flavor under the given user options.
---@param flavor string
---@param opts? table
---@return table
local function build(flavor, opts)
  config.setup(opts or {})
  return theme.build(context.new(flavor, config.get()))
end

local T = MiniTest.new_set({
  hooks = { post_case = function() config.setup({}) end },
})

--- The same expectations hold for every flavor, so they are parametrized.
T["flavor"] = MiniTest.new_set({
  parametrize = { { "nightfall" }, { "deeper-night" }, { "maron" } },
})

T["flavor"]["builds without error"] = function(flavor)
  expect.no_error(function() build(flavor) end)
end

T["flavor"]["produces the same groups as nightfall"] = function(flavor)
  local reference = vim.tbl_keys(build("nightfall").highlights)
  local groups = vim.tbl_keys(build(flavor).highlights)

  table.sort(reference)
  table.sort(groups)
  expect.equality(groups, reference)
end

T["flavor"]["leaves no style table behind"] = function(flavor)
  for group, spec in pairs(build(flavor).highlights) do
    expect.equality(spec.style, nil, { fail_reason = group .. " still carries a style table" })
  end
end

T["flavor"]["gives every color a hex value or NONE"] = function(flavor)
  for group, spec in pairs(build(flavor).highlights) do
    for _, key in ipairs({ "fg", "bg", "sp" }) do
      local value = spec[key]
      if value ~= nil then
        expect.equality(value == "NONE" or value:match("^#%x%x%x%x%x%x$") ~= nil, true, {
          fail_reason = string.format("%s.%s is %s", group, key, vim.inspect(value)),
        })
      end
    end
  end
end

T["flavor"]["links only to a group it also defines"] = function(flavor)
  local highlights = build(flavor).highlights

  for group, spec in pairs(highlights) do
    if spec.link then
      expect.equality(highlights[spec.link] ~= nil, true, {
        fail_reason = string.format("%s links to the undefined group %s", group, spec.link),
      })
    end
  end
end

T["flavor"]["sets sixteen terminal colors"] = function(flavor)
  expect.equality(vim.tbl_count(build(flavor).terminal), 16)
end

--- Every user interface group Neovim documents under `:h highlight-groups`, up
--- to and including the ones 0.11 and 0.12 added. The vimscript parser groups
--- and the `User1..9` statusline slots are left out, because a colorscheme has
--- nothing useful to say about them.
local EDITOR_GROUPS = {
  "ColorColumn",
  "ComplHint",
  "ComplHintMore",
  "ComplMatchIns",
  "Conceal",
  "CurSearch",
  "Cursor",
  "CursorColumn",
  "CursorIM",
  "CursorLine",
  "CursorLineFold",
  "CursorLineNr",
  "CursorLineSign",
  "DiffAdd",
  "DiffChange",
  "DiffDelete",
  "DiffText",
  "DiffTextAdd",
  "Directory",
  "EndOfBuffer",
  "ErrorMsg",
  "FloatBorder",
  "FloatFooter",
  "FloatShadow",
  "FloatShadowThrough",
  "FloatTitle",
  "FoldColumn",
  "Folded",
  "IncSearch",
  "LineNr",
  "LineNrAbove",
  "LineNrBelow",
  "MatchParen",
  "Menu",
  "ModeMsg",
  "MoreMsg",
  "MsgArea",
  "MsgSeparator",
  "NonText",
  "Normal",
  "NormalFloat",
  "NormalNC",
  "OkMsg",
  "Pmenu",
  "PmenuBorder",
  "PmenuExtra",
  "PmenuExtraSel",
  "PmenuKind",
  "PmenuKindSel",
  "PmenuMatch",
  "PmenuMatchSel",
  "PmenuSbar",
  "PmenuSel",
  "PmenuShadow",
  "PmenuShadowThrough",
  "PmenuThumb",
  "PreInsert",
  "Question",
  "QuickFixLine",
  "Scrollbar",
  "Search",
  "SignColumn",
  "SnippetTabstop",
  "SnippetTabstopActive",
  "SpecialKey",
  "SpellBad",
  "SpellCap",
  "SpellLocal",
  "SpellRare",
  "StatusLine",
  "StatusLineNC",
  "StatusLineTerm",
  "StatusLineTermNC",
  "StderrMsg",
  "StdoutMsg",
  "Substitute",
  "TabLine",
  "TabLineFill",
  "TabLineSel",
  "TermCursor",
  "Title",
  "Tooltip",
  "VertSplit",
  "Visual",
  "VisualNOS",
  "WarningMsg",
  "Whitespace",
  "WildMenu",
  "WinBar",
  "WinBarNC",
  "WinSeparator",
  "lCursor",
}

--- Every group `:h group-name` lists for syntax highlighting.
local SYNTAX_GROUPS = {
  "Added",
  "Boolean",
  "Changed",
  "Character",
  "Comment",
  "Conditional",
  "Constant",
  "Debug",
  "Define",
  "Delimiter",
  "Error",
  "Exception",
  "Float",
  "Function",
  "Identifier",
  "Ignore",
  "Include",
  "Keyword",
  "Label",
  "Macro",
  "Number",
  "Operator",
  "PreCondit",
  "PreProc",
  "Removed",
  "Repeat",
  "Special",
  "SpecialChar",
  "SpecialComment",
  "Statement",
  "StorageClass",
  "String",
  "Structure",
  "Tag",
  "Todo",
  "Type",
  "Typedef",
  "Underlined",
}

T["flavor"]["covers every user interface group Neovim documents"] = function(flavor)
  local highlights = build(flavor).highlights

  for _, group in ipairs(EDITOR_GROUPS) do
    expect.equality(highlights[group] ~= nil, true, { fail_reason = group .. " is not defined" })
  end
end

T["flavor"]["covers every syntax group Neovim documents"] = function(flavor)
  local highlights = build(flavor).highlights

  for _, group in ipairs(SYNTAX_GROUPS) do
    expect.equality(highlights[group] ~= nil, true, { fail_reason = group .. " is not defined" })
  end
end

--- Every capture Neovim documents under treesitter-highlight-groups, plus
--- the two parent captures it gives a default of its own.
local CAPTURES = {
  "@attribute",
  "@attribute.builtin",
  "@boolean",
  "@character",
  "@character.special",
  "@comment",
  "@comment.documentation",
  "@comment.error",
  "@comment.note",
  "@comment.todo",
  "@comment.warning",
  "@constant",
  "@constant.builtin",
  "@constant.macro",
  "@constructor",
  "@diff.delta",
  "@diff.minus",
  "@diff.plus",
  "@function",
  "@function.builtin",
  "@function.call",
  "@function.macro",
  "@function.method",
  "@function.method.call",
  "@keyword",
  "@keyword.conditional",
  "@keyword.conditional.ternary",
  "@keyword.coroutine",
  "@keyword.debug",
  "@keyword.directive",
  "@keyword.directive.define",
  "@keyword.exception",
  "@keyword.function",
  "@keyword.import",
  "@keyword.modifier",
  "@keyword.operator",
  "@keyword.repeat",
  "@keyword.return",
  "@keyword.type",
  "@label",
  "@markup",
  "@markup.heading",
  "@markup.heading.1",
  "@markup.heading.2",
  "@markup.heading.3",
  "@markup.heading.4",
  "@markup.heading.5",
  "@markup.heading.6",
  "@markup.italic",
  "@markup.link",
  "@markup.link.label",
  "@markup.link.url",
  "@markup.list",
  "@markup.list.checked",
  "@markup.list.unchecked",
  "@markup.math",
  "@markup.quote",
  "@markup.raw",
  "@markup.raw.block",
  "@markup.strikethrough",
  "@markup.strong",
  "@markup.underline",
  "@module",
  "@module.builtin",
  "@number",
  "@number.float",
  "@operator",
  "@property",
  "@punctuation",
  "@punctuation.bracket",
  "@punctuation.delimiter",
  "@punctuation.special",
  "@string",
  "@string.documentation",
  "@string.escape",
  "@string.regexp",
  "@string.special",
  "@string.special.path",
  "@string.special.symbol",
  "@string.special.url",
  "@tag",
  "@tag.attribute",
  "@tag.builtin",
  "@tag.delimiter",
  "@type",
  "@type.builtin",
  "@type.definition",
  "@variable",
  "@variable.builtin",
  "@variable.member",
  "@variable.parameter",
  "@variable.parameter.builtin",
}

T["flavor"]["covers every treesitter capture Neovim documents"] = function(flavor)
  local highlights = build(flavor).highlights

  for _, capture in ipairs(CAPTURES) do
    expect.equality(highlights[capture] ~= nil, true, { fail_reason = capture .. " is not defined" })
  end
end

T["flavor"]["orders the terminal colors from black to white"] = function(flavor)
  local terminal = build(flavor).terminal
  local colors = require("nightfall.palette").get(flavor)

  expect.equality(terminal.terminal_color_0, colors.black)
  expect.equality(terminal.terminal_color_15, colors.white)
end

T["flavor"]["gives the bright terminal colors their own values"] = function(flavor)
  local terminal = build(flavor).terminal

  for slot = 0, 7 do
    expect.no_equality(terminal["terminal_color_" .. (slot + 8)], terminal["terminal_color_" .. slot])
  end
end

T["styles"] = MiniTest.new_set()

T["styles"]["fold user attributes into the group"] = function()
  local highlights = build("nightfall", { styles = { comments = { bold = true, italic = false } } }).highlights

  expect.equality(highlights.Comment.bold, true)
  expect.equality(highlights.Comment.italic, false)
end

T["options"] = MiniTest.new_set()

T["options"]["drop backgrounds when transparent"] = function()
  expect.equality(build("nightfall", { transparent = true }).highlights.Normal.bg, "NONE")
end

T["options"]["dim inactive windows on request"] = function()
  local plain = build("nightfall").highlights.NormalNC.fg
  local dimmed = build("nightfall", { dim_inactive = true }).highlights.NormalNC.fg

  expect.no_equality(dimmed, plain)
end

T["options"]["skip terminal colors when they are off"] = function()
  expect.equality(build("nightfall", { terminal_colors = false }).terminal, {})
end

T["integrations"] = MiniTest.new_set()

T["integrations"]["contribute their groups"] = function()
  expect.equality(build("nightfall").highlights.FlashLabel ~= nil, true)
end

T["integrations"]["each contribute at least one group"] = function()
  local config_defaults = require("nightfall.config").defaults.integrations

  for name in pairs(config_defaults) do
    local highlights =
      build("nightfall", { default_integrations = false, integrations = { [name] = config_defaults[name] } })
    expect.no_equality(
      vim.tbl_count(highlights.highlights),
      vim.tbl_count(build("nightfall", { default_integrations = false }).highlights),
      {
        fail_reason = "the " .. name .. " integration contributes nothing",
      }
    )
  end
end

T["integrations"]["are left out when disabled"] = function()
  local highlights = build("nightfall", { integrations = { flash = { enabled = false } } }).highlights
  expect.equality(highlights.FlashLabel, nil)
end

T["integrations"]["honour their own options"] = function()
  local bordered = build("nightfall", { integrations = { telescope = { enabled = true, style = "bordered" } } })
  local borderless = build("nightfall", { integrations = { telescope = { enabled = true, style = "borderless" } } })

  expect.equality(bordered.highlights.TelescopeBorder, { link = "FloatBorder" })
  expect.no_equality(borderless.highlights.TelescopeBorder, bordered.highlights.TelescopeBorder)
end

T["integrations"]["reject an unknown picker style"] = function()
  expect.error(
    function() build("nightfall", { integrations = { telescope = { enabled = true, style = "floaty" } } }) end,
    "unknown telescope style"
  )
end

T["overrides"] = MiniTest.new_set()

T["overrides"]["accept a table under all"] = function()
  local highlights = build("nightfall", { highlight_overrides = { all = { Normal = { bg = "#010203" } } } }).highlights
  expect.equality(highlights.Normal.bg, "#010203")
end

T["overrides"]["accept a function under all"] = function()
  local highlights = build("nightfall", {
    highlight_overrides = { all = function(colors) return { Normal = { bg = colors.red } } end },
  }).highlights

  expect.equality(highlights.Normal.bg, require("nightfall.palettes.nightfall").red)
end

T["overrides"]["accept a function under a flavor"] = function()
  local highlights = build("nightfall", {
    highlight_overrides = { nightfall = function(colors) return { Normal = { bg = colors.green } } end },
  }).highlights

  expect.equality(highlights.Normal.bg, require("nightfall.palettes.nightfall").green)
end

T["overrides"]["let a flavor win over all"] = function()
  local highlights = build("nightfall", {
    highlight_overrides = {
      all = { Normal = { bg = "#010203" } },
      nightfall = { Normal = { bg = "#040506" } },
    },
  }).highlights

  expect.equality(highlights.Normal.bg, "#040506")
end

T["overrides"]["apply to one flavor only"] = function()
  local opts = { highlight_overrides = { nightfall = { Normal = { bg = "#010203" } } } }
  expect.no_equality(build("maron", opts).highlights.Normal.bg, "#010203")
end

T["overrides"]["keep the keys they do not mention"] = function()
  local plain = build("nightfall").highlights.Normal.fg
  local highlights = build("nightfall", { highlight_overrides = { all = { Normal = { bg = "#010203" } } } }).highlights

  expect.equality(highlights.Normal.fg, plain)
end

T["overrides"]["replace palette colors"] = function()
  local highlights = build("nightfall", { color_overrides = { all = { bg = "#010203" } } }).highlights
  expect.equality(highlights.Normal.bg, "#010203")
end

return T
