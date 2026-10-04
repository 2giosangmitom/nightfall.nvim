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
  constant = { nightfall = "purple", ["deeper-night"] = "cream", maron = "coral", winter = "purple" },
  constant_builtin = { nightfall = "lavender", ["deeper-night"] = "pink", maron = "pink", winter = "blue" },
  string = { nightfall = "yellow", ["deeper-night"] = "yellow", maron = "sand", winter = "green" },
  string_special = { nightfall = "cream", ["deeper-night"] = "cream", maron = "cream", winter = "teal" },
  character = { nightfall = "peach", ["deeper-night"] = "purple", maron = "cyan", winter = "cyan" },
  number = { nightfall = "lavender", ["deeper-night"] = "teal", maron = "teal", winter = "orange" },
  boolean = { nightfall = "lavender", ["deeper-night"] = "pink", maron = "sky", winter = "magenta" },
  identifier = { nightfall = "latte", ["deeper-night"] = "yellow", maron = "peach", winter = "fg" },
  parameter = { nightfall = "latte", ["deeper-night"] = "latte", maron = "latte", winter = "silver" },
  variable_builtin = { nightfall = "pink", ["deeper-night"] = "peach", maron = "peach", winter = "rose" },
  property = { nightfall = "lavender", ["deeper-night"] = "lavender", maron = "peach", winter = "blue" },
  member = { nightfall = "lavender", ["deeper-night"] = "lavender", maron = "sand", winter = "sky" },
  func = { nightfall = "teal", ["deeper-night"] = "green", maron = "lime", winter = "teal" },
  func_builtin = { nightfall = "cyan", ["deeper-night"] = "cream", maron = "cream", winter = "cyan" },
  constructor = { nightfall = "cyan", ["deeper-night"] = "cyan", maron = "cyan", winter = "blue" },
  statement = { nightfall = "pink", ["deeper-night"] = "purple", maron = "green", winter = "magenta" },
  conditional = { nightfall = "pink", ["deeper-night"] = "purple", maron = "pink", winter = "purple" },
  loop = { nightfall = "green", ["deeper-night"] = "cyan", maron = "cyan", winter = "teal" },
  keyword = { nightfall = "pink", ["deeper-night"] = "coral", maron = "orange", winter = "purple" },
  exception = { nightfall = "coral", ["deeper-night"] = "blue", maron = "blue", winter = "red" },
  coroutine = { nightfall = "cream", ["deeper-night"] = "cream", maron = "cream", winter = "gold" },
  label = { nightfall = "coral", ["deeper-night"] = "coral", maron = "coral", winter = "coral" },
  operator = { nightfall = "silver", ["deeper-night"] = "yellow", maron = "yellow", winter = "silver" },
  preproc = { nightfall = "sky", ["deeper-night"] = "pink", maron = "pink", winter = "blue" },
  include = { nightfall = "pink", ["deeper-night"] = "cyan", maron = "cyan", winter = "cyan" },
  module = { nightfall = "cream", ["deeper-night"] = "cream", maron = "cream", winter = "teal" },
  type = { nightfall = "blue", ["deeper-night"] = "cyan", maron = "cyan", winter = "blue" },
  type_builtin = { nightfall = "sky", ["deeper-night"] = "cyan", maron = "cyan", winter = "sky" },
  storage = { nightfall = "cyan", ["deeper-night"] = "cyan", maron = "cyan", winter = "purple" },
  special = { nightfall = "cyan", ["deeper-night"] = "sky", maron = "lavender", winter = "cyan" },
  special_char = { nightfall = "coral", ["deeper-night"] = "coral", maron = "coral", winter = "orange" },
  tag = { nightfall = "magenta", ["deeper-night"] = "magenta", maron = "magenta", winter = "rose" },
  tag_attribute = { nightfall = "cyan", ["deeper-night"] = "cyan", maron = "cyan", winter = "blue" },
  delimiter = { nightfall = "silver", ["deeper-night"] = "lavender", maron = "lavender", winter = "silver" },
  punctuation = { nightfall = "gray", ["deeper-night"] = "lavender", maron = "lavender", winter = "gray" },
  attribute = { nightfall = "magenta", ["deeper-night"] = "magenta", maron = "magenta", winter = "magenta" },
  attribute_builtin = { nightfall = "blue", ["deeper-night"] = "blue", maron = "blue", winter = "blue" },
  heading = { nightfall = "green", ["deeper-night"] = "green", maron = "green", winter = "teal" },
  link = { nightfall = "cyan", ["deeper-night"] = "cyan", maron = "cyan", winter = "blue" },
  raw = { nightfall = "cream", ["deeper-night"] = "cream", maron = "cream", winter = "green" },
  debug = { nightfall = "purple", ["deeper-night"] = "purple", maron = "purple", winter = "magenta" },
  regexp = { nightfall = "blue", ["deeper-night"] = "blue", maron = "blue", winter = "cyan" },
  escape = { nightfall = "blue", ["deeper-night"] = "blue", maron = "blue", winter = "cyan" },
  docstring = { nightfall = "orange", ["deeper-night"] = "orange", maron = "orange", winter = "teal" },
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
