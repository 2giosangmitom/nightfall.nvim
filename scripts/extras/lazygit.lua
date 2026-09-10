--- The lazygit theme, a YAML file where every color is a list of one or more
--- values. The extra values are attributes such as `bold`, which lazygit reads
--- from the same list as the color itself.

--- A `name:` key and its values, indented to sit under `gui.theme`.
---@param name string
---@param values string[] A color, optionally followed by attributes.
---@return string[]
---@private
local function entry(name, values)
  local lines = { "    " .. name .. ":" }

  for _, value in ipairs(values) do
    lines[#lines + 1] = string.format('      - "%s"', value)
  end

  return lines
end

---@param ctx NightfallCtx
---@return string[]
return function(ctx)
  local c, accent = ctx.c, ctx.accent

  local lines = { "gui:", '  nerdFontsVersion: "3"', "  border: rounded", "  theme:" }

  local theme = {
    { "activeBorderColor", { accent, "bold" } },
    { "inactiveBorderColor", { c.border } },
    { "searchingActiveBorderColor", { c.teal } },
    { "optionsTextColor", { c.cyan } },
    { "selectedLineBgColor", { c.overlay } },
    { "inactiveViewSelectedLineBgColor", { c.border } },
    { "defaultFgColor", { c.fg } },
    { "cherryPickedCommitBgColor", { c.bg } },
    { "cherryPickedCommitFgColor", { c.rose } },
    { "markedBaseCommitBgColor", { c.bg } },
    { "markedBaseCommitFgColor", { c.gold } },
    { "unstagedChangesColor", { c.red } },
  }

  for _, item in ipairs(theme) do
    vim.list_extend(lines, entry(item[1], item[2]))
  end

  lines[#lines + 1] = ""
  return lines
end
