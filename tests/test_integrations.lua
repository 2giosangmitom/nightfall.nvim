local expect = MiniTest.expect
local config = require("nightfall.config")
local theme = require("nightfall.theme")
local T = MiniTest.new_set({ hooks = { post_case = function() config.setup() end } })

T["feature switches"] = MiniTest.new_set({
  parametrize = {
    { "snacks", "dashboard", "SnacksDashboardNormal", "SnacksNormal" },
    { "snacks", "indent", "SnacksIndent", "SnacksNormal" },
    { "snacks", "picker", "SnacksPicker", "SnacksNormal" },
    { "mini", "icons", "MiniIconsBlue", "MiniFilesNormal" },
    { "mini", "trailspace", "MiniTrailspace", "MiniFilesNormal" },
    { "mini", "indentscope", "MiniIndentscopeSymbol", "MiniFilesNormal" },
    { "native_lsp", "semantic_tokens", "@lsp.type.variable", "DiagnosticError" },
    { "treesitter", "context", "TreesitterContext", "@variable" },
  },
})

T["feature switches"]["only remove their own groups"] = function(name, feature, group, shared)
  for _, flavor in ipairs(require("nightfall").flavors) do
    config.setup()
    local enabled = theme.build(flavor, config.get()).highlights
    config.setup({ integrations = { [name] = { [feature] = false } } })
    local disabled = theme.build(flavor, config.get()).highlights
    expect.equality(enabled[group] ~= nil, true)
    expect.equality(disabled[group], nil)
    expect.equality(disabled[shared], enabled[shared])
    for key, spec in pairs(disabled) do
      expect.equality(spec, enabled[key], { fail_reason = flavor .. "." .. key })
    end
  end
end

T["scoped settings"] = function()
  for _, flavor in ipairs(require("nightfall").flavors) do
    local colors = require("nightfall.palette").get(flavor)
    for name, defaults in pairs(config.defaults.integrations) do
      local settings = vim.tbl_extend("force", vim.deepcopy(defaults), {
        transparent = true,
        styles = vim.deepcopy(config.defaults.styles),
      })
      local before = vim.deepcopy(settings)
      local groups = require("nightfall.groups.integrations." .. name).get(colors, settings, flavor)
      expect.equality(vim.tbl_count(groups) > 0, true, { fail_reason = name })
      expect.equality(settings, before, { fail_reason = name .. " mutated its settings" })
    end
  end
end

return T
