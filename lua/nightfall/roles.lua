--- Which palette color each flavor gives to each syntax role.
---
--- Flavors differ in what they paint a string or a keyword, not in which
--- highlight groups they cover, so the difference is collected here rather than
--- spread across the group modules. Each entry names one role and the palette
--- color every flavor uses for it, which makes a flavor easy to retune by
--- reading down a single column.
---@tag nightfall-roles

local M = {}

--- Palette color per flavor, keyed by role name.
---@type table<string, table<NightfallFlavor, string>>
M.roles = {
  --                     nightfall     deeper-night   maron
  constant = { nightfall = "purple", ["deeper-night"] = "cream", maron = "coral" },
  constant_builtin = { nightfall = "lavender", ["deeper-night"] = "pink", maron = "pink" },
  string = { nightfall = "yellow", ["deeper-night"] = "yellow", maron = "sand" },
  string_special = { nightfall = "cream", ["deeper-night"] = "cream", maron = "cream" },
  character = { nightfall = "peach", ["deeper-night"] = "purple", maron = "cyan" },
  number = { nightfall = "lavender", ["deeper-night"] = "teal", maron = "teal" },
  boolean = { nightfall = "lavender", ["deeper-night"] = "pink", maron = "sky" },
  identifier = { nightfall = "latte", ["deeper-night"] = "yellow", maron = "peach" },
  parameter = { nightfall = "latte", ["deeper-night"] = "latte", maron = "latte" },
  variable_builtin = { nightfall = "pink", ["deeper-night"] = "peach", maron = "peach" },
  property = { nightfall = "lavender", ["deeper-night"] = "lavender", maron = "peach" },
  member = { nightfall = "lavender", ["deeper-night"] = "lavender", maron = "sand" },
  func = { nightfall = "teal", ["deeper-night"] = "green", maron = "lime" },
  func_builtin = { nightfall = "cyan", ["deeper-night"] = "cream", maron = "cream" },
  constructor = { nightfall = "cyan", ["deeper-night"] = "cyan", maron = "cyan" },
  statement = { nightfall = "pink", ["deeper-night"] = "purple", maron = "green" },
  conditional = { nightfall = "pink", ["deeper-night"] = "purple", maron = "pink" },
  loop = { nightfall = "green", ["deeper-night"] = "cyan", maron = "cyan" },
  keyword = { nightfall = "pink", ["deeper-night"] = "coral", maron = "orange" },
  exception = { nightfall = "coral", ["deeper-night"] = "blue", maron = "blue" },
  coroutine = { nightfall = "cream", ["deeper-night"] = "cream", maron = "cream" },
  label = { nightfall = "coral", ["deeper-night"] = "coral", maron = "coral" },
  operator = { nightfall = "silver", ["deeper-night"] = "yellow", maron = "yellow" },
  preproc = { nightfall = "sky", ["deeper-night"] = "pink", maron = "pink" },
  include = { nightfall = "pink", ["deeper-night"] = "cyan", maron = "cyan" },
  module = { nightfall = "cream", ["deeper-night"] = "cream", maron = "cream" },
  type = { nightfall = "blue", ["deeper-night"] = "cyan", maron = "cyan" },
  type_builtin = { nightfall = "sky", ["deeper-night"] = "cyan", maron = "cyan" },
  storage = { nightfall = "cyan", ["deeper-night"] = "cyan", maron = "cyan" },
  special = { nightfall = "cyan", ["deeper-night"] = "sky", maron = "lavender" },
  special_char = { nightfall = "coral", ["deeper-night"] = "coral", maron = "coral" },
  tag = { nightfall = "magenta", ["deeper-night"] = "magenta", maron = "magenta" },
  tag_attribute = { nightfall = "cyan", ["deeper-night"] = "cyan", maron = "cyan" },
  delimiter = { nightfall = "silver", ["deeper-night"] = "lavender", maron = "lavender" },
  punctuation = { nightfall = "gray", ["deeper-night"] = "lavender", maron = "lavender" },
  attribute = { nightfall = "magenta", ["deeper-night"] = "magenta", maron = "magenta" },
  attribute_builtin = { nightfall = "blue", ["deeper-night"] = "blue", maron = "blue" },
  heading = { nightfall = "green", ["deeper-night"] = "green", maron = "green" },
  link = { nightfall = "cyan", ["deeper-night"] = "cyan", maron = "cyan" },
  raw = { nightfall = "cream", ["deeper-night"] = "cream", maron = "cream" },
  debug = { nightfall = "purple", ["deeper-night"] = "purple", maron = "purple" },
  regexp = { nightfall = "blue", ["deeper-night"] = "blue", maron = "blue" },
  escape = { nightfall = "blue", ["deeper-night"] = "blue", maron = "blue" },
  docstring = { nightfall = "orange", ["deeper-night"] = "orange", maron = "orange" },
}

--- The color a flavor gives to one role.
---@param colors NightfallPalette Palette to read the color from.
---@param flavor NightfallFlavor Flavor to read the role of.
---@param name string Role name, as listed in |nightfall-roles|.
---@return string A `#RRGGBB` color string.
function M.get(colors, flavor, name)
  local role = M.roles[name]
  if not role then error(string.format("nightfall: unknown syntax role %q", name), 2) end

  local key = role[flavor]
  if not key then error(string.format("nightfall: role %q has no color for flavor %q", name, flavor), 2) end

  return colors[key]
end

return M
