local expect = MiniTest.expect
local config = require("nightfall.config")

--- Each case starts from a clean configuration.
local T = MiniTest.new_set({
  hooks = { pre_case = function() config.setup({}) end },
})

T["defaults"] = MiniTest.new_set()

T["defaults"]["apply when nothing is passed"] = function()
  expect.equality(config.get().transparent, false)
  expect.equality(config.get().terminal_colors, true)
end

T["defaults"]["enable every integration"] = function()
  for name, opts in pairs(config.get().integrations) do
    expect.equality(opts.enabled, true, { fail_reason = name .. " is not enabled by default" })
  end
end

T["defaults"]["name an integration module that exists"] = function()
  for name in pairs(config.defaults.integrations) do
    local ok = pcall(require, "nightfall.groups.integrations." .. name)
    expect.equality(ok, true, { fail_reason = "no module for integration " .. name })
  end
end

T["defaults"]["mention every integration module that ships"] = function()
  for name in vim.fs.dir("lua/nightfall/groups/integrations") do
    local integration = name:gsub("%.lua$", "")
    expect.equality(config.defaults.integrations[integration] ~= nil, true, {
      fail_reason = "no default entry for the integration " .. integration,
    })
  end
end

T["setup"] = MiniTest.new_set()

T["setup"]["merges into the defaults rather than replacing them"] = function()
  config.setup({ styles = { comments = { bold = true } } })

  expect.equality(config.get().styles.comments, { italic = true, bold = true })
  expect.equality(config.get().styles.keywords, { italic = true })
end

T["setup"]["leaves the defaults table untouched"] = function()
  config.setup({ transparent = true })
  expect.equality(config.defaults.transparent, false)
end

T["setup"]["forgets options from an earlier call"] = function()
  config.setup({ transparent = true })
  config.setup({})

  expect.equality(config.get().transparent, false)
end

T["setup"]["disables every integration on request"] = function()
  config.setup({ default_integrations = false })
  expect.equality(config.get().integrations, {})
end

T["setup"]["keeps named integrations when the defaults are off"] = function()
  config.setup({ default_integrations = false, integrations = { flash = { enabled = true } } })
  expect.equality(config.get().integrations, { flash = { enabled = true } })
end

T["setup"]["disables the defaults on a repeated call too"] = function()
  config.setup({})
  config.setup({ default_integrations = false })

  expect.equality(config.get().integrations, {})
end

T["setup"]["accepts a function as a highlight override"] = function()
  local override = function(colors) return { Normal = { fg = colors.red } } end

  config.setup({ highlight_overrides = { all = override } })
  expect.equality(config.get().highlight_overrides.all, override)
end

T["validation"] = MiniTest.new_set()

T["validation"]["rejects an unknown option"] = function()
  expect.error(function() config.setup({ transparant = true }) end, "unknown option `transparant`")
end

T["validation"]["rejects an option of the wrong type"] = function()
  expect.error(function() config.setup({ transparent = "yes" }) end, "`transparent` expects a boolean")
end

T["validation"]["rejects a malformed integration"] = function()
  expect.error(
    function() config.setup({ integrations = { flash = true } }) end,
    "`integrations%.flash` expects a table"
  )
end

T["validation"]["rejects a malformed highlight override"] = function()
  expect.error(
    function() config.setup({ highlight_overrides = { all = "Normal" } }) end,
    "`highlight_overrides%.all` expects a table or a function"
  )
end

return T
