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
