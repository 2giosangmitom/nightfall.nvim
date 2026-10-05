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

return T
